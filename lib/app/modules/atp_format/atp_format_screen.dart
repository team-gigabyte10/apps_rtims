import 'package:apps_rtims/utils/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
import 'package:get/get.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/extensions.dart';
import '../../../utils/utils.dart';
import '../../core/base/base_view.dart';
import '../../core/values/text_styles.dart';
import '../../core/widget/background.dart';
import '../../routes/app_pages.dart';
import '../bc_case_bi/bc_case_bi_screen.dart';
import '../dashboard/dashboard_screen.dart';
import 'atp_format_controller.dart';

class AtpFormatScreenView extends BaseView<AtpFormatController> {
  final _formKey = GlobalKey<FormState>();

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return getAppBar(context, "এটিপি ফরমেট", enableBackButton: true,
        onBackPressed: () async {
          final leavePage = await Utils.leaveDialog(context,
              title: appLocalization.msgLeave,
              cancelLabel: appLocalization.titleCancel,
              doneLabel: appLocalization.titleLeave);
          if (leavePage) {
            Get.back();
          }
    });
  }

  @override
  Widget body(BuildContext context) {
    double width = ContextExtensionss(context).width;
    return WillPopScope(
      onWillPop: () async {
        bool leavePage = await Utils.leaveDialog(context);
        return leavePage;
      },
      child: Background(
            child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "সাধারণ তথ্য",
                    style: formTitleStyleBold,
                  ),
                  10.height,
                  inputField(context, "নথি নং: ", Axis.horizontal,(value){}),
                  8.height,
                  inputField(context, "আবেদনকারীর নাম:", Axis.horizontal,(value){}),
                  8.height,
                  inputField(context, "আর.এস.:", Axis.horizontal,(value){}),
                  8.height,
                  inputField(context, "বি.এস.: ", Axis.horizontal,(value){}),
                  8.height,
                  inputField(context, "থানা:", Axis.horizontal,(value){}),
                  8.height,
                  inputField(context, "মৌজা: ", Axis.horizontal,(value){}),
                  8.height,
                  inputField(context, "চাহিদা ভূমির ব্যবহার:", Axis.horizontal,(value){}),
                  8.height,
                  inputField(context, "Occupancy Type:", Axis.horizontal,(value){}),
                  8.height,
                  inputField(context, "DAP Zoning: ", Axis.horizontal,(value){}),
                  8.height,
                  inputField(context, "বিবরণ:", Axis.horizontal,(value){}),
                  8.height,
                  inputField(context, "স্থির রাস্তার প্রসস্থতা: ", Axis.horizontal,(value){}),
                  8.height,
                  inputField(context, "পারপার্শ্বিক অবস্থার বিবরণ:", Axis.horizontal,(value){}),
                  8.height,
                  inputField(context, "রাস্তার প্রস্তাবনা (সাইড ভিজিট অনুযায়ী):", Axis.horizontal,(value){}),
                  8.height,
                  inputField(context, "মন্তব্য /বিবরণ /ব্যাখ্যা: ", Axis.horizontal,(value){}),
                  8.height,
                  inputField(context, "চাহিত ভূমি ব্যবহার:", Axis.horizontal,(value){}),
                  8.height,
                  inputField(context, "অন্যান্য বিবরণ: ", Axis.horizontal,(value){}),
                  10.height,
                  Divider(),
                  10.height,
                  ElevatedButton(
                    child: Text(
                      "Submit",
                      style: cardSmallTagStyle.copyWith(
                          color: ColorResources.whiteColor),
                    ),
                    onPressed: ()
                    {
                      final data = {};
                      data["refNo"] = "";
                      data["from"] = VisitOption.ATP_FORMAT;

                      Get.offNamed(Routes.UPLOAD_ATTACHMENT, arguments: data);
                    //  Get.toNamed(Routes.UPLOAD_ATTACHMENT);
                      controller.showSuccessMessage("সাবমিট সম্পন্ন হয়েছে।");
                    },
                  ).paddingSymmetric(horizontal: 100,vertical: Dimensions.paddingSizeSmall),

                ],
              ),
            ).paddingAll(10),
            //SimpleRecorder()
          ],
        ))

    );
  }

}
