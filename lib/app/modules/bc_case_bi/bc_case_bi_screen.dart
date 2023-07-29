import 'package:apps_rtims/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
import 'package:get/get.dart';

import '../../../utils/color_resources.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/extensions.dart';
import '../../../utils/utils.dart';
import '../../core/base/base_view.dart';
import '../../core/model/data_response.dart';
import '../../core/values/text_styles.dart';
import '../../core/widget/background.dart';
import '../dashboard/dashboard_screen.dart';
import 'bc_case_bi_controller.dart';

class BcCaseBiScreen extends BaseView<BcCaseBiController> {
  bool validation() {
    return true;
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return getAppBar(context, "BCCASE তদন্ত প্রতিবেদন", enableBackButton: true,
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
    return WillPopScope(
        onWillPop: () async {
          bool leavePage = await Utils.leaveDialog(context,
              title: appLocalization.msgLeave,
              cancelLabel: appLocalization.titleCancel,
              doneLabel: appLocalization.titleLeave);
          return leavePage;
        },
        child: Background(
          bgColor: ColorResources.whiteColor,
          child: Obx(() {
            return ListView(
              children: [
                Text(
                  "সাধারণ তথ্য",
                  style: formTitleStyleBold,
                ),
                8.height,
                inputField(
                    context, "ইমারত নির্মাণ নথির নম্বরঃ ", Axis.vertical, null,
                    initialValue: controller.fileMaster.value.refNo ?? "",
                    inputType: TextInputType.number),
                8.height,
                inputField(context, "১। আবেদনকারীর নাম:", Axis.vertical, null,
                    initialValue:
                        controller.fileMaster.value.applicantName ?? ""),
                8.height,
                inputField(context, "২। জমির মালিকের নাম:", Axis.vertical,
                    (value) {
                  controller.inspectionDetails.value.landOwnerName = value;
                },
                    initialValue:
                        (controller.inspectionDetails.value.landOwnerName ?? "")
                            .toString()),
                8.height,
                inputCondition(
                  "৩। জায়গাটি কি ইজারাকৃতঃ ",
                  controller.isLandUnderLease.value,
                  false,
                  Axis.horizontal,
                  (value) {
                    controller.isLandUnderLease.value = value;
                    controller.inspectionDetails.value.isLandUnderLease =
                        (value == BoolType.YES) ? true : false;
                  },
                ),
                8.height,
                Column(
                  children: [
                    inputField(
                        context, "কত সালের জন্য ইজারাকৃত:", Axis.vertical,
                        (value) {
                      controller.inspectionDetails.value.leaseYear =
                          value.toInt();
                    },
                        initialValue: controller
                            .inspectionDetails.value.leaseYear
                            .toString(),
                        inputType: TextInputType.number),
                    8.height,
                  ],
                ).visible(controller.isLandUnderLease.value == BoolType.YES),
                Divider(),
                Text(
                  "৪।(ক) প্রস্তাবিত নির্মাণ স্থলের বাস্তব মাপ",
                  style: formTitleStyleBold,
                ),
                inputField(context, "উত্তরেঃ (মিটার) ", Axis.horizontal,
                    (value) {
                  controller.inspectionDetails.value.actualProposedSizeNorth =
                      value;
                },
                    initialValue: controller
                        .inspectionDetails.value.actualProposedSizeNorth,
                    inputType: TextInputType.number),
                8.height,
                inputField(context, "দক্ষিণেঃ (মিটার) ", Axis.horizontal,
                    (value) {
                  controller.inspectionDetails.value.actualProposedSizeSouth =
                      value;
                },
                    initialValue: controller
                        .inspectionDetails.value.actualProposedSizeSouth,
                    inputType: TextInputType.number),
                8.height,
                inputField(context, "পূর্বেঃ (মিটার) ", Axis.horizontal,
                    (value) {
                  controller.inspectionDetails.value.actualProposedSizeEast =
                      value;
                },
                    initialValue: (controller.inspectionDetails.value
                                .actualProposedSizeEast ??
                            "")
                        .toString(),
                    inputType: TextInputType.number),
                8.height,
                inputField(context, "পশ্চিমেঃ (মিটার) ", Axis.horizontal,
                    (value) {
                  controller.inspectionDetails.value.actualProposedSizeWest =
                      value;
                },
                    initialValue: (controller.inspectionDetails.value
                                .actualProposedSizeWest ??
                            "")
                        .toString(),
                    inputType: TextInputType.number),
                8.height,
                inputField(
                    context, "(খ) জায়গার পরিমাপঃ (বর্গমিটার) ", Axis.horizontal,
                    (value) {
                  controller.inspectionDetails.value.actualProposedSizeLandQty =
                      value;
                },
                    initialValue: (controller.inspectionDetails.value
                                .actualProposedSizeLandQty ??
                            "")
                        .toString(),
                    inputType: TextInputType.number),
                8.height,
                inputCondition(
                    "৫। দরখাস্তকারী উক্ত দলিলে উল্লেখিত জমির প্রকৃত মালিক কিনা:",
                    controller.isApplicantLandOwner.value,
                    false,
                    Axis.vertical, (value) {
                  controller.isApplicantLandOwner.value = value;
                  controller.inspectionDetails.value.isApplicantLandOwner =
                      (value == BoolType.YES) ? true : false;
                }),
                8.height,
                inputField(
                    context, "৬। জায়গার তপশীলঃ (বর্গমিটার) ", Axis.vertical,
                    (value) {
                  controller.inspectionDetails.value.landTopShil = value;
                },
                    initialValue:
                        (controller.inspectionDetails.value.landTopShil ?? "")
                            .toString(),
                    inputType: TextInputType.number),
                8.height,
                Divider(),
                Text(
                  "জমি বা প্লটে বিদ্যমান বাড়ি/কাঠামোর বিবরণ",
                  style: formTitleStyleBold,
                ),
                inputField(context, "আর.এস। দাগ নংঃ ", Axis.horizontal, null,
                    initialValue:
                        (controller.fileMaster.value.rsNo ?? "").toString()),
                8.height,
                inputField(context, "বি.এস। দাগ নংঃ ", Axis.horizontal, null,
                    initialValue:
                        (controller.fileMaster.value.bsNo ?? "").toString()),
                8.height,
                inputField(context, "আর.এস। খতিয়ান নংঃ ", Axis.horizontal,
                    (value) {
                  controller.inspectionDetails.value.rsKhotian = value;
                },
                    initialValue:
                        (controller.inspectionDetails.value.rsKhotian ?? "")
                            .toString()),
                8.height,
                inputField(context, "থানাঃ ", Axis.horizontal, null,
                    initialValue:
                        (controller.fileMaster.value.thanaNameBangla ?? "")),
                8.height,
                inputField(context, "মৌজার নামঃ ", Axis.horizontal, null,
                    initialValue:
                        (controller.fileMaster.value.mouzaNameBangla ?? "")),
                8.height,
                inputField(context, "লে আউট প্লট নংঃ ", Axis.horizontal,
                    (value) {
                  controller.inspectionDetails.value.layOutPlotNo = value;
                },
                    initialValue:
                        controller.inspectionDetails.value.layOutPlotNo),
                8.height,
                inputField(context, "এলাকাঃ ", Axis.horizontal, (value) {
                  controller.inspectionDetails.value.landArea = value;
                },
                    initialValue:
                        (controller.inspectionDetails.value.landArea ?? "")
                            .toString()),
                8.height,
                Divider(),
                Text(
                  "৭।(১) প্রস্তাবিত দালানের আবৃতাংশের পরিমান",
                  style: formTitleStyleBold,
                ),
                inputField(context, "(ক) ১ম তলাঃ ", Axis.horizontal, (value) {
                  controller.inspectionDetails.value
                      .proposedBuldingEnvelop1stFloor = value;
                },
                    initialValue: (controller.inspectionDetails.value
                                .proposedBuldingEnvelop1stFloor ??
                            "")
                        .toString(),
                    inputType: TextInputType.number),
                8.height,
                inputField(context, "(খ) ২য় তলা হইতেঃ ", Axis.horizontal,
                    (value) {
                  controller.inspectionDetails.value
                      .proposedBuldingEnvelopFrom2ndFloor = value;
                },
                    initialValue: (controller.inspectionDetails.value
                                .proposedBuldingEnvelopFrom2ndFloor ??
                            "")
                        .toString(),
                    inputType: TextInputType.number),
                8.height,
                inputField(context, "তলা পর্যন্তঃ ", Axis.horizontal, (value) {
                  controller.inspectionDetails.value
                      .proposedBuldingEnvelopTillTopFloor = value;
                },
                    initialValue: (controller.inspectionDetails.value
                                .proposedBuldingEnvelopTillTopFloor ??
                            "")
                        .toString(),
                    inputType: TextInputType.number),
                8.height,
                inputField(context, "(গ) সিঁড়িঃ ", Axis.horizontal, (value) {
                  controller.inspectionDetails.value
                      .proposedBuldingEnvelopStair = value;
                },
                    initialValue: (controller.inspectionDetails.value
                                .proposedBuldingEnvelopStair ??
                            "")
                        .toString(),
                    inputType: TextInputType.number),
                8.height,
                inputField(context, "সর্বমোটঃ ", Axis.horizontal, (value) {
                  controller.inspectionDetails.value
                      .proposedBuldingEnvelopStairTotal = value;
                },
                    initialValue: (controller.inspectionDetails.value
                                .proposedBuldingEnvelopStairTotal ??
                            "")
                        .toString(),
                    inputType: TextInputType.number),
                8.height,
                inputField(context, "(২) পার্কিংয়ের পরিমানঃ ", Axis.horizontal,
                    (value) {
                  controller.inspectionDetails.value
                      .proposedBuldingEnvelopParkingSpace = value;
                },
                    initialValue: (controller.inspectionDetails.value
                                .proposedBuldingEnvelopParkingSpace ??
                            "")
                        .toString(),
                    inputType: TextInputType.number),
                8.height,
                Divider(),
                Text(
                  "৮। সাইটে বর্তমানে কোন দালান/কাঠামো আছে কিনা (থাকলে উহার বিবরণ)",
                  style: formTitleStyleBold,
                ),
                Row(
                  children: [
                    RadioListTile(
                      title: Text("হ্যাঁ", style: formTitleStyle),
                      value: BoolType.YES,
                      groupValue: controller.isAnyExistingBuilding.value,
                      onChanged: (BoolType? value) {
                        if (value != null) {
                          controller.isAnyExistingBuilding.value = value;
                          controller.inspectionDetails.value
                                  .isAnyExistingBuilding =
                              (value == BoolType.YES) ? true : false;
                          ;
                        }
                      },
                      contentPadding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                    ).flexible(),
                    RadioListTile(
                      title: Text("না", style: formTitleStyle),
                      value: BoolType.NO,
                      groupValue: controller.isAnyExistingBuilding.value,
                      onChanged: (BoolType? value) {
                        if (value != null) {
                          controller.isAnyExistingBuilding.value = value;
                          controller.inspectionDetails.value
                                  .isAnyExistingBuilding =
                              (value == BoolType.YES) ? true : false;
                          ;
                        }
                      },
                      contentPadding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                    ).flexible(),
                    RadioListTile(
                      title: Text("প্রযোজ্য নহে", style: formTitleStyle),
                      value: BoolType.NOT_APPLICABLE,
                      groupValue: controller.isAnyExistingBuilding.value,
                      onChanged: (BoolType? value) {
                        if (value != null) {
                          controller.isAnyExistingBuilding.value = value;
                          controller.inspectionDetails.value
                                  .isAnyExistingBuilding =
                              (value == BoolType.YES) ? true : false;
                          ;
                        }
                      },
                      contentPadding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                    ).flexible().visible(false),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "(ক) প্রকৃতিঃ ",
                      style: formTitleStyle,
                    ),
                    DropdownButtonFormField(
                      value: controller.selectedBuildingType.value,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          isDense: true,
                          isCollapsed: true),
                      //To avoid long text overflowing.
                      isExpanded: true,
                      isDense: true,
                      // Put widgets in the drop down menu here
                      items: BuildingType.values.map((BuildingType value) {
                        return DropdownMenuItem<BuildingType>(
                          alignment: Alignment.center,
                          value: value,
                          child: Text(value.name ?? ""),
                        );
                      }).toList(),
                      /*                 items: controller.buildingType.map((TensionType value) {
                        return DropdownMenuItem<TensionType>(
                          alignment: Alignment.center,
                          value: value,
                          child: Text(value.name ?? ""),
                        );
                      }).toList(),*/
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedBuildingType.value = value;
                          controller.inspectionDetails.value
                              .existingBuildingNature = value.number;
                        }
                      },
                      onTap: () {},
                    ).paddingSymmetric(horizontal: 50),
                  ],
                ),
/*            inputField(context, "(ক) প্রকৃতিঃ ", Axis.horizontal, (value) {
                  controller.inspectionDetails.value.existingBuildingNature = value;
                },
                    initialValue: (controller
                                .inspectionDetails.value.existingBuildingNature ??
                            "")
                        .toString()),*/
                8.height,
                inputField(context, "পরিমানঃ ", Axis.horizontal, (value) {
                  controller.inspectionDetails.value.existingBuildingSize =
                      value;
                },
                    initialValue: (controller
                                .inspectionDetails.value.existingBuildingSize ??
                            "")
                        .toString()),
                8.height,
                inputField(
                    context,
                    "(খ) নকশা অনুমোদিত হইলে স্থিত দালান/কাঠামোর অংশ ভঙ্গিতে হইবেঃ ",
                    Axis.vertical, (value) {
                  controller.inspectionDetails.value.structureToProsture =
                      value;
                },
                    initialValue: (controller
                                .inspectionDetails.value.structureToProsture ??
                            "")
                        .toString()),
                8.height,
                inputCondition(
                    "৯। স্থিত দালানের পার্শে যে পরিমান উন্মুক্ত জায়গা সাইট প্ল্যানে দেখানো হইয়াছে তাহা সরেজমিনে আছে কিনাঃ ",
                    controller.isNearbyOpenSpaceOk.value,
                    false,
                    Axis.vertical, (value) {
                  controller.isNearbyOpenSpaceOk.value = value;
                  controller.inspectionDetails.value.isNearbyOpenSpaceOk =
                      (value == BoolType.YES) ? true : false;
                }),
                8.height,
                inputField(
                    context,
                    "১০। ঐ রাস্তার সহিত সংযোগকারী এবং সাইটে যাওয়ার স্থিত রাস্তার নামঃ ",
                    Axis.vertical, (value) {
                  controller.inspectionDetails.value.connectedRoadName = value;
                },
                    initialValue:
                        (controller.inspectionDetails.value.connectedRoadName ??
                                "")
                            .toString()),
                8.height,
                inputField(context, "(ক) উহার প্রসস্থতাঃ ", Axis.horizontal,
                    (value) {
                  controller.inspectionDetails.value.connectedRoadWidth = value;
                },
                    initialValue: (controller
                                .inspectionDetails.value.connectedRoadWidth ??
                            "")
                        .toString()),
                8.height,
                inputField(context, "(খ) কোন দিকেঃ ", Axis.horizontal, (value) {
                  controller.inspectionDetails.value.connectedRoadDirection =
                      value;
                },
                    initialValue: (controller.inspectionDetails.value
                                .connectedRoadDirection ??
                            "")
                        .toString()),
                8.height,
                inputField(
                    context,
                    "১১। স্থিত রাস্তা দিয়ে চলাচল অধিকার কিভাবে স্বীকৃতঃ ",
                    Axis.vertical,
                    initialValue: controller
                        .inspectionDetails.value.connectedRoadType, (value) {
                  controller.inspectionDetails.value.connectedRoadType = value;
                }),
                8.height,
                inputField(
                    context,
                    "১২। রাস্তা প্রস্তাবিত হইলে উক্ত রাস্তা দিয়ে চলাচল অধিকার কিভাবেঃ ",
                    Axis.vertical,
                    initialValue: controller.inspectionDetails.value
                        .connectedRoadProposedType, (value) {
                  controller.inspectionDetails.value.connectedRoadProposedType =
                      value;
                }),
                8.height,
                inputCondition(
                    "১৩। বর্তমানে সাইটে কাজ শুরু হইয়াছে কিনাঃ ",
                    controller.isLandSiteWorkStart.value,
                    false,
                    Axis.vertical, (value) {
                  controller.isLandSiteWorkStart.value = value;
                  controller.inspectionDetails.value.isLandSiteWorkStart =
                      (value == BoolType.YES) ? true : false;
                  //  controller.inspectionDetails.value.isStartingWork =  (value == BoolType.YES) ? true : false;;
                }),
                8.height,
                inputField(
                    context,
                    "১৪। উক্ত সাইটে বা সাইটের কোনো অংশে পূর্বে কোনো নির্মাণ অনুমোদন দেওয়া হইয়াছিল কিনা, থাকলে উহার বিবরণ ",
                    Axis.vertical,
                    initialValue: controller.inspectionDetails.value
                        .hasPreviousStructureApproval, (value) {
                  controller.inspectionDetails.value
                      .hasPreviousStructureApproval = value;
                }),
                /*  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "১৪। উক্ত সাইটে বা সাইটের কোনো অংশে পূর্বে কোনো নির্মাণ অনুমোদন দেওয়া হইয়াছিল কিনা, থাকলে উহার বিবরণ",
                      style: formTitleStyle,
                    ),
                    Row(
                      children: [
                        RadioListTile(
                          title: Text("হ্যাঁ", style: formTitleStyle),
                          value: BoolType.YES,
                          groupValue: controller.hasPreviousStructureApproval.value,
                          onChanged: (BoolType? value) {
                            if (value != null) {
                              controller.hasPreviousStructureApproval.value = value;
                            }
                          },
                          contentPadding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                        ).flexible(),
                        RadioListTile(
                          title: Text("না", style: formTitleStyle),
                          value: BoolType.NO,
                          groupValue:  controller.hasPreviousStructureApproval.value,
                          onChanged: (BoolType? value) {
                            if (value != null) {
                              controller.hasPreviousStructureApproval.value = value;
                            }
                          },
                          contentPadding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                        ).flexible(),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          hintText: "",
                          isCollapsed: true,
                          isDense: true),
                      style: formTitleStyle,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 4,
                      initialValue: controller.inspectionDetails.value.hasPreviousStructureApproval ,
                      onChanged: (value){
                        controller.inspectionDetails.value.hasPreviousStructureApproval = value;
                      },
                    )
                  ],
                ),*/
                8.height,
                /*    Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "১৫। উক্ত জায়গায় ৩-বি বা অন্যান্য ধারায় কোনো নোটিশ প্রদান করা হইয়াছিল কিনা, হইলে উহার বিবরণ",
                      style: formTitleStyle,
                    ),
                    Row(
                      children: [
                        RadioListTile(
                          title: Text("হ্যাঁ", style: formTitleStyle),
                          value: BoolType.YES,
                          groupValue: controller.isNoticed.value,
                          onChanged: (BoolType? value) {
                            if (value != null) {
                              controller.isNoticed.value = value;
                            }
                          },
                          contentPadding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                        ).flexible(),
                        RadioListTile(
                          title: Text("না", style: formTitleStyle),
                          value: BoolType.NO,
                          groupValue: controller.isNoticed.value,
                          onChanged: (BoolType? value) {
                            if (value != null) {
                              controller.isNoticed.value = value;
                            }
                          },
                          contentPadding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                        ).flexible(),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          hintText: "",
                          isCollapsed: true,
                          isDense: true),
                      style: formTitleStyle,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 4,
                    )
                  ],
                ),*/
                inputField(
                    context,
                    "১৫। উক্ত জায়গায় ৩-বি বা অন্যান্য ধারায় কোনো নোটিশ প্রদান করা হইয়াছিল কিনা, হইলে উহার বিবরণ ",
                    Axis.vertical,
                    initialValue: controller
                        .inspectionDetails.value.has3BOrOtherNotice, (value) {
                  controller.inspectionDetails.value.has3BOrOtherNotice = value;
                }),
                8.height,
                inputCondition(
                    "১৬। সাইট ও পারিপার্শিক জায়গা এবং মালিকানা সম্বন্ধে দরখাস্তকারী সঠিক বিবরণ দিয়েছে কিনাঃ ",
                    controller.isApplicationInformationOK.value,
                    false,
                    Axis.vertical, (value) {
                  controller.isApplicationInformationOK.value = value;
                  controller
                          .inspectionDetails.value.isApplicationInformationOK =
                      (value == BoolType.YES) ? true : false;
                }),
                8.height,
                Divider(),
                Text(
                  "পরিকল্পনা সংশ্লিষ্ট তথ্যাবলী",
                  style: formTitleStyleBold,
                ),
                inputField(
                    context,
                    "১৭। দরখাস্তকারীর জায়গায় যাওয়ার নিকটতম প্রধান রাস্তার নাম কিঃ ",
                    Axis.vertical,
                    initialValue: controller.inspectionDetails.value
                        .connectedMainRoadName, (value) {
                  controller.inspectionDetails.value.connectedMainRoadName =
                      value;
                }),
                8.height,
                inputField(
                    context,
                    "১৮। সাইটটির অবস্থান (প্রস্তাবিত জায়গা) কে,পি আই (কি পয়েন্ট ইনস্টেলেশান) এর ৩০ মিটারের মধ্যে কিনা? হইলে কত দূরে: ",
                    Axis.vertical,
                    initialValue: controller
                        .inspectionDetails.value.isInKpiArea30M, (value) {
                  controller.inspectionDetails.value.isInKpiArea30M = value;
                }),
                /* Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "১৮। সাইটটির অবস্থান (প্রস্তাবিত জায়গা) কে,পি আই (কি পয়েন্ট ইনস্টেলেশান) এর ৩০ মিটারের মধ্যে কিনা? হইলে কত দূরে:",
                      style: formTitleStyle,
                    ),
                    Row(
                      children: [
                        RadioListTile(
                          title: Text("হ্যাঁ", style: formTitleStyle),
                          value: BoolType.YES,
                          groupValue: controller.isLessThan30Meter.value,
                          onChanged: (BoolType? value) {
                            if (value != null) {
                              controller.isLessThan30Meter.value = value;
                            }
                          },
                          contentPadding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                        ).flexible(),
                        RadioListTile(
                          title: Text("না", style: formTitleStyle),
                          value: BoolType.NO,
                          groupValue: controller.isLessThan30Meter.value,
                          onChanged: (BoolType? value) {
                            if (value != null) {
                              controller.isLessThan30Meter.value = value;
                            }
                          },
                          contentPadding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                        ).flexible(),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          hintText: "",
                          isCollapsed: true,
                          isDense: true),
                      style: formTitleStyle,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 4,
                    )
                  ],
                ),*/
                8.height,
                inputCondition("১৯। বর্ণিত সাইট কি পাহাড়ী ভূমিঃ ",
                    controller.isHillLand.value, false, Axis.vertical, (value) {
                  controller.isHillLand.value = value;
                  controller.inspectionDetails.value.isHillLand =
                      (value == BoolType.YES) ? true : false;
                  //  controller.inspectionDetails.value.isHillLand = value;
                }),
                8.height,
                inputCondition("(ক) সাইট সংলগ্ন কোন পাহাড় আছে কিনাঃ ",
                    controller.isHillNear.value, false, Axis.vertical, (value) {
                  controller.isHillNear.value = value;
                  controller.inspectionDetails.value.isHillNear =
                      (value == BoolType.YES) ? true : false;
                }),
                8.height,
                inputField(
                    context, "(খ) পাহাড় থাকিলে কত দূরেঃ ", Axis.vertical,
                    initialValue: controller
                        .inspectionDetails.value.hIllDistance, (value) {
                  controller.inspectionDetails.value.hIllDistance = value;
                }),
                8.height,
                /*       inputField(
                    context,
                    "২০। প্রস্তাবিত জমি কি কৃষি জমি নাকি পুরাতন বসত বাড়ীঃ ",
                    Axis.vertical,
                    (value) {}),*/
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "২০। প্রস্তাবিত জমি কি কৃষি জমি নাকি পুরাতন বসত বাড়ীঃ ",
                      style: formTitleStyle,
                    ),
                    DropdownButtonFormField(
                      value: controller.selectedLandType.value,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          isDense: true,
                          isCollapsed: true),
                      //To avoid long text overflowing.
                      isExpanded: true,
                      isDense: true,
                      // Put widgets in the drop down menu here
                      items: LandType.values.map((LandType value) {
                        return DropdownMenuItem<LandType>(
                          alignment: Alignment.center,
                          value: value,
                          child: Text(value.name ?? ""),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedLandType.value = value;
                          controller.inspectionDetails.value.proposedLandType =
                              value.number;
                        }
                      },
                      onTap: () {},
                    ).paddingSymmetric(horizontal: 50),
                  ],
                ),
                8.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "২১। সাইটের ১২ মিটারের মধ্যে সকল কাঠামো দেখানো হইয়াছে কিনা? হইয়া থাকিলে কাঠামো সমূহের বর্তমান ব্যাবহার (উত্তরে, দক্ষিণে, পূর্বে, পশ্চিমে)ঃ ",
                      style: formTitleStyle,
                    ),
                    Row(
                      children: [
                        RadioListTile(
                          title: Text("হ্যাঁ", style: formTitleStyle),
                          value: BoolType.YES,
                          groupValue:
                              controller.isVisibleAllStructureIn12M.value,
                          onChanged: (BoolType? value) {
                            if (value != null) {
                              controller.isVisibleAllStructureIn12M.value =
                                  value;
                              controller.inspectionDetails.value
                                      .isVisibleAllStructureIn12M =
                                  (value == BoolType.YES) ? true : false;
                            }
                          },
                          contentPadding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                        ).flexible(),
                        RadioListTile(
                          title: Text("না", style: formTitleStyle),
                          value: BoolType.NO,
                          groupValue:
                              controller.isVisibleAllStructureIn12M.value,
                          onChanged: (BoolType? value) {
                            if (value != null) {
                              controller.isVisibleAllStructureIn12M.value =
                                  value;
                              controller.inspectionDetails.value
                                      .isVisibleAllStructureIn12M =
                                  (value == BoolType.YES) ? true : false;
                            }
                          },
                          contentPadding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                        ).flexible(),
                      ],
                    ),
                    inputField(context, "উত্তরেঃ ", Axis.horizontal,
                        initialValue: controller.inspectionDetails.value
                            .visibleAllStructureIn12MNorth, (value) {
                      controller.inspectionDetails.value
                          .visibleAllStructureIn12MNorth = value;
                    }),
                    8.height,
                    inputField(context, "দক্ষিণেঃ ", Axis.horizontal, (value) {
                      controller.inspectionDetails.value
                          .visibleAllStructureIn12MSouth = value;
                    },
                        initialValue: controller.inspectionDetails.value
                            .visibleAllStructureIn12MSouth),
                    8.height,
                    inputField(context, "পূর্বেঃ ", Axis.horizontal, (value) {
                      controller.inspectionDetails.value
                          .visibleAllStructureIn12MEast = value;
                    },
                        initialValue: (controller.inspectionDetails.value
                                    .visibleAllStructureIn12MEast ??
                                "")
                            .toString()),
                    8.height,
                    inputField(context, "পশ্চিমেঃ ", Axis.horizontal, (value) {
                      controller.inspectionDetails.value
                          .visibleAllStructureIn12MWest = value;
                    },
                        initialValue: (controller.inspectionDetails.value
                                    .visibleAllStructureIn12MWest ??
                                "")
                            .toString()),
                    8.height,
                  ],
                ),
                8.height,
                inputCondition(
                    "২২। সাইট সংলগ্ন কোন নালা আছে কিনাঃ ",
                    controller.isNearDrain.value,
                    false,
                    Axis.vertical, (value) {
                  controller.isNearDrain.value = value;
                  controller.inspectionDetails.value.isNearDrain =
                      (value == BoolType.YES) ? true : false;
                }),
                8.height,
                inputField(
                    context, "(ক) থাকিলে উহার প্রশস্থতা কতঃ ", Axis.vertical,
                    initialValue: controller
                        .inspectionDetails.value.drainLength, (value) {
                  controller.inspectionDetails.value.drainLength = value;
                }, inputType: TextInputType.number),
                8.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "(খ) উক্ত নালা পাকা নাকি কাঁচাঃ ",
                      style: formTitleStyle,
                    ),
                    DropdownButtonFormField(
                      value: controller.selectedDrainType.value,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          isDense: true,
                          isCollapsed: true),
                      //To avoid long text overflowing.
                      isExpanded: true,
                      isDense: true,
                      // Put widgets in the drop down menu here
                      items: DrainType.values.map((DrainType value) {
                        return DropdownMenuItem<DrainType>(
                          alignment: Alignment.center,
                          value: value,
                          child: Text(value.name ?? ""),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedDrainType.value = value;
                          controller.inspectionDetails.value.drainType =
                              value.number.toString();
                        }
                      },
                      onTap: () {},
                    ).paddingSymmetric(horizontal: 50),
                  ],
                ),
                8.height,
                inputCondition(
                    "২৩। প্রস্তাবিত ইমারত নির্মিত হইলে প্রাকৃতিক জল নিষ্কাশনে কোন বাধা হইবে কিনাাঃ ",
                    controller.isEffectedNaturalWaterFlow.value,
                    false,
                    Axis.vertical, (value) {
                  controller.isEffectedNaturalWaterFlow.value = value;
                  controller
                          .inspectionDetails.value.isEffectedNaturalWaterFlow =
                      (value == BoolType.YES) ? true : false;
                }),
                8.height,
                inputCondition(
                    "২৪। বাহিরের নর্দমার সহিত প্রস্তাবিত ইমারতের নর্দমার সংযোগ বর্তমান অবস্থায় : সম্ভব কিনাঃ ",
                    controller.isPossibleToConnectDrain.value,
                    false,
                    Axis.vertical, (value) {
                  controller.isPossibleToConnectDrain.value = value;
                  controller.inspectionDetails.value.isPossibleToConnectDrain =
                      (value == BoolType.YES) ? true : false;
                }),
                8.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "২৫। প্রস্তাবিত ইমারতের ১০ মিটারের মধ্যে কোন বৈদ্যুতিক স্থাপনা আছে কিনা, থাকিলে কত দূরেঃ ",
                      style: formTitleStyle,
                    ),
                    Row(
                      children: [
                        RadioListTile(
                          title: Text("হ্যাঁ", style: formTitleStyle),
                          value: BoolType.YES,
                          groupValue:
                              controller.hasElectricStructureIn10M.value,
                          onChanged: (BoolType? value) {
                            if (value != null) {
                              controller.hasElectricStructureIn10M.value =
                                  value;
                              controller.inspectionDetails.value
                                      .hasElectricStructureIn10M =
                                  (value == BoolType.YES) ? true : false;
                            }
                          },
                          contentPadding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                        ).flexible(),
                        RadioListTile(
                          title: Text("না", style: formTitleStyle),
                          value: BoolType.NO,
                          groupValue:
                              controller.hasElectricStructureIn10M.value,
                          onChanged: (BoolType? value) {
                            if (value != null) {
                              controller.hasElectricStructureIn10M.value =
                                  value;
                              controller.inspectionDetails.value
                                      .hasElectricStructureIn10M =
                                  (value == BoolType.YES) ? true : false;
                            }
                          },
                          contentPadding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                        ).flexible(),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          hintText: "",
                          isCollapsed: true,
                          isDense: true),
                      style: formTitleStyle,
                      keyboardType: TextInputType.multiline,
                      initialValue: controller.inspectionDetails.value
                          .electricStructureIn10MDistance,
                      onChanged: (value) {
                        controller.inspectionDetails.value
                            .electricStructureIn10MDistance = value;
                      },
                      minLines: 1,
                      maxLines: 4,
                    )
                  ],
                ),
                8.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "২৬। নিকটস্থ বৈদ্যুতিক লাইনটি হাই-টেনশন নাকি লো-টেনশনঃ ",
                      style: formTitleStyle,
                    ),
                    DropdownButtonFormField(
                      value: controller.selectedElectricLineType.value,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          isDense: true,
                          isCollapsed: true),
                      //To avoid long text overflowing.
                      isExpanded: true,
                      isDense: true,
                      // Put widgets in the drop down menu here
                      items:
                          ElectricLineType.values.map((ElectricLineType value) {
                        return DropdownMenuItem<ElectricLineType>(
                          alignment: Alignment.center,
                          value: value,
                          child: Text(value.name ?? ""),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedElectricLineType.value = value;
                          controller.inspectionDetails.value
                              .nearElectricLineType = value.number;
                        }
                      },
                      onTap: () {},
                    ).paddingSymmetric(horizontal: 50),
                  ],
                ),
                8.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "২৭। সাইটের নিকট প্রতিরক্ষা বিভাগীয় কোন স্থাপনা আছে কিনা, থাকলে উহার বিবরণঃ ",
                      style: formTitleStyle,
                    ),
                    Row(
                      children: [
                        RadioListTile(
                          title: Text("হ্যাঁ", style: formTitleStyle),
                          value: BoolType.YES,
                          groupValue: controller.hasNearDefenceStructure.value,
                          onChanged: (BoolType? value) {
                            if (value != null) {
                              controller.hasNearDefenceStructure.value = value;
                              controller.inspectionDetails.value
                                      .hasNearDefenceStructure =
                                  (value == BoolType.YES) ? true : false;
                            }
                          },
                          contentPadding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                        ).flexible(),
                        RadioListTile(
                          title: Text("না", style: formTitleStyle),
                          value: BoolType.NO,
                          groupValue: controller.hasNearDefenceStructure.value,
                          onChanged: (BoolType? value) {
                            if (value != null) {
                              controller.hasNearDefenceStructure.value = value;
                              controller.inspectionDetails.value
                                      .hasNearDefenceStructure =
                                  (value == BoolType.YES) ? true : false;
                            }
                          },
                          contentPadding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                        ).flexible(),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          hintText: "",
                          isCollapsed: true,
                          isDense: true),
                      initialValue: controller
                          .inspectionDetails.value.nearDefenceStructureDetails,
                      style: formTitleStyle,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 4,
                      onChanged: (value) {
                        controller.inspectionDetails.value
                            .nearDefenceStructureDetails = value;
                      },
                    )
                  ],
                ),
                8.height,
                inputCondition(
                    "২৮। প্রস্তাবিত স্থানে কোন পুকুর, জলাশয় আছে কিনাঃ ",
                    controller.isLakeInProposedLand.value,
                    false,
                    Axis.vertical, (value) {
                  controller.isLakeInProposedLand.value = value;
                  controller.inspectionDetails.value.isLakeInProposedLand =
                      (value == BoolType.YES) ? true : false;
                }),
                8.height,
                inputCondition(
                    "২৯। প্রস্তাবিত স্থানে কোন ঐতিহাসিক স্থাপনা আছে কিনাঃ ",
                    controller.isHistoricalStructureInProposedLand.value,
                    false,
                    Axis.vertical, (value) {
                  controller.isHistoricalStructureInProposedLand.value = value;
                  controller.inspectionDetails.value
                          .isHistoricalStructureInProposedLand =
                      (value == BoolType.YES) ? true : false;
                }),
                8.height,
                inputCondition(
                    "৩০। সাইটটি সম্প্রতি পুকুর ভরাটের মাধ্যমে সৃষ্ট কিনাঃ ",
                    controller.isLandFillFromLake.value,
                    false,
                    Axis.vertical, (value) {
                  controller.isLandFillFromLake.value = value;
                  controller.inspectionDetails.value.isLandFillFromLake =
                      (value == BoolType.YES) ? true : false;
                }),
                8.height,
                inputCondition(
                    "৩১। প্রস্তাবিত দালান নির্মাণ করা হইলে পারিপার্শ্বিক অবস্থার উপর কোন বিরূপ প্রতিক্রিয়া হইবে কিনাঃ ",
                    controller.hasNaturalEffection.value,
                    false,
                    Axis.vertical, (value) {
                  controller.hasNaturalEffection.value = value;
                  controller.inspectionDetails.value.hasNaturalEffection =
                      (value == BoolType.YES) ? true : false;
                }),
                8.height,
                inputField(
                    context, "৩২। ভূমি ব্যবহার ছাড়পত্র নংঃ ", Axis.vertical,
                    initialValue: controller
                        .inspectionDetails.value.landClearanceNo, (value) {
                  controller.inspectionDetails.value.landClearanceNo = value;
                }),
                8.height,
                inputField(
                    context,
                    "৩৩। বিশেষ প্রকল্প ছাড়পত্র নংঃ ",
                    initialValue: controller
                        .inspectionDetails.value.landSpecialClearanceNo,
                    Axis.vertical, (value) {
                  controller.inspectionDetails.value.landSpecialClearanceNo =
                      value;
                }),
                8.height,
                ElevatedButton(
                  onPressed: () {
                    final data = {};
                    controller.saveInspectionDetailsBCCase((response) {
                      if (response is DataResponse) {
                        if (response.statusCode == 1) {
                          data["applicationFileMasterID"] = controller
                              .inspectionDetails.value.applicationFileMasterID;
                          data["from"] = VisitOption.BC_CASE_BI;
                          controller.updateApplicationFileGeofence((response2) {
                            if (response2 is DataResponse) {
                              if (response2.statusCode == 1) {
                                Get.offNamed(Routes.UPLOAD_ATTACHMENT,
                                    arguments: data);
                                controller.showSuccessMessage(
                                    "সাবমিট সম্পন্ন হয়েছে।");
                              }
                            }
                          });
                        }
                      }
                    }); //Get.arguments["id"]

                    //  Get.toNamed(Routes.UPLOAD_ATTACHMENT);
                  },
                  child: Text(
                    "সাবমিট",
                    style: TextStyle(fontSize: 18),
                  ),
                ).paddingSymmetric(
                    horizontal: 100, vertical: Dimensions.paddingSizeSmall),
              ],
            ).paddingAll(Dimensions.paddingSizeSmall).visible(
                controller.fileMaster.value.refNo != null ||
                    (controller.inspectionDetails.value
                            .inspectionDetailsBCSPCaseID >
                        0));
          }),
        ));
  }
}

