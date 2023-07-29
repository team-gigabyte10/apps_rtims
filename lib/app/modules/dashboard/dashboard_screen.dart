import 'dart:collection';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../flavors/build_config.dart';
import '../../../utils/color_resources.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../core/base/base_view.dart';
import '../../core/model/data_response.dart';
import '../../core/values/text_styles.dart';
import '../../core/widget/background.dart';
import '../../data/repository/dashboard/model/dashboard_model.dart';
import '../../routes/app_pages.dart';
import 'dashboard_controller.dart';

enum VisitOption {
  BC_CASE_BI,
  TECHNICAL_REPORT,
  ATP_FORMAT,
  DRAFT_MAN_REPORT,
  SP_CASE
}

class DashboardView extends BaseView<DashboardController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text(
        BuildConfig.instance.config.appName,
        style: appBarTitleWhiteTextStyle,
      ),
      backgroundColor: ColorResources.kPrimaryColor,
      titleSpacing: 10,
      elevation: 6,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            controller.determinePosition();
          },
          icon: const Icon(Icons.location_on_outlined),
          color: Colors.white,
        ),
        IconButton(
          onPressed: () {
            changePassword();
          },
          icon: Image.asset(ImagesAssets.changePassword),
          color: Colors.white,
        ),
        IconButton(
          onPressed: () {
            controller.clearUser();
            Get.back();
          },
          icon: const Icon(Icons.logout),
          color: Colors.white,
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    double width = ContextExtensionss(context).width;

    return Obx(() {
      return Background(
        child: ListView(
          physics: ScrollPhysics(),
          children: [
            GoogleMap(
              mapType: MapType.normal,
              onMapCreated: (mapController) =>
                  controller.mapController = mapController,
              gestureRecognizers: Set()
                ..add(
                    Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                ..add(Factory<ScaleGestureRecognizer>(
                    () => ScaleGestureRecognizer()))
                ..add(
                    Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer()))
                ..add(Factory<HorizontalDragGestureRecognizer>(
                    () => HorizontalDragGestureRecognizer())),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(controller.position?.latitude ?? 23.777176,
                    controller.position?.longitude ?? 90.399452),
                zoom: 6,
              ),
              markers: {
                Marker(
                    markerId: const MarkerId("MyLocation"),
                    position: LatLng(controller.position?.latitude ?? 23.777176,
                        controller.position?.longitude ?? 90.399452)),
              },
            ).withHeight(width),
            20.height,
            Column(
              children: [
                5.height,
                DottedBorder(
                  dashPattern: const [8, 4],
                  strokeWidth: 1,
                  strokeCap: StrokeCap.round,
                  borderType: BorderType.RRect,
                  color: Colors.blue,
                  radius: const Radius.circular(5),
                  child: Container(
                    width: double.infinity,
                    child: Text(
                            "${myPosition.value.latitude}, ${myPosition.value.longitude}",
                            style: TextStyle(fontWeight: FontWeight.bold))
                        .center(),
                  ),
                )
                    .paddingSymmetric(vertical: 5)
                    .widthAndHeight(width: 250, height: 40)
                    .center(),
              ],
            ),
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    RadioListTile(
                      title: const Text('BCCase তদন্ত প্রতিবেদন'),
                      value: VisitOption.BC_CASE_BI,
                      groupValue: controller.visitOption.value,
                      onChanged: (VisitOption? value) {
                        if (value != null) {
                          controller.visitOption.value = value;
                        }
                      },
                      contentPadding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                    ),
                    RadioListTile(
                      title: const Text('BCCase টেকনিক্যাল প্রতিবেদন'),
                      value: VisitOption.TECHNICAL_REPORT,
                      groupValue: controller.visitOption.value,
                      onChanged: (VisitOption? value) {
                        if (value != null) {
                          controller.visitOption.value = value;
                        }
                      },
                      contentPadding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                    ),
                    RadioListTile(
                      title: const Text('LUC এটিপি ফরমেট'),
                      value: VisitOption.ATP_FORMAT,
                      groupValue: controller.visitOption.value,
                      onChanged: (VisitOption? value) {
                        if (value != null) {
                          controller.visitOption.value = value;
                        }
                      },
                      contentPadding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                    ),
                    RadioListTile(
                      title: const Text('LUC ড্রাফটম্যান প্রতিবেদন'),
                      value: VisitOption.DRAFT_MAN_REPORT,
                      groupValue: controller.visitOption.value,
                      onChanged: (VisitOption? value) {
                        if (value != null) {
                          controller.visitOption.value = value;
                        }
                      },
                      contentPadding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                    ),
                    RadioListTile(
                      title: const Text('এসপি কেস'),
                      value: VisitOption.SP_CASE,
                      groupValue: controller.visitOption.value,
                      onChanged: (VisitOption? value) {
                        if (value != null) {
                          controller.visitOption.value = value;
                        }
                      },
                      contentPadding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                    ),
                  ],
                ).flexible(),
              ],
            ),
            ElevatedButton(
              onPressed: (controller.isMapLoading.value)
                  ? null
                  : () async {
                      controller.isMapLoading.value = true;
                      final position = await controller.determinePosition();
                      controller.isMapLoading.value = false;
                      if (position != null) {
                        if (controller.visitOption.value ==
                            VisitOption.BC_CASE_BI) {
                          Get.toNamed(Routes.FILE_LIST,
                              arguments: {"for": Routes.BC_CASE_BI});
                          //      Get.toNamed(Routes.BC_CASE_BI);
                        } else if (controller.visitOption.value ==
                            VisitOption.TECHNICAL_REPORT) {
                       //   Get.toNamed(Routes.TECHNICAL_REPORT);
                          Get.toNamed(Routes.FILE_LIST,
                              arguments: {"for": Routes.TECHNICAL_REPORT});
                        } else if (controller.visitOption.value ==
                            VisitOption.ATP_FORMAT) {
                          Get.toNamed(Routes.ATP_FORMAT);
                        } else if (controller.visitOption.value ==
                            VisitOption.DRAFT_MAN_REPORT) {
                          Get.toNamed(Routes.DRAFT_MAN_REPORT);
                        } else if (controller.visitOption.value ==
                            VisitOption.SP_CASE) {
                          Get.toNamed(Routes.SP_CASE);
                        } else {
                          // showErrorSnackBar("Not Available.");
                          //controller.showErrorMessage("Not Available.");
                        }
                      }
                    },
              child: (controller.isMapLoading.value)
                  ? const CircularProgressIndicator().center()
                  : Text(appLocalization.titleNext),
            ).paddingSymmetric(
                horizontal: 100, vertical: Dimensions.paddingSizeSmall),
          ],
        ),
      );
    });
  }

  void changePassword() {
    String currentPass = '', newPass = '', confrmPass = '';

    bool finalValidation() {
      if (currentPass.isEmpty) {
        Fluttertoast.showToast(
          msg: 'Please insert your current password',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
        return false;
      }
      if (newPass.isEmpty) {
        Fluttertoast.showToast(
          msg: 'Please insert your new password',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        return false;
      }
      if (confrmPass.isEmpty) {
        Fluttertoast.showToast(
          msg: 'Please insert your conform password',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        return false;
      }
      if (confrmPass != newPass) {
        Fluttertoast.showToast(
          msg: 'New password and Conform password not matched',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        return false;
      }
      return true;
    }

    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.00))),
        isScrollControlled: true,
        context: Get.context!,
        builder: (context) {
          return SafeArea(child: Obx(() {
            return Column(
              children: [
                Text(
                  style: titleStyle,
                  "Change Password",
                  textAlign: TextAlign.start,
                ).paddingSymmetric(horizontal: 10, vertical: 30),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: ColorResources.kPrimaryColor,
                  initialValue: currentPass,
                  obscureText: controller.obscureText1.value,
                  enabled: true,
                  onChanged: (text) {
                    currentPass = text;
                  },
                  decoration: InputDecoration(
                    hintText: "Current Password",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.lock),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscureText1.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.toggle1,
                    ),
                  ),
                ),
                10.height,
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: ColorResources.kPrimaryColor,
                  initialValue: newPass,
                  obscureText: controller.obscureText2.value,
                  enabled: true,
                  onChanged: (text) {
                    newPass = text;
                  },
                  decoration: InputDecoration(
                    hintText: "New Password",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.lock),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscureText2.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.toggle2,
                    ),
                  ),
                ),
                10.height,
                TextFormField(
                  textInputAction: TextInputAction.next,
                  cursorColor: ColorResources.kPrimaryColor,
                  initialValue: confrmPass,
                  obscureText: controller.obscureText3.value,
                  enabled: true,
                  onChanged: (text) {
                    confrmPass = text;
                  },
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.lock),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscureText3.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.toggle3,
                    ),
                  ),
                ),
                30.height,
                ElevatedButton(
                  onPressed: () {
                    if (finalValidation()) {
                      HashMap<String, dynamic> hashMap = new HashMap();
                      HashMap<String, dynamic> map = HashMap();

                      hashMap['CurrentPassword'] = currentPass;
                      hashMap['NewPassword'] = newPass;
                      hashMap['RetypePassword'] = confrmPass;
                      map["RequestObject"] = hashMap;

                      controller.passwordChange(map, (response) {
                        if (response is DataResponse<DashboardModel>) {
                          if (response.statusCode == 1) {
                            Navigator.pop(context);
                            controller.clearUser();
                            Get.back();
                            Fluttertoast.showToast(
                              msg: response.message,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                            );
                          } else {
                            //controller.showErrorMessage(response.message);
                            Fluttertoast.showToast(
                              msg: response.message,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                            );
                          }
                        }
                      });
                    }
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 14),
                  ),
                ).paddingAll(10),
              ],
            ).paddingAll(30);
          }));
        });
  }
}
