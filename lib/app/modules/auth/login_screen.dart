import 'dart:collection';
import 'dart:io';

import 'package:apps_rtims/flavors/environment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/color_resources.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/extensions.dart';
import '../../../utils/images.dart';
import '../../core/base/base_view.dart';
import '../../core/values/app_values.dart';
import '../../core/values/text_styles.dart';
import '../../core/widget/background.dart';
import '../../data/repository/auth/model/token_model.dart';
import '../../routes/app_pages.dart';
import 'auth_controller.dart';

class LoginView extends BaseView<AuthController> {
  final _formKey = GlobalKey<FormState>();
  String username = "";
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  static const String token_key = "Token";
  static const String user_key = "UserID";
  String version_code = "";

  bool validation() {
    if (username.isEmpty) {
      showSnackBar(Get.context!, appLocalization.msgUserIdNotValid);
      return false;
    }
    if (controller.password.isEmpty) {
      showSnackBar(Get.context!, appLocalization.msgPasswordNotValid);
      return false;
    }
    return true;
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Background(
      bgColor: ColorResources.whiteColor,
      child: Obx(() {
        return Column(children: [
          ListView(
            children: [
              40.height,
              Image.asset(
                ImagesAssets.rtimsLogo,
                width: 180,
                height: 180,
                fit: BoxFit.fitHeight,
              ).paddingSymmetric(horizontal: 10),
              Text(
                appLocalization.appTitleLong,
                textAlign: TextAlign.center,
                style: bigTitleStyle,
              ).paddingSymmetric(horizontal: 10),
              40.height,
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appLocalization.titleUserId,
                      textAlign: TextAlign.start,
                    ).paddingLeft(Dimensions.paddingSizeSmall),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      cursorColor: ColorResources.kPrimaryColor,
                      enabled: true,
                      controller: _usernameController,
                      onChanged: (username) {
                        this.username = username;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return appLocalization.msgUserIdNotValid;
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: appLocalization.hintUserId,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.person),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ).paddingAll(Dimensions.paddingSizeSmall),

                    Text(appLocalization.titlePassword)
                        .paddingLeft(Dimensions.paddingSizeSmall),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      onChanged: (password) {
                        controller.password = password;
                      },
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: appLocalization.hintPassword,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Icon(Icons.lock),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscureText.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: controller.toggle,
                        ),
                      ),
                      validator: (password) {
                        /* String pattern =
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
            RegExp regex = RegExp(pattern);*/
                        if (password == null || password.isEmpty) {
                          return appLocalization.msgPasswordNotValid;
                        } // else if (!regex.hasMatch(password))
                        //   return 'Enter valid password';
                        return null;
                      },
                      onSaved: (password) => controller.password = password!,
                      textInputAction: TextInputAction.done,
                      obscureText: controller.obscureText.value,
                    ).paddingAll(Dimensions.paddingSizeSmall),
                    ElevatedButton(
                      onPressed: () async {
                        // showLoaderDialog(context);
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState?.validate() == true) {
                          HashMap<String, String> hashmap = HashMap();
                          hashmap["userID"] = username;
                          hashmap["password"] = controller.password;
                          hashmap["lastAppVersion"] = await getVersionCode();

                          _submit(hashmap);
                        }
                      },
                      child: Text(
                        appLocalization.titleLogin,
                        style: TextStyle(fontSize: 18),
                      ),
                    ).paddingSymmetric(
                        horizontal: 100, vertical: Dimensions.paddingSizeSmall),
                    OutlinedButton(
                      onPressed: () {
                        Get.toNamed(Routes.BC_CASE_BI);
                      },
                      child: Text(
                        "As Developer",
                        style: TextStyle(fontSize: 18),
                      )
                    )
                        .paddingSymmetric(
                            horizontal: 50,
                            vertical: Dimensions.paddingSizeSmall)
                        .visible(env == Environment.DEVELOPMENT).inVisible(),
                  ],
                ),
              ).paddingAll(20),
            ],
          ).expand(),
          Container(
            alignment: Alignment.center,
            color: ColorResources.kPrimaryColor,
            height: 40,
            width: double.infinity,
            child: FutureBuilder(
              future: getVersionCode(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text(
                      '©Solution World Limited 2023, version: ${snapshot.data}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    );
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          )
        ]);
      }),
    );
  }

  _showVersionDialog(context, String severVersionCode, String appsFilePath,
      bool isForceDownload) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String title = "New Update available!";
        String message =
            "You are using old version of apps (V_$version_code). A new version $severVersionCode is available for download.";
        String btnLabel = "UPDATE NOW";
        return Platform.isIOS
            ? new CupertinoAlertDialog(
                title: Text(title),
                content: Text(message, textAlign: TextAlign.center),
                actions: <Widget>[
                  /*ElevatedButton(
                    child: Text(btnLabel),
                    onPressed: () => _launchURL("APP_STORE_URL"),
                  ),
                  ElevatedButton(
                    child: Text(btnLabelCancel),
                    onPressed: () => Navigator.pop(context),
                  ),*/
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: Text(btnLabel),
                        onPressed: () => _launchURL(appsFilePath),
                      ).paddingLeft(AppValues.smallPadding).flexible(),
                    ],
                  ),
                ],
              )
            : AlertDialog(
                title: Text(title, textAlign: TextAlign.center),
                content: Text(message, textAlign: TextAlign.center),
                actions: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        child: Text(
                          "Later",
                          style: cardSmallTagStyle.copyWith(
                              color: ColorResources.kPrimaryColor),
                        ),
                        onPressed: () => Navigator.pop(context),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0))),
                        ),
                      )
                          .widthAndHeight(width: double.infinity, height: 40.00)
                          .paddingRight(AppValues.halfPadding)
                          .flexible(),
                      ElevatedButton(
                        child: Text(
                          btnLabel,
                          style: cardSmallTagStyle.copyWith(
                              color: ColorResources.whiteColor),
                        ),
                        onPressed: () => _launchURL(appsFilePath),
                      )
                          .withHeight(40)
                          .paddingLeft(AppValues.halfPadding)
                          .flexible(),
                    ],
                  ).visible(!isForceDownload),
                  TextButton(
                    child: Text(
                      btnLabel,
                      style: cardSmallTagStyle.copyWith(
                          color: ColorResources.kPrimaryColor),
                    ),
                    onPressed: () => _launchURL(appsFilePath),
                  ).width(double.infinity).visible(isForceDownload)
                ],
              );
      },
    );
  }

  _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      controller.showErrorMessage('Could not launch $url');
      throw Exception('Could not launch $url');
    }
  }

  void _submit(HashMap<String, String> hashMap) async {
    if (validation()) {
      controller.login(hashMap, (response) async {
        if (response is TokenModel) {
          if (response.statusCode == 1) {
            Get.toNamed(Routes.DASHBOARD,
                arguments: {"local_version_code": version_code});
            /*var severVersionCode = response.responseObj?.appsVersion ?? "";
            var isForceDownload = response.responseObj?.isForceDownload ?? true;

            if ("V_$version_code" == severVersionCode) {
              controller.password = "";
              _passwordController.text = "";
              Get.toNamed(Routes.DASHBOARD,
                  arguments: {"local_version_code": version_code});
            } else {
              //  var file = await DefaultCacheManager().getSingleFile(response.responseObj?.appsFilePath ?? "");
              if (!isForceDownload) {
                Get.toNamed(Routes.DASHBOARD,
                    arguments: {"local_version_code": version_code});
              }
              _showVersionDialog(Get.context, severVersionCode,
                  response.responseObj?.appsFilePath ?? "", isForceDownload);
            }*/
          } else {
            showSnackBar(Get.context!, response.message);
          }
        }
      });
    }
  }

  Future<String> getVersionCode() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    version_code = packageInfo.version;
    return version_code;
  }
}