Widget inputField(BuildContext context, String labelText, Axis direction,
    ValueChanged<String>? onChanged,
    {bool isAlign = true,
    String initialValue = "",
    TextInputType inputType = TextInputType.multiline}) {
  double width = ContextExtensionss(context).width;

  if (direction == Axis.horizontal) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labelText,
          style: formTitleStyle,
        ).expand(),
        if (isAlign)
          TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                hintText: "",
                isCollapsed: true,
                isDense: true),
            style: formTitleStyle,
            onChanged: onChanged,
            enabled: (onChanged != null),
            keyboardType: inputType,
            minLines: 1,
            maxLines: 4,
          ).width(width * 0.65)
        else
          TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                hintText: "",
                isCollapsed: true,
                isDense: true),
            onChanged: onChanged,
            enabled: (onChanged != null),
            style: formTitleStyle,
            keyboardType: inputType,
            minLines: 1,
            maxLines: 4,
          ).expand()
      ],
    );
  } else {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: formTitleStyle,
        ),
        TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              hintText: "",
              isCollapsed: true,
              isDense: true),
          onChanged: onChanged,
          enabled: (onChanged != null),
          style: formTitleStyle,
          keyboardType: inputType,
          minLines: 1,
          maxLines: 4,
        )
      ],
    );
  }
}

