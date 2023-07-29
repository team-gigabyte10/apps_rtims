import 'package:flutter/material.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
import 'package:get/get.dart';

import '../../../../utils/dimensions.dart';
import '../../../../utils/extensions.dart';
import '../../../../utils/utils.dart';
import '../../../core/base/base_view.dart';
import '../../../core/model/data_response.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/background.dart';
import '../../../routes/app_pages.dart';
import '../../bc_case_bi/bc_case_bi_controller.dart';
import '../../bc_case_bi/bc_case_bi_screen.dart';
import '../../dashboard/dashboard_screen.dart';

class TechnicalReportScreenView extends BaseView<BcCaseBiController> {
  final _formKey = GlobalKey<FormState>();

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return getAppBar(context, "টেকনিক্যাল প্রতিবেদন", enableBackButton: true,
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
    return WillPopScope(onWillPop: () async {
      bool leavePage = await Utils.leaveDialog(context,
          title: appLocalization.msgLeave,
          cancelLabel: appLocalization.titleCancel,
          doneLabel: appLocalization.titleLeave);
      return leavePage;
    }, child: Obx(() {
      return Background(
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
                inputField(
                    context,
                    "ইমারত নির্মাণ নথির নম্বরঃ ",
                    initialValue: controller.fileMaster.value.refNo ?? "",
                    Axis.horizontal,
                    null),
                8.height,
                inputField(
                    context,
                    "ইমারতের ব্যবহারঃ ",
                    initialValue:
                        controller.inspectionDetails.value.tRStructureuse,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRStructureuse = value;
                }),
                8.height,
                inputField(
                    context,
                    "তলার পরিমানঃ ",
                    initialValue:
                        controller.inspectionDetails.value.tRStructurefloor,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRStructurefloor = value;
                }),
                8.height,
                inputField(
                    context,
                    "ভূমির পরিমানঃ ",
                    initialValue:
                        controller.inspectionDetails.value.tRStructurearea,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRStructurearea = value;
                }),
                8.height,
                Text(
                  "প্রতি ফ্লোর সাইজঃ (বর্গমিটার) ",
                  style: formTitleStyleBold,
                ),
                10.height,
/*                  inputField(
                          context,
                          "প্রতি ফ্লোর সাইজঃ ",
                          initialValue:
                              controller.inspectionDetails.value.tRFloorsize1st,
                          Axis.horizontal,
                          (value) {
                            controller.inspectionDetails.value.tRFloorsize1st = value;
                          }),*/
                inputField(
                    context,
                    "নীচ তলাঃ ",
                    initialValue:
                        controller.inspectionDetails.value.tRFloorsize1st,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRFloorsize1st = value;
                }),
                8.height,
                inputField(
                    context,
                    "হইতে তলা পর্যন্তঃ ",
                    initialValue: controller
                        .inspectionDetails.value.tRFloorsizetilltypical,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRFloorsizetilltypical =
                      value;
                }),
                8.height,
                inputField(
                    context,
                    "MGC নীচ তলাঃ ",
                    initialValue:
                        controller.inspectionDetails.value.tRMgcgroundfloor,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRMgcgroundfloor = value;
                }),
                8.height,
                inputField(
                    context,
                    "MGC TYPICAL(%) হইতে তলা পর্যন্তঃ ",
                    initialValue: controller
                        .inspectionDetails.value.tRMGCFloorSizeTillTypical,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRMGCFloorSizeTillTypical =
                      value;
                }),
                8.height,
                inputField(
                    context,
                    "ভূমি ব্যবহার ছাড়পত্র নংঃ ",
                    initialValue:
                        controller.inspectionDetails.value.tRLandclearanceno,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRLandclearanceno = value;
                }),
                8.height,
                inputField(
                    context,
                    "জমার তারিখঃ ",
                    initialValue: controller
                        .inspectionDetails.value.tRLandclearancereceivedate,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value
                      .tRLandclearancereceivedate = value;
                }),
                8.height,
                inputField(
                    context,
                    "প্রদানের তারিখঃ ",
                    initialValue: controller
                        .inspectionDetails.value.tRLandclearancesubmitdate,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRLandclearancesubmitdate =
                      value;
                }),
                8.height,
                inputField(
                    context,
                    "বিশেষ প্রকল্প ছাড়পত্র নংঃ ",
                    initialValue: controller
                        .inspectionDetails.value.tRLandspecialclearanceno,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRLandspecialclearanceno =
                      value;
                }),
                8.height,
                inputField(
                    context,
                    "জমার তারিখঃ ",
                    initialValue: controller.inspectionDetails.value
                        .tRLandspecialclearancereceivedate,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value
                      .tRLandspecialclearancereceivedate = value;
                }),
                8.height,
                inputField(
                    context,
                    "প্রদানের তারিখঃ ",
                    initialValue: controller.inspectionDetails.value
                        .tRLandspecialclearancesubmitdate,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value
                      .tRLandspecialclearancesubmitdate = value;
                }),
                8.height,
                inputField(
                    context,
                    "রাস্তার নামঃ ",
                    initialValue:
                        controller.inspectionDetails.value.tRConnectedroadname,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRConnectedroadname =
                      value;
                }),
                8.height,
                inputField(
                    context,
                    "রাস্তার প্রসস্থতা (স্থিত)ঃ ",
                    initialValue:
                        controller.inspectionDetails.value.tRConnectedroadwidth,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRConnectedroadwidth =
                      value;
                }),
                8.height,
                inputField(
                    context,
                    "রাস্তার প্রসস্থতা (প্রস্তাবিত)ঃ ",
                    initialValue: controller
                        .inspectionDetails.value.tRConnectedroadwidthproposed,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value
                      .tRConnectedroadwidthproposed = value;
                }),
                8.height,
                inputField(
                    context,
                    "রাস্তার ছাড়ঃ ",
                    initialValue:
                        controller.inspectionDetails.value.tRRoadconcessions,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRRoadconcessions = value;
                }),
                8.height,
                inputField(
                    context,
                    "থানার নামঃ ",
                    initialValue:
                        controller.fileMaster.value.thanaNameBangla ?? "",
                    Axis.horizontal,
                    null),
                8.height,
                inputField(
                    context,
                    "মৌজা নামঃ ",
                    initialValue:
                        controller.fileMaster.value.mouzaNameBangla ?? "",
                    Axis.horizontal,
                    null),
                8.height,
                inputField(
                    context,
                    "নকশা প্রণয়নকারী স্থপতি প্রতিষ্ঠানঃ ",
                    initialValue:
                        controller.inspectionDetails.value.tRDesigncompany,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRDesigncompany = value;
                }),
                8.height,
                inputField(
                    context,
                    "ফোন নম্বরঃ ",
                    initialValue: controller
                        .inspectionDetails.value.tRDesigncompanymobile,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRDesigncompanymobile =
                      value;
                }),
                8.height,
                inputField(
                    context,
                    "নকশা প্রণয়নকারী প্রকৌশলীঃ ",
                    initialValue:
                        controller.inspectionDetails.value.tRDesignengineer,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRDesignengineer = value;
                }),
                8.height,
                inputField(
                    context,
                    "ফোন নম্বরঃ ",
                    initialValue: controller
                        .inspectionDetails.value.tRDesignengineermobile,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRDesignengineermobile =
                      value;
                }),
                8.height,
                inputField(
                    context,
                    "ইমারত পরিদর্শকঃ ",
                    initialValue: controller
                        .inspectionDetails.value.investigationOfficerName,
                    Axis.horizontal,
                    null),
                8.height,
                inputField(
                    context,
                    "ফোন নম্বরঃ ",
                    initialValue:
                        controller.inspectionDetails.value.tRStructurefloor,
                    Axis.horizontal,
                    null),
                8.height,
                inputField(
                    context,
                    "VOID এর সংখ্যাঃ ",
                    initialValue: controller.inspectionDetails.value.tRVoidno,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRVoidno = value;
                }),
                8.height,
                inputField(
                    context,
                    "VOID এর পরিমাপঃ ",
                    initialValue: controller.inspectionDetails.value.tRVoidsize,
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRVoidsize = value;
                }),
                8.height,
                inputField(
                    context,
                    "ফ্ল্যাট সংখ্যাঃ ",
                    initialValue: controller.inspectionDetails.value.tRFlatcount
                        .toString(),
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRFlatcount =
                      value.toInt();
                }, inputType: TextInputType.number),
                8.height,
                inputField(
                    context,
                    "কারপার্কিং সংখ্যাঃ ",
                    initialValue: controller
                        .inspectionDetails.value.tRCarparkingcount
                        .toString(),
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRCarparkingcount =
                      value.toInt();
                }, inputType: TextInputType.number),
                8.height,
                inputField(
                    context,
                    "মোটরবাইক পার্কিং সংখ্যাঃ ",
                    initialValue: controller
                        .inspectionDetails.value.tRBikeparkingcount
                        .toString(),
                    Axis.horizontal, (value) {
                  controller.inspectionDetails.value.tRBikeparkingcount =
                      value.toInt();
                }, inputType: TextInputType.number),
                Divider(),
                10.height,
                ElevatedButton(
                  child: Text(
                    "Submit",
                  ),
                  onPressed: () {
                    _submit();
                  },
                ).paddingSymmetric(
                    horizontal: 100, vertical: Dimensions.paddingSizeSmall),
              ],
            ),
          ).paddingAll(10),
          //SimpleRecorder()
        ],
      ).paddingAll(Dimensions.paddingSizeSmall).visible(
              controller.fileMaster.value.refNo != null ||
                  (controller
                          .inspectionDetails.value.inspectionDetailsBCSPCaseID >
                      0)));
    }));
  }

  void _submit() {
    final data = {};
    controller.saveInspectionDetailsBCCase((response) {
      controller.inspectionDetails.value.tRMouzaid =
          controller.fileMaster.value.mouzaID ?? 0;
      controller.inspectionDetails.value.tRThanaid =
          controller.fileMaster.value.thanaID ?? 0;
      if (response is DataResponse) {
        if (response.statusCode == 1) {
          data["applicationFileMasterID"] =
              controller.inspectionDetails.value.applicationFileMasterID;
          data["from"] = VisitOption.BC_CASE_BI;
          controller.updateApplicationFileGeofence((response2) {
            if (response2 is DataResponse) {
              if (response2.statusCode == 1) {
                Get.offNamed(Routes.UPLOAD_ATTACHMENT, arguments: data);
                controller.showSuccessMessage("সাবমিট সম্পন্ন হয়েছে।");
              }
            }
          });
        }
      }
    });
  }
}
