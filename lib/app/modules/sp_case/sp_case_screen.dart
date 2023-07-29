import 'package:apps_rtims/app/modules/sp_case/sp_case_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
import 'package:get/get.dart';

import '../../../utils/color_resources.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/extensions.dart';
import '../../../utils/utils.dart';
import '../../core/base/base_view.dart';
import '../../core/values/text_styles.dart';
import '../../core/widget/background.dart';
import '../../routes/app_pages.dart';
import '../bc_case_bi/bc_case_bi_controller.dart';
import '../bc_case_bi/bc_case_bi_screen.dart';
import '../bc_case_bi/tension_type.dart';
import '../dashboard/dashboard_screen.dart';

class SPCaseScreenView extends BaseView<SPCaseController> {
  final _formKey = GlobalKey<FormState>();

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return getAppBar(context, "এসপি কেস প্রতিবেদন", enableBackButton: true,
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
    return Background(
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
                context, "বিশেষ প্রকল্প নম্বরঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(
                context, "১। আবেদনকারীর নাম:", Axis.horizontal, (value) {}),
            8.height,
            inputField(
                context, "২। জমির মালিকের নাম:", Axis.horizontal, (value) {}),
            8.height,
            inputCondition("৩। জায়গাটি কি ইজারাকৃতঃ ",
                controller.isLeased.value, false, Axis.horizontal, (value) {
              controller.isLeased.value = value;
            }),
            8.height,
            inputField(context, "কত সালের জন্য ইজারাকৃত:", Axis.horizontal,
                (value) {}),
            8.height,
            Divider(),
            Text(
              "৪।(ক) প্রস্তাবিত নির্মাণ স্থলের বাস্তব মাপ",
              style: formTitleStyleBold,
            ),
            inputField(context, "উত্তরেঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(context, "দক্ষিণেঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(context, "পূর্বেঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(context, "পশ্চিমেঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(
                context, "(খ) জায়গার পরিমাপঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputCondition(
                "৫। দরখাস্তকারী উক্ত দলিলে উল্লেখিত জমির প্রকৃত মালিক কিনা:",
                controller
                    .isWhetherTheApplicantIsTheActualOwnerOfTheLandMentionedInTheSaidDocument
                    .value,
                false,
                Axis.vertical, (value) {
              controller
                  .isWhetherTheApplicantIsTheActualOwnerOfTheLandMentionedInTheSaidDocument
                  .value = value;
            }),
            8.height,
            inputField(
                context, "৬। জায়গার তপশীলঃ ", Axis.horizontal, (value) {}),
            8.height,
            Divider(),
            Text(
              "জমি বা প্লটে বিদ্যমান বাড়ি/কাঠামোর বিবরণ",
              style: formTitleStyleBold,
            ),
            inputField(context, "আর.এস। দাগ নংঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(context, "বি.এস। দাগ নংঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(
                context, "আর.এস। খতিয়ান নংঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(context, "থানাঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(context, "মৌজার নামঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(
                context, "লে আউট প্লট নংঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(context, "এলাকাঃ ", Axis.horizontal, (value) {}),
            8.height,
            Divider(),
            Text(
              "৭।(১) প্রস্তাবিত দালানের আবৃতাংশের পরিমান",
              style: formTitleStyleBold,
            ),
            inputField(context, "(ক) ১ম তলাঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(
                context, "(খ) ২য় তলা হইতেঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(context, "তলা পর্যন্তঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(context, "(গ) সিঁড়িঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(context, "সর্বমোটঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(context, "(২) পার্কিংয়ের পরিমানঃ ", Axis.horizontal,
                (value) {}),
            8.height,
            Divider(),
            Text(
              "৮। সাইটে বর্তমানে কোন দালান/কাঠামো আছে কিনা (থাকলে উহার বিবরণ)",
              style: formTitleStyleBold,
            ),
            inputField(context, "(ক) প্রকৃতিঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(context, "পরিমানঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(
                context,
                "(খ) নকশা অনুমোদিত হইলে স্থিত দালান/কাঠামোর অংশ ভঙ্গিতে হইবেঃ ",
                Axis.vertical,
                (value) {}),
            8.height,
            inputCondition(
                "৯। স্থিত দালানের পার্শে যে পরিমান উন্মুক্ত জায়গা সাইট প্ল্যানে দেখানো হইয়াছে তাহা সরেজমিনে আছে কিনাঃ ",
                controller.isExistingOpenField.value,
                false,
                Axis.vertical,
                (value) {controller.isExistingOpenField.value = value;
                }),
            8.height,
            inputField(
                context,
                "১০। ঐ রাস্তার সহিত সংযোগকারী এবং সাইটে যাওয়ার স্থিত রাস্তার নামঃ ",
                Axis.vertical,
                (value) {}),
            8.height,
            inputField(
                context, "(ক) উহার প্রসস্থতাঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(context, "(খ) কোন দিকেঃ ", Axis.horizontal, (value) {}),
            8.height,
            inputField(
                context,
                "১১। স্থিত রাস্তা দিয়ে চলাচল অধিকার কিভাবে স্বীকৃতঃ ",
                Axis.vertical,
                (value) {}),
            8.height,
            inputCondition("১২। বর্তমানে সাইটে কাজ শুরু হইয়াছে কিনাঃ ",
                controller.isStartingWork.value, false, Axis.vertical, (value) {
              controller.isStartingWork.value = value;
                }),
            8.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "১৩। উক্ত সাইটে বা সাইটের কোনো অংশে পূর্বে কোনো নির্মাণ অনুমোদন দেওয়া হইয়াছিল কিনা, থাকলে উহার বিবরণ",
                  style: formTitleStyle,
                ),
                Row(
                  children: [
                    RadioListTile(
                      title: Text("হ্যাঁ", style: formTitleStyle),
                      value: BoolType.YES,
                      groupValue: controller.isPermitted.value,
                      onChanged: (BoolType? value) {
                        if (value != null) {
                          controller.isPermitted.value = value;
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
                      groupValue: controller.isPermitted.value,
                      onChanged: (BoolType? value) {
                        if (value != null) {
                          controller.isPermitted.value = value;
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
            ),
            8.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "১৪। উক্ত জায়গায় ৩-বি বা অন্যান্য ধারায় কোনো নোটিশ প্রদান করা হইয়াছিল কিনা, হইলে উহার বিবরণ",
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
            ),
            8.height,
            inputCondition(
                "১৫। সাইট ও পারিপার্শিক জায়গা এবং মালিকানা সম্বন্ধে দরখাস্তকারী সঠিক বিবরণ দিয়েছে কিনাঃ ",
                controller.isValidStatement.value,
                false,
                Axis.vertical,
                (value) {
                  controller.isValidStatement.value = value;
                }),
            8.height,
            Divider(),
            Text(
              "পরিকল্পনা সংশ্লিষ্ট তথ্যাবলী",
              style: formTitleStyleBold,
            ),
            inputField(
                context,
                "১৬। দরখাস্তকারীর জায়গায় যাওয়ার নিকটতম প্রধান রাস্তার নাম কিঃ ",
                Axis.vertical,(value){}),
            8.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "১৭। সাইটটির অবস্থান (প্রস্তাবিত জায়গা) কে,পি আই (কি পয়েন্ট ইনস্টেলেশান) এর ৩০ মিটারের মধ্যে কিনা? হইলে কত দূরে:",
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
            ),
            8.height,
            inputCondition("১৮। বর্ণিত সাইট কি পাহাড়ী ভূমিঃ ",
                controller.isHillGround.value, false, Axis.vertical, (value) {
              controller.isHillGround.value = value;
            }),
            8.height,
            inputCondition("(ক) সাইট সংলগ্ন কোন পাহাড় আছে কিনাঃ ",
                controller.isExistHill.value, false, Axis.vertical, (value) {
              controller.isExistHill.value = value;
                }),
            8.height,
            inputField(context, "(খ) পাহাড় থাকিলে কত দূরেঃ ", Axis.vertical,
                (value) {}),
            8.height,
            inputField(
                context,
                "১৯। প্রস্তাবিত জমি কি কৃষি জমি নাকি পুরাতন বসত বাড়ীঃ ",
                Axis.vertical,
                (value) {}),
            8.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "২০। সাইটের ১২ মিটারের মধ্যে সকল কাঠামো দেখানো হইয়াছে কিনা? হইয়া থাকিলে কাঠামো সমূহের বর্তমান ব্যবহার (উত্তরে, দক্ষিণে, পূর্বে, পশ্চিমে)ঃ ",
                  style: formTitleStyle,
                ),
                Row(
                  children: [
                    RadioListTile(
                      title: Text("হ্যাঁ", style: formTitleStyle),
                      value: BoolType.YES,
                      groupValue: controller.isStructureWithin12Meter.value,
                      onChanged: (BoolType? value) {
                        if (value != null) {
                          controller.isStructureWithin12Meter.value = value;
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
                      groupValue: controller.isStructureWithin12Meter.value,
                      onChanged: (BoolType? value) {
                        if (value != null) {
                          controller.isStructureWithin12Meter.value = value;
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
            ),
            8.height,
            inputCondition("২১। সাইট সংলগ্ন কোন নালা আছে কিনাঃ ",
                controller.isExistDrain.value, false, Axis.vertical, (value) {
              controller.isExistDrain.value = value;
                }),
            8.height,
            inputField(context, "(ক) থাকিলে উহার প্রশস্থতা কতঃ ", Axis.vertical,
                (value) {}),
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
                  value: controller.selectedVehicleType.value,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      isDense: true,
                      isCollapsed: true),
                  //To avoid long text overflowing.
                  isExpanded: true,
                  isDense: true,
                  // Put widgets in the drop down menu here
                  items:
                      controller.lstVehicleType.map((TensionType value) {
                    return DropdownMenuItem<TensionType>(
                      alignment: Alignment.center,
                      value: value,
                      child: Text(value.name ?? ""),
                    );
                  }).toList(),
                  onChanged: (value) {},
                  onTap: () {},
                ).paddingSymmetric(horizontal: 50),
              ],
            ),
            8.height,
            inputCondition(
                "২২। প্রস্তাবিত ইমারত নির্মিত হইলে প্রাকৃতিক জল নিষ্কাশনে কোন বাধা হইবে কিনাাঃ ",
                controller.isDangerForWatering.value,
                false,
                Axis.vertical,
                (value) {controller.isDangerForWatering.value = value;
                }),
            8.height,
            inputCondition(
                "২৩। বাহিরের নর্দমার সহিত প্রস্তাবিত ইমারতের নর্দমার সংযোগ বর্তমান অবস্থায় : সম্ভব কিনাঃ ",
                controller.isPossibleConnectWithDrain.value,
                false,
                Axis.vertical,
                (value) {controller.isPossibleConnectWithDrain.value = value;
                }),
            8.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "২৪। প্রস্তাবিত ইমারতের ১০ মিটারের মধ্যে কোন বৈদ্যুতিক স্থাপনা আছে কিনা, থাকিলে কত দূরেঃ ",
                  style: formTitleStyle,
                ),
                Row(
                  children: [
                    RadioListTile(
                      title: Text("হ্যাঁ", style: formTitleStyle),
                      value: BoolType.YES,
                      groupValue: controller.isElectricLineAround10Meters.value,
                      onChanged: (BoolType? value) {
                        if (value != null) {
                          controller.isElectricLineAround10Meters.value = value;
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
                      groupValue: controller.isElectricLineAround10Meters.value,
                      onChanged: (BoolType? value) {
                        if (value != null) {
                          controller.isElectricLineAround10Meters.value = value;
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
            ),
            8.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "২৫। নিকটস্থ বৈদ্যুতিক লাইনটি হাই-টেনশন নাকি লো-টেনশনঃ ",
                  style: formTitleStyle,
                ),
                DropdownButtonFormField(
                  value: controller.selectedVehicleType.value,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      isDense: true,
                      isCollapsed: true),
                  //To avoid long text overflowing.
                  isExpanded: true,
                  isDense: true,
                  // Put widgets in the drop down menu here
                  items:
                      controller.lstVehicleType.map((TensionType value) {
                    return DropdownMenuItem<TensionType>(
                      alignment: Alignment.center,
                      value: value,
                      child: Text(value.name ?? ""),
                    );
                  }).toList(),
                  onChanged: (value) {},
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
                  "২৬। সাইটের নিকট প্রতিরক্ষা বিভাগীয় কোন স্থাপনা আছে কিনা, থাকলে উহার বিবরণঃ ",
                  style: formTitleStyle,
                ),
                Row(
                  children: [
                    RadioListTile(
                      title: Text("হ্যাঁ", style: formTitleStyle),
                      value: BoolType.YES,
                      groupValue: controller.isExistDefenceConstruction.value,
                      onChanged: (BoolType? value) {
                        if (value != null) {
                          controller.isExistDefenceConstruction.value = value;
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
                      groupValue: controller.isExistDefenceConstruction.value,
                      onChanged: (BoolType? value) {
                        if (value != null) {
                          controller.isExistDefenceConstruction.value = value;
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
            ),
            8.height,
            inputCondition("২৭। প্রস্তাবিত স্থানে কোন পুকুর, জলাশয় আছে কিনাঃ ",
                controller.isExistAnyPond.value, false, Axis.vertical, (value) {
              controller.isExistAnyPond.value = value;
                }),
            8.height,
            inputCondition(
                "২৮। প্রস্তাবিত স্থানে কোন ঐতিহাসিক স্থাপনা আছে কিনাঃ ",
                controller.isHistoricalBuildings.value,
                false,
                Axis.vertical,
                (value) {controller.isHistoricalBuildings.value = value;
                }),
            8.height,
            inputCondition(
                "২৯। সাইটটি সম্প্রতি পুকুর ভরাটের মাধ্যমে সৃষ্ট কিনাঃ ",
                controller.isPondFilled.value,
                false,
                Axis.vertical,
                (value) {
                  controller.isPondFilled.value = value;
                }),
            8.height,
            inputCondition(
                "৩০। প্রস্তাবিত দালান নির্মাণ করা হইলে পারিপার্শ্বিক অবস্থার উপর কোন বিরূপ প্রতিক্রিয়া হইবে কিনাঃ ",
                controller.isAffectOnEnvironment.value,
                false,
                Axis.vertical,
                (value) {
                  controller.isAffectOnEnvironment.value = value;
                }),
            8.height,
            inputField(context, "৩১। ভূমি ব্যবহার ছাড়পত্র নংঃ ",
                Axis.horizontal, (value) {}),
            12.height,
            ElevatedButton(
              onPressed: ()
              {
                final data = {};
                data["refNo"] = "";
                data["from"] = VisitOption.SP_CASE;

                Get.offNamed(Routes.UPLOAD_ATTACHMENT, arguments: data);
                Get.toNamed(Routes.UPLOAD_ATTACHMENT);
                controller.showSuccessMessage("সাবমিট সম্পন্ন হয়েছে।");
              },
              child: Text(
                "সাবমিট",
                style: TextStyle(fontSize: 18),
              ),
            ).paddingSymmetric(
                horizontal: 100, vertical: Dimensions.paddingSizeSmall),
          ],
        ).paddingAll(Dimensions.paddingSizeSmall);
      }),
    );
  }
}