Widget inputCondition(
    String labelText,
    BoolType boolType,
    bool notApplicableVisible,
    Axis direction,
    ValueChanged<BoolType> onChanged) {
  if (direction == Axis.horizontal) {
    return Row(
      children: [
        Text(
          labelText,
          style: formTitleStyle,
        ),
        RadioListTile(
          title: Text(
            "হ্যাঁ",
            style: formTitleStyle,
          ),
          value: BoolType.YES,
          groupValue: boolType,
          onChanged: (BoolType? value) {
            if (value != null) {
              onChanged(value);
            }
          },
          contentPadding: EdgeInsets.zero,
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
        ).width(40).expand(),
        RadioListTile(
          title: Text("না", style: formTitleStyle),
          value: BoolType.NO,
          groupValue: boolType,
          onChanged: (BoolType? value) {
            if (value != null) {
              //  controller.visitOption.value = value;
              onChanged(value);
            }
          },
          contentPadding: EdgeInsets.zero,
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
        ).width(40).expand(),
        RadioListTile(
          title: Text("প্রযোজ্য নহে", style: formTitleStyle),
          value: BoolType.NOT_APPLICABLE,
          groupValue: boolType,
          onChanged: (BoolType? value) {
            if (value != null) {
              //  controller.visitOption.value = value;
              onChanged(value);
            }
          },
          contentPadding: EdgeInsets.zero,
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
        ).width(40).expand().visible(notApplicableVisible),
      ],
    );
  } else {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: formTitleStyle,
        ),
        Row(
          children: [
            RadioListTile(
              title: Text("হ্যাঁ", style: formTitleStyle),
              value: BoolType.YES,
              groupValue: boolType,
              onChanged: (BoolType? value) {
                if (value != null) {
                  onChanged(value);
                }
              },
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
            ).flexible(),
            RadioListTile(
              title: Text("না", style: formTitleStyle),
              value: BoolType.NO,
              groupValue: boolType,
              onChanged: (BoolType? value) {
                if (value != null) {
                  onChanged(value);
                }
              },
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
            ).flexible(),
            RadioListTile(
              title: Text("প্রযোজ্য নহে", style: formTitleStyle),
              value: BoolType.NOT_APPLICABLE,
              groupValue: boolType,
              onChanged: (BoolType? value) {
                if (value != null) {
                  //  controller.visitOption.value = value;
                  onChanged(value);
                }
              },
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
            ).flexible().visible(notApplicableVisible),
          ],
        )
      ],
    );
  }
}

Widget dashedInputField() {
  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          hintText: "0",
        ),
        style: formTitleStyle,
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 4,
      ).flexible(),
      2.height,
      FuDashedDivider(
        height: 1,
        dashSpace: 5,
      ).paddingSymmetric(horizontal: 5),
    ],
  );
}
