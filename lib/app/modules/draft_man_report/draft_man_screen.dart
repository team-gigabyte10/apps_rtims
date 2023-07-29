import 'package:apps_rtims/app/modules/draft_man_report/draft_man_controller.dart';
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

class DraftManScreenView extends BaseView<DraftManController> {
  final _formKey = GlobalKey<FormState>();

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return getAppBar(context, "ড্রাফটম্যান প্রতিবেদন", enableBackButton: true,
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
    return Background(
        bgColor: ColorResources.whiteColor,
        child: Obx(() {
          return ListView(
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
                    inputField(
                        context, "নথি নং: ", Axis.horizontal, (value) {}),
                    8.height,
                    inputField(context, "আবেদনকারীর নাম:", Axis.horizontal,
                        (value) {}),
                    8.height,
                    inputField(context, "আর.এস.:", Axis.horizontal, (value) {}),
                    8.height,
                    inputField(
                        context, "বি.এস.: ", Axis.horizontal, (value) {}),
                    8.height,
                    inputField(context, "থানা:", Axis.horizontal, (value) {}),
                    8.height,
                    inputField(context, "মৌজা: ", Axis.horizontal, (value) {}),
                    8.height,
                    inputCondition(
                        "প্রদানকৃত দলিল/খতিয়ান অনুযায়ী মালিকানা সঠিক কি না:",
                        controller.isOwnership.value,
                        false,
                        Axis.vertical, (value) {
                      controller.isOwnership.value = value;
                    }),
                    8.height,
                    inputField(
                        context, "ক্রমিক নং:", Axis.horizontal, (value) {}),
                    8.height,
                    inputField(
                        context, "খতিয়ান নম্বর: ", Axis.horizontal, (value) {}),
                    8.height,
                    inputField(context, "বি.এস. দাগ নম্বর:", Axis.horizontal,
                        (value) {}),
                    8.height,
                    inputField(context, "জায়গার পরিমাণ: ", Axis.horizontal,
                        (value) {}),
                    8.height,
                    inputField(context, "মোট জায়গার পরিমাণ:", Axis.horizontal,
                        (value) {}),
                    8.height,
                    inputCondition(
                        "বি.এস. মৌজা ম্যাপ অনুযায়ী জমির অবস্থান চিহ্নিতকরণ সঠিক রয়েছে কি না:",
                        controller.isFieldPlace.value,
                        false,
                        Axis.vertical, (value) {
                      controller.isFieldPlace.value = value;
                    }),
                    8.height,
                    inputCondition(
                        "আর.এস. মৌজা ম্যাপ অনুযায়ী জমির অবস্থান চিহ্নিতকরণ সঠিক রয়েছে কি না: ",
                        controller.isFieldMap.value,
                        false,
                        Axis.vertical, (value) {
                      controller.isFieldMap.value = value;
                    }),
                    8.height,
                    inputCondition(
                        "সাইটটি চউক অনুমোদিত কোন এলাইনমেন্ট দ্বারা ক্ষতিগ্রস্ত/প্রস্তাবনা রয়েছে কি না:",
                        controller.isAlignmentDamaged.value,
                        false,
                        Axis.vertical, (value) {
                      controller.isAlignmentDamaged.value = value;
                    }),
                    8.height,
                    inputField(
                        context,
                        "বি.এস. মৌজা ম্যাপ অনুযায়ী জমির শ্রেণী: ",
                        Axis.horizontal,
                        (value) {}),
                    8.height,
                    inputField(
                        context, "অন্যান্য তথ্য:", Axis.horizontal, (value) {}),
                    8.height,
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
                        data["from"] = VisitOption.DRAFT_MAN_REPORT;

                        Get.offNamed(Routes.UPLOAD_ATTACHMENT, arguments: data);
                        Get.toNamed(Routes.UPLOAD_ATTACHMENT);
                        controller.showSuccessMessage("সাবমিট সম্পন্ন হয়েছে।");
                      },
                    ).paddingSymmetric(
                        horizontal: 100, vertical: Dimensions.paddingSizeSmall),
                  ],
                ),
              ).paddingAll(10),
              //SimpleRecorder()
            ],
          );
        }));
  }
}
