import 'dart:collection';
import 'dart:io';

import 'package:apps_rtims/app/core/model/upload_status.dart';
import 'package:apps_rtims/app/modules/dashboard/dashboard_screen.dart';
import 'package:apps_rtims/app/modules/global_controller.dart';
import 'package:apps_rtims/app/routes/app_pages.dart';
import 'package:apps_rtims/utils/color_resources.dart';
import 'package:apps_rtims/utils/compress_utils.dart';
import 'package:apps_rtims/utils/utils.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_compress/video_compress.dart';

import '../../../../utils/extensions.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../core/base/base_view.dart';
import '../../core/values/app_values.dart';
import '../../core/values/text_styles.dart';
import '../../core/widget/background.dart';
import '../../data/remote/new_inspection/dto/save_visit_dto.dart';
import '../new_inspection/views/simple_recorder.dart';

@immutable
class UploadAttachmentView extends BaseView<GlobalController> {
  final ImagePicker picker = ImagePicker();

  bool finalValidation() {
    if (controller.imageFiles.isEmpty &&
        controller.videoFile.isEmpty &&
        controller.documentFiles.isEmpty &&
        controller.mapFile.isEmpty &&
        controller.audioFile.isEmpty == true) {
      showSnackBar(Get.context!, appLocalization.msg1);
      return false;
    }
    return true;
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return getAppBar(context, appLocalization.titleUploadAttachment,
        enableBackButton: true, onBackPressed: () async {
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
        final leavePage = await Utils.leaveDialog(context,
            title: appLocalization.msgLeave,
            cancelLabel: appLocalization.titleCancel,
            doneLabel: appLocalization.titleLeave);
        return leavePage ?? false;
      },
      child: Obx(() {
        return Background(
            child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appLocalization.titleRefNumber,
                  style: titleStyle,
                  textAlign: TextAlign.start,
                ).paddingLeft(Dimensions.paddingSizeSmall),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: ColorResources.kPrimaryColor,
                  initialValue:
                      controller.data["applicationFileMasterID"].toString(),
                  enabled: false,
                  onChanged: (value) {},
                  validator: (phone) {
                    if (phone == null || phone.isEmpty) {
                      return appLocalization.msg2;
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: appLocalization.hintRefNumber,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ).paddingAll(10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    appLocalization.titleImageAttachment,
                    style: titleStyle,
                    textAlign: TextAlign.start,
                  ).paddingLeft(Dimensions.paddingSizeSmall).expand(),
                  Tooltip(
                    message: (controller.imageUploadStatus.value ==
                            UploadStatus.completed)
                        ? "Uploaded"
                        : "Not Uploaded",
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: (controller.imageUploadStatus.value ==
                              UploadStatus.completed)
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 10,
                              child: Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                    ),
                  ),
                  10.width,
                ],
              ),
              LinearProgressIndicator(
                value: (controller.imageUploadingProgress.value > 0.0)
                    ? controller.imageUploadingProgress.value
                    : null,
                backgroundColor: Colors.grey,
                minHeight: 8,
                semanticsLabel: "Uploading...",
                semanticsValue:
                    controller.imageUploadingProgress.value.toString(),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ).paddingSymmetric(horizontal: 10, vertical: 4).visible(
                  controller.imageUploadStatus.value ==
                      UploadStatus.inProgress),
              (controller.imageFiles.isNotEmpty)
                  ? SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (var value in controller.imageFiles)
                            previewImageWidget(value),
                        ],
                      ),
                    ).marginAll(Dimensions.marginSizeSmall)
                  : const SizedBox(),
              (controller.imageUploadStatus.value != UploadStatus.completed)
                  ? imagePickerWidget
                  : 0.height,
            ]),
            Divider(
              color: ColorResources.kSemiTransparent,
            ),
            //Audio
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              10.height,
              Row(
                children: [
                  Text(
                    appLocalization.titleAudioAttachment,
                    style: titleStyle,
                    textAlign: TextAlign.start,
                  ).paddingLeft(Dimensions.paddingSizeSmall).expand(),
                  Tooltip(
                    message: (controller.audioUploadStatus.value ==
                            UploadStatus.completed)
                        ? "Uploaded"
                        : "Not Uploaded",
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: (controller.audioUploadStatus.value ==
                              UploadStatus.completed)
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 10,
                              child: Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                    ),
                  ),
                  10.width
                ],
              ),
              LinearProgressIndicator(
                value: (controller.audioUploadingProgress.value > 0.0)
                    ? controller.audioUploadingProgress.value
                    : null,
                backgroundColor: Colors.grey,
                minHeight: 8,
                semanticsLabel: "Uploading...",
                semanticsValue:
                    controller.audioUploadingProgress.value.toString(),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ).paddingSymmetric(horizontal: 10, vertical: 4).visible(
                  controller.audioUploadStatus.value ==
                      UploadStatus.inProgress),
              (controller.audioFile.isNotEmpty == true)
                  ? Stack(
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.all(Dimensions.paddingSizeSmall),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(Dimensions.radiusSmall)),
                            border: Border.all(
                              color: ColorResources.kPrimaryColor,
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                margin: const EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: ClipOval(
                                      child: Icon(Icons.mic_rounded)
                                          .marginAll(5)
                                          .fit(fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                              ),
                              Text(controller.audioFile.split("/").last ?? "")
                            ],
                          ),
                        ),
                        Positioned(
                            right: 1,
                            child: Container(
                                color: ColorResources.kPrimaryColor,
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                )).onTap(() {
                              controller.audioFile.value = "";
                            })).visible(controller.audioFile.isNotEmpty == true)
                      ],
                    ).marginSymmetric(
                      vertical: Dimensions.marginSizeSmall, horizontal: 15)
                  : SizedBox(),
              audioPickerWidget
            ]),
            Divider(
              color: ColorResources.kSemiTransparent,
            ),
            //Video attachement
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    appLocalization.titleVideoAttachment,
                    style: titleStyle,
                    textAlign: TextAlign.start,
                  ).paddingLeft(Dimensions.paddingSizeSmall).expand(),
                  Tooltip(
                    message: (controller.videoUploadStatus.value ==
                            UploadStatus.completed)
                        ? "Uploaded"
                        : "Not Uploaded",
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: (controller.videoUploadStatus.value ==
                              UploadStatus.completed)
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 10,
                              child: Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                    ),
                  ),
                  10.width
                ],
              ),
              LinearProgressIndicator(
                value: (controller.videoUploadingProgress.value > 0.0)
                    ? controller.videoUploadingProgress.value
                    : null,
                backgroundColor: Colors.grey,
                minHeight: 8,
                semanticsLabel: "Uploading...",
                semanticsValue:
                    controller.videoUploadingProgress.value.toString(),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ).paddingSymmetric(horizontal: 10, vertical: 4).visible(
                  controller.videoUploadStatus.value ==
                      UploadStatus.inProgress),
              (controller.videoFile.isNotEmpty)
                  ? buildVideoPreview()
                  : SizedBox(),
              (controller.videoUploadStatus.value != UploadStatus.completed)
                  ? pickVideoWidget
                  : 0.height,
            ]),
            Divider(
              color: ColorResources.kSemiTransparent,
            ),
            //Document
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    appLocalization.titleDocumentAttachment,
                    style: titleStyle,
                    textAlign: TextAlign.start,
                  ).paddingLeft(Dimensions.paddingSizeSmall).expand(),
                  Tooltip(
                    message: (controller.documentUploadStatus.value ==
                            UploadStatus.completed)
                        ? "Uploaded"
                        : "Not Uploaded",
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: (controller.documentUploadStatus.value ==
                              UploadStatus.completed)
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 10,
                              child: Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                    ),
                  ),
                  10.width
                ],
              ),
              LinearProgressIndicator(
                value: (controller.documentUploadingProgress.value > 0.0)
                    ? controller.documentUploadingProgress.value
                    : null,
                backgroundColor: Colors.grey,
                minHeight: 8,
                semanticsLabel: "Uploading...",
                semanticsValue:
                    controller.documentUploadingProgress.value.toString(),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ).paddingSymmetric(horizontal: 10, vertical: 4).visible(
                  controller.documentUploadStatus.value ==
                      UploadStatus.inProgress),
              (controller.documentFiles.isNotEmpty)
                  ? buildPdfPreview()
                  : SizedBox(),
              (controller.documentUploadStatus.value != UploadStatus.completed)
                  ? documentPickerWidget
                  : 0.height,
            ]),
            Divider(
              color: ColorResources.kSemiTransparent,
            ),
            //Map
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    "বার্ড আই ভিউ সংযুক্তি করুন",
                    style: titleStyle,
                    textAlign: TextAlign.start,
                  ).paddingLeft(Dimensions.paddingSizeSmall).expand(),
                  Tooltip(
                    message: (controller.mapUploadStatus.value ==
                            UploadStatus.completed)
                        ? "Uploaded"
                        : "Not Uploaded",
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: (controller.mapUploadStatus.value ==
                              UploadStatus.completed)
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 10,
                              child: Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                    ),
                  ),
                  10.width
                ],
              ),
              LinearProgressIndicator(
                value: (controller.mapUploadingProgress.value > 0.0)
                    ? controller.mapUploadingProgress.value
                    : null,
                backgroundColor: Colors.grey,
                minHeight: 8,
                semanticsLabel: "Uploading...",
                semanticsValue:
                    controller.mapUploadingProgress.value.toString(),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ).paddingSymmetric(horizontal: 10, vertical: 4).visible(
                  controller.mapUploadStatus.value == UploadStatus.inProgress),
              (controller.mapFile.value.isNotEmpty)
                  ? SizedBox(
                      height: 120,
                      child: previewMapWidget(controller.mapFile.value),
                    ).marginAll(Dimensions.marginSizeSmall)
                  : const SizedBox(),
              (controller.mapUploadStatus.value != UploadStatus.completed)
                  ? birdEyePickerWidget
                  : 0.height,
            ]),
            //submit
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () async {
                        final leavePage = await Utils.leaveDialog(context);
                        if (leavePage) {
                          Get.back();
                        }
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0))),
                      ),
                      child: const Text(
                        "হোম",
                        style: TextStyle(fontSize: 18),
                      ).paddingAll(14),
                    )
                        .width(double.infinity)
                        .paddingRight(AppValues.smallPadding)
                        .flexible(),
                    ElevatedButton(
                      onPressed: (controller.imageUploadStatus.value ==
                                  UploadStatus.inProgress ||
                              controller.videoUploadStatus.value ==
                                  UploadStatus.inProgress ||
                              controller.documentUploadStatus.value ==
                                  UploadStatus.inProgress ||
                              controller.audioUploadStatus.value ==
                                  UploadStatus.inProgress ||
                              controller.mapUploadStatus.value ==
                                  UploadStatus.inProgress)
                          ? null
                          : () async {
                              logger.log(Level.debug, controller.data);
                              if (finalValidation()) {
                                if (controller.imageFiles.isNotEmpty &&
                                    controller.imageUploadStatus.value ==
                                        UploadStatus.inProgress) {
                                  showSnackBar(
                                      Get.context!, appLocalization.msg3);
                                } else if (controller.videoFile.isNotEmpty &&
                                    controller.videoUploadStatus.value ==
                                        UploadStatus.inProgress) {
                                  showSnackBar(
                                      Get.context!, appLocalization.msg3);
                                } else if (controller.mapFile.isNotEmpty &&
                                    controller.mapUploadStatus.value ==
                                        UploadStatus.inProgress) {
                                  showSnackBar(
                                      Get.context!, appLocalization.msg3);
                                } else if (controller.audioFile.isNotEmpty ==
                                        true &&
                                    controller.audioUploadStatus.value ==
                                        UploadStatus.inProgress) {
                                  showSnackBar(
                                      Get.context!, appLocalization.msg3);
                                } else if (controller
                                        .documentFiles.isNotEmpty &&
                                    controller.documentUploadStatus.value ==
                                        UploadStatus.inProgress) {
                                  showSnackBar(
                                      Get.context!, appLocalization.msg3);
                                } else {
                                  if (controller.imageUploadStatus.value ==
                                          UploadStatus.completed &&
                                      controller.videoUploadStatus.value ==
                                          UploadStatus.completed &&
                                      controller.documentUploadStatus.value ==
                                          UploadStatus.completed &&
                                      controller.audioUploadStatus.value ==
                                          UploadStatus.completed &&
                                      controller.mapUploadStatus.value ==
                                          UploadStatus.completed) {
                                    final success =
                                        await Utils.showSuccessDialog(
                                            Get.context!,
                                            "Successfully Uploaded.");
                                    if (success) {
                                      Get.back();
                                    }
                                  } else {
                                    await _submit();
                                    funValidation(() async {
                                      final success =
                                          await Utils.showSuccessDialog(
                                              Get.context!,
                                              "Successfully Uploaded.");
                                      if (success) {
                                        Get.back();
                                      }
                                    },
                                        controller.imageFiles,
                                        controller.videoFile.value,
                                        controller.audioFile.value,
                                        controller.documentFiles,
                                        controller.mapFile.value);
                                    /*                                   if (controller.imageFiles.isNotEmpty &&
                                        controller.audioFile.isEmpty &&
                                        controller.mapFile.isEmpty) {
                                      if (controller.imageUploadStatus.value ==
                                          UploadStatus.completed) {
                                        final success =
                                            await Utils.showSuccessDialog(
                                                Get.context!,
                                                "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                      */ /* showSnackBar(Get.context!,
                                    "Please select or capture Photo");*/ /*
                                    } else if (controller.imageFiles.isEmpty &&
                                        controller.audioFile.isNotEmpty &&
                                        controller.mapFile.isEmpty) {
                                      if (controller.audioUploadStatus.value ==
                                          UploadStatus.completed) {
                                        final success =
                                            await Utils.showSuccessDialog(
                                                Get.context!,
                                                "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                      */ /*showSnackBar(Get.context!,
                                    "Please select or record Video");*/ /*
                                    } else if (controller.imageFiles.isEmpty &&
                                        controller.audioFile.isEmpty &&
                                        controller.mapFile.isNotEmpty) {
                                      */ /* showSnackBar(
                                    Get.context!, "Please select Document");*/ /*
                                      if (controller.mapUploadStatus.value ==
                                          UploadStatus.completed) {
                                        final success =
                                            await Utils.showSuccessDialog(
                                                Get.context!,
                                                "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                    } else if (controller
                                            .imageFiles.isNotEmpty &&
                                        controller.audioFile.isNotEmpty &&
                                        controller.mapFile.isEmpty) {
                                      if (controller.imageUploadStatus.value ==
                                              UploadStatus.completed &&
                                          controller.audioUploadStatus.value ==
                                              UploadStatus.completed) {
                                        final success =
                                            await Utils.showSuccessDialog(
                                                Get.context!,
                                                "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                    } else if (controller
                                            .imageFiles.isNotEmpty &&
                                        controller.audioFile.isEmpty &&
                                        controller.mapFile.isNotEmpty) {
                                      if (controller.imageUploadStatus.value ==
                                              UploadStatus.completed &&
                                          controller.mapUploadStatus.value ==
                                              UploadStatus.completed) {
                                        final success =
                                            await Utils.showSuccessDialog(
                                                Get.context!,
                                                "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                    } else if (controller.imageFiles.isEmpty &&
                                        controller.audioFile.isNotEmpty &&
                                        controller.mapFile.isNotEmpty) {
                                      if (controller.audioUploadStatus.value ==
                                              UploadStatus.completed &&
                                          controller.mapUploadStatus.value ==
                                              UploadStatus.completed) {
                                        final success =
                                            await Utils.showSuccessDialog(
                                                Get.context!,
                                                "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                    }*/
                                    //image success dialog
                                    /*    if (controller.imageFiles.isNotEmpty &&
                                        controller.videoFile.isEmpty &&
                                        controller.documentFiles.isEmpty &&
                                        controller.audioFile.isEmpty ==
                                            true &&
                                        controller.mapFile.isEmpty) {
                                      if (controller.imageUploadStatus.value ==
                                          UploadStatus.completed) {
                                        final success =
                                        await Utils.showSuccessDialog(
                                            Get.context!,
                                            "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                      */ /* showSnackBar(Get.context!,
                                    "Please select or capture Photo");*/ /*
                                      //video success dialog
                                    } else if (controller.imageFiles.isEmpty &&
                                        controller.videoFile.isNotEmpty &&
                                        controller.documentFiles.isEmpty &&
                                        controller.audioFile.isEmpty ==
                                            true &&
                                        controller.mapFile.isEmpty) {
                                      if (controller.videoUploadStatus.value ==
                                          UploadStatus.completed) {
                                        final success =
                                        await Utils.showSuccessDialog(
                                            Get.context!,
                                            "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                      //document success dialog
                                    } else if (controller.imageFiles.isEmpty &&
                                        controller.videoFile.isEmpty &&
                                        controller.documentFiles.isNotEmpty &&
                                        controller.audioFile.isEmpty ==
                                            true &&
                                        controller.mapFile.isEmpty) {
                                      */ /* showSnackBar(
                                    Get.context!, "Please select Document");*/ /*
                                      if (controller
                                          .documentUploadStatus.value ==
                                          UploadStatus.completed) {
                                        final success =
                                        await Utils.showSuccessDialog(
                                            Get.context!,
                                            "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                      //Audio success dialog
                                    } else if (controller.imageFiles.isEmpty &&
                                        controller.videoFile.isEmpty &&
                                        controller.documentFiles.isEmpty &&
                                        controller.audioFile
                                            ?.isNotEmpty ==
                                            true &&
                                        controller.mapFile.isEmpty) {
                                      */ /* showSnackBar(
                                    Get.context!, "Please select Document");*/ /*
                                      if (controller.audioUploadStatus.value ==
                                          UploadStatus.completed) {
                                        final success =
                                        await Utils.showSuccessDialog(
                                            Get.context!,
                                            "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                      //map success dialog
                                    } else if (controller.imageFiles.isEmpty &&
                                        controller.videoFile.isEmpty &&
                                        controller.documentFiles.isEmpty &&
                                        controller.audioFile.isEmpty ==
                                            true &&
                                        controller.mapFile.isNotEmpty) {
                                      */ /* showSnackBar(
                                    Get.context!, "Please select Document");*/ /*
                                      if (controller.mapUploadStatus.value ==
                                          UploadStatus.completed) {
                                        final success =
                                        await Utils.showSuccessDialog(
                                            Get.context!,
                                            "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                      //second step
                                    } else if (controller.imageFiles.isNotEmpty &&
                                        controller.videoFile.isNotEmpty &&
                                        controller.documentFiles.isEmpty &&
                                        controller.audioFile
                                            ?.isEmpty ==
                                            true &&
                                        controller.mapFile.isEmpty) {
                                      if (controller.imageUploadStatus.value ==
                                          UploadStatus.completed &&
                                          controller.videoUploadStatus.value ==
                                              UploadStatus.completed) {
                                        final success =
                                        await Utils.showSuccessDialog(
                                            Get.context!,
                                            "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                    } else if (controller.imageFiles.isNotEmpty &&
                                        controller.videoFile.isEmpty &&
                                        controller.documentFiles.isNotEmpty &&
                                        controller.audioFile
                                            ?.isEmpty ==
                                            true &&
                                        controller.mapFile.isEmpty) {
                                      if (controller.imageUploadStatus.value ==
                                          UploadStatus.completed &&
                                          controller
                                              .documentUploadStatus.value ==
                                              UploadStatus.completed) {
                                        final success =
                                        await Utils.showSuccessDialog(
                                            Get.context!,
                                            "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                    } else if (controller.imageFiles.isEmpty &&
                                        controller.videoFile.isNotEmpty &&
                                        controller.documentFiles.isNotEmpty &&
                                        controller.audioFile
                                            ?.isEmpty ==
                                            true &&
                                        controller.mapFile.isEmpty) {
                                      if (controller.videoUploadStatus.value ==
                                          UploadStatus.completed &&
                                          controller
                                              .documentUploadStatus.value ==
                                              UploadStatus.completed) {
                                        final success =
                                        await Utils.showSuccessDialog(
                                            Get.context!,
                                            "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                    } else if (controller.imageFiles.isNotEmpty &&
                                        controller.videoFile.isEmpty &&
                                        controller.documentFiles.isEmpty &&
                                        controller.audioFile
                                            ?.isNotEmpty ==
                                            true &&
                                        controller.mapFile.isEmpty) {
                                      if (controller.imageUploadStatus.value ==
                                          UploadStatus.completed &&
                                          controller.audioUploadStatus.value ==
                                              UploadStatus.completed) {
                                        final success =
                                        await Utils.showSuccessDialog(
                                            Get.context!,
                                            "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                    } else if (controller.imageFiles.isNotEmpty &&
                                        controller.videoFile.isEmpty &&
                                        controller.documentFiles.isEmpty &&
                                        controller.audioFile
                                            ?.isEmpty ==
                                            true &&
                                        controller.mapFile.isNotEmpty) {
                                      if (controller.imageUploadStatus.value ==
                                          UploadStatus.completed &&
                                          controller.mapUploadStatus.value ==
                                              UploadStatus.completed) {
                                        final success =
                                        await Utils.showSuccessDialog(
                                            Get.context!,
                                            "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                    } else if (controller.imageFiles.isEmpty &&
                                        controller.videoFile.isNotEmpty &&
                                        controller.documentFiles.isEmpty &&
                                        controller.audioFile
                                            ?.isNotEmpty ==
                                            true &&
                                        controller.mapFile.isEmpty) {
                                      if (controller.videoUploadStatus.value ==
                                          UploadStatus.completed &&
                                          controller.audioUploadStatus.value ==
                                              UploadStatus.completed) {
                                        final success =
                                        await Utils.showSuccessDialog(
                                            Get.context!,
                                            "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                    } else if (controller.imageFiles.isEmpty &&
                                        controller.videoFile.isNotEmpty &&
                                        controller.documentFiles.isEmpty &&
                                        controller.audioFile
                                            ?.isEmpty ==
                                            true &&
                                        controller.mapFile.isNotEmpty) {
                                      if (controller.videoUploadStatus.value ==
                                          UploadStatus.completed &&
                                          controller.mapUploadStatus.value ==
                                              UploadStatus.completed) {
                                        final success =
                                        await Utils.showSuccessDialog(
                                            Get.context!,
                                            "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      }
                                    } else if (controller.imageFiles.isEmpty &&
                                        controller.videoFile.isEmpty &&
                                        controller.documentFiles.isNotEmpty &&
                                        controller.audioFile.isNotEmpty &&
                                        controller.mapFile.isEmpty) {
                                      if (controller
                                          .documentUploadStatus.value ==
                                          UploadStatus.completed &&
                                          controller.audioUploadStatus.value ==
                                              UploadStatus.completed) {
                                        final success =
                                        await Utils.showSuccessDialog(
                                            Get.context!,
                                            "Successfully Uploaded.");
                                        if (success) {
                                          Get.back();
                                        }
                                      } else if (controller
                                          .imageFiles.isEmpty &&
                                          controller.videoFile.isEmpty &&
                                          controller.documentFiles.isNotEmpty &&
                                          controller.audioFile.value.isEmpty ==
                                              true &&
                                          controller.mapFile.isNotEmpty) {
                                        if (controller.documentUploadStatus
                                            .value ==
                                            UploadStatus.completed &&
                                            controller.mapUploadStatus.value ==
                                                UploadStatus.completed) {
                                          final success =
                                          await Utils.showSuccessDialog(
                                              Get.context!,
                                              "Successfully Uploaded.");
                                          if (success) {
                                            Get.back();
                                          }
                                        }
                                      } else if (controller
                                          .imageFiles.isEmpty &&
                                          controller.videoFile.isEmpty &&
                                          controller.documentFiles.isEmpty &&
                                          controller.audioFile.isNotEmpty ==
                                              true &&
                                          controller.mapFile.isNotEmpty) {
                                        if (controller
                                            .audioUploadStatus.value ==
                                            UploadStatus.completed &&
                                            controller.mapUploadStatus.value ==
                                                UploadStatus.completed) {
                                          final success =
                                          await Utils.showSuccessDialog(
                                              Get.context!,
                                              "Successfully Uploaded.");
                                          if (success) {
                                            Get.back();
                                          }
                                        }
                                      }
                                    }*/
                                  }
                                }
                              }
                            },
                      child: Text(
                        (controller.imageUploadStatus.value ==
                                    UploadStatus.completed &&
                                controller.videoUploadStatus.value ==
                                    UploadStatus.completed &&
                                controller.documentUploadStatus.value ==
                                    UploadStatus.completed &&
                                controller.mapUploadStatus.value ==
                                    UploadStatus.completed &&
                                controller.audioUploadStatus.value ==
                                    UploadStatus.completed)
                            ? "সাবমিট"
                            : "আপলোড",
                        style: TextStyle(fontSize: 18),
                      ),
                    ).paddingLeft(AppValues.smallPadding).flexible(),
                  ],
                ),
              ],
            ).paddingAll(10)
          ],
        ));
      }),
    );
  }

  /// Set border stroke cap
  Widget get birdEyePickerWidget {
    return DottedBorder(
      dashPattern: const [8, 4],
      strokeWidth: 1,
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      color: Colors.blue,
      radius: const Radius.circular(5),
      child: Container(
        margin: const EdgeInsets.all(Dimensions.marginSizeSmall),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.map_outlined),
            10.width,
            Text(
              "বার্ড আই ভিউ",
              style: appBarActionTextStyle,
            ),
          ],
        ),
      ),
    ).paddingSymmetric(horizontal: 15, vertical: 5).onTap(() async {
      String data = await Get.toNamed(Routes.UPLOAD_MAP_ATTACHMENT);
      if (data.isNotEmpty) {
        controller.mapFile.value = data;
      }
    });
  }

  Widget get documentPickerWidget {
    return DottedBorder(
      dashPattern: const [8, 4],
      strokeWidth: 1,
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      color: Colors.blue,
      radius: const Radius.circular(5),
      child: Container(
        margin: const EdgeInsets.all(Dimensions.marginSizeSmall),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.picture_as_pdf_outlined),
            10.width,
            Text(
              appLocalization.titleOpenDocument,
              style: appBarActionTextStyle,
            ),
          ],
        ),
      ),
    ).paddingSymmetric(horizontal: 15, vertical: 5).onTap(() {
      pickDocument();
    });
  }

  Widget get audioPickerWidget {
    return DottedBorder(
      dashPattern: const [8, 4],
      strokeWidth: 1,
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      color: Colors.blue,
      radius: const Radius.circular(5),
      child: Container(
        margin: EdgeInsets.all(Dimensions.marginSizeSmall),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.mic_rounded),
            10.width,
            Text(
              appLocalization.titleRecordAudioStatement,
              style: appBarActionTextStyle,
            ),
          ],
        ),
      ),
    ).paddingSymmetric(horizontal: 15, vertical: 5).onTap(() {
      voiceRecordDialog("Input Voice", 350);
      // pickDocument();
    });
  }

  Widget get imagePickerWidget {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DottedBorder(
          dashPattern: const [8, 4],
          strokeWidth: 1,
          strokeCap: StrokeCap.round,
          borderType: BorderType.RRect,
          color: Colors.blue,
          radius: const Radius.circular(5),
          child: Container(
            margin: const EdgeInsets.all(Dimensions.marginSizeSmall),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.photo_library_sharp),
                10.width,
                Text(
                  appLocalization.titleOpenGallery,
                  style: appBarActionTextStyle,
                ),
              ],
            ),
          ),
        ).paddingAll(5).onTap(() {
          pickImage();
        }).flexible(),
        DottedBorder(
          dashPattern: const [8, 4],
          strokeWidth: 1,
          strokeCap: StrokeCap.round,
          borderType: BorderType.RRect,
          color: Colors.blue,
          radius: const Radius.circular(5),
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(Dimensions.marginSizeSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt_outlined),
                10.width,
                Text(
                  appLocalization.titleOpenCamera,
                  style: appBarActionTextStyle,
                ),
              ],
            ),
          ).onTap(() {
            openCameraForImage();
          }),
        ).paddingAll(5).flexible(),
      ],
    ).paddingSymmetric(horizontal: 10);
  }

  Widget get pickVideoWidget {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DottedBorder(
          dashPattern: const [8, 4],
          strokeWidth: 1,
          strokeCap: StrokeCap.round,
          borderType: BorderType.RRect,
          color: Colors.blue,
          radius: const Radius.circular(5),
          child: Container(
            margin: const EdgeInsets.all(Dimensions.marginSizeSmall),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.video_collection_outlined),
                10.width,
                Text(
                  appLocalization.titleOpenGallery,
                  style: appBarActionTextStyle,
                ),
              ],
            ),
          ),
        ).paddingAll(5).onTap(() {
          pickVideo();
        }).flexible(),
        DottedBorder(
          dashPattern: const [8, 4],
          strokeWidth: 1,
          strokeCap: StrokeCap.round,
          borderType: BorderType.RRect,
          color: Colors.blue,
          radius: const Radius.circular(5),
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(Dimensions.marginSizeSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.video_camera_back_outlined),
                10.width,
                Text(
                  appLocalization.titleOpenCamera,
                  style: appBarActionTextStyle,
                ),
              ],
            ),
          ).onTap(() {
            openCameraForVideo();
          }),
        ).paddingAll(5).flexible(),
      ],
    ).paddingSymmetric(horizontal: 10);
  }

  Widget previewImageWidget(String value) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
      child: Stack(
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(
                  Radius.circular(Dimensions.radiusSmall)),
              border: Border.all(
                color: ColorResources.kPrimaryColor,
                width: 1.0,
              ),
            ),
            child: Image.file(
              File(value),
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
                  right: 1,
                  child: Container(
                      color: ColorResources.kPrimaryColor,
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      )).onTap(() {
                    controller.imageFiles.remove(value);
                    controller.imageUploadStatus.value =
                        UploadStatus.notStarted;
                  }))
              .visible(
                  controller.imageUploadStatus.value != UploadStatus.completed)
        ],
      ),
    );
  }

  Widget previewMapWidget(String value) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
      child: Stack(
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(
                  Radius.circular(Dimensions.radiusSmall)),
              border: Border.all(
                color: ColorResources.kPrimaryColor,
                width: 1.0,
              ),
            ),
            child: Image.file(
              File(value),
              fit: BoxFit.fill,
              key: UniqueKey(),
            ),
          ),
          Positioned(
                  right: 1,
                  child: Container(
                      color: ColorResources.kPrimaryColor,
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      )).onTap(() {
                    Utils.deleteFile(controller.mapFile.value);
                    controller.mapFile.value = "";
                    controller.mapUploadStatus.value = UploadStatus.notStarted;
                  }))
              .visible(
                  controller.mapUploadStatus.value != UploadStatus.completed)
        ],
      ),
    );
  }

  buildVideoPreview() {
    var name = controller.videoFile.split("/");
    Widget video = Stack(
      children: [
        Container(
          height: 150,
          width: 250,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius:
                const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
            border: Border.all(
              color: ColorResources.kPrimaryColor,
              width: 1.0,
            ),
          ),
          child: Image.file(
            File(controller.thumbFile.value ?? ""),
            fit: BoxFit.fill,
            errorBuilder: (ctx, exception, stackTrace) {
              return Stack(
                children: [
                  /*  Image.asset(
                    ImagesAssets.placeholder,
                    width: double.infinity,
                    height: double.maxFinite,
                    fit: BoxFit.fill,
                  ),*/
                  Text(
                    "Loading...",
                    style: centerTextStyle.copyWith(fontSize: 18),
                  ).paddingSymmetric(horizontal: 10).center()
                ],
              );
            },
          ),
        ),
        Positioned(
                right: 1,
                child: Container(
                    color: ColorResources.kPrimaryColor,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )).onTap(() {
                  controller.videoFile.value = "";
                  controller.thumbFile.value = "";
                  controller.videoUploadStatus.value = UploadStatus.notStarted;
                  VideoCompress.cancelCompression();
                }))
            .visible(
                controller.videoUploadStatus.value != UploadStatus.completed)
      ],
    ).marginAll(Dimensions.marginSizeSmall).center();

    /*    files?.forEach((e) => {
            extension = e.split("."),
            if (extension[extension.lastIndex] == "pdf")
              {list.add(Image.file(File(e)))}
            else
              {list.add(Image.file(File(e)))}
          });*/
    return video;
  }

  Widget buildPdfPreview() {
    if (controller.documentFiles.isEmpty) {
      return const SizedBox();
    } else {
      List<Widget> documentList = [];

      controller.documentFiles.forEach((element) {
        var name = element.split("/");
        Widget document = Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(
                    Radius.circular(Dimensions.radiusSmall)),
                border: Border.all(
                  color: ColorResources.kPrimaryColor,
                  width: 1.0,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: ClipOval(
                          child: Icon(Icons.picture_as_pdf_outlined)
                              .marginAll(5)
                              .fit(fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ),
                  Text(name.last)
                ],
              ),
            ),
            Positioned(
                    right: 1,
                    child: Container(
                        color: ColorResources.kPrimaryColor,
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        )).onTap(() {
                      controller.documentFiles.remove(element);
                      controller.documentUploadStatus.value =
                          UploadStatus.notStarted;
                    }))
                .visible(controller.documentUploadStatus.value !=
                    UploadStatus.completed)
          ],
        ).marginAll(Dimensions.marginSizeSmall);

        documentList.add(document);
      });

      /*    files?.forEach((e) => {
            extension = e.split("."),
            if (extension[extension.lastIndex] == "pdf")
              {list.add(Image.file(File(e)))}
            else
              {list.add(Image.file(File(e)))}
          });*/
      return Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [for (var value in documentList) value],
        ),
      );
    }
  }

  Widget buildFilePreview() {
    if (controller.imageFiles.isEmpty) {
      return const SizedBox();
    } else {
      List<Widget> imageList = [];
      List<Widget> pdfList = [];

      List<String> extension;
      controller.imageFiles.forEach((element) {
        var name = element.split("/");
        Widget pdf = Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(
                    Radius.circular(Dimensions.radiusSmall)),
                border: Border.all(
                  color: ColorResources.kPrimaryColor,
                  width: 1.0,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: ClipOval(
                          child: SvgPicture.asset(SVGAssets.icPdf),
                        ),
                      ),
                    ),
                  ),
                  Text(name.last)
                ],
              ),
            ),
            Positioned(
                right: 1,
                child: Container(
                    color: ColorResources.kPrimaryColor,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )))
          ],
        );
        pdfList.add(pdf);
      });
      controller.imageFiles.forEach((element) {
        extension = element.split(".");
        var name = element.split("/");
        if (extension.last == "pdf") {
          Widget pdf = Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(
                      Radius.circular(Dimensions.radiusSmall)),
                  border: Border.all(
                    color: ColorResources.kPrimaryColor,
                    width: 1.0,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      margin: const EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: SizedBox(
                          width: 70.0,
                          height: 70.0,
                          child: ClipOval(
                            child: SvgPicture.asset(SVGAssets.icPdf),
                          ),
                        ),
                      ),
                    ),
                    Text(name.last)
                  ],
                ),
              ),
              Positioned(
                  right: 1,
                  child: Container(
                      color: ColorResources.kPrimaryColor,
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      )))
            ],
          );
          pdfList.add(pdf);
        } else {
          Widget image = Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
            child: Stack(
              children: [
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(Dimensions.radiusSmall)),
                    border: Border.all(
                      color: ColorResources.kPrimaryColor,
                      width: 1.0,
                    ),
                  ),
                  child: Image.file(
                    File(element),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    right: 1,
                    child: Container(
                        color: ColorResources.kPrimaryColor,
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        )))
              ],
            ),
          );
          imageList.add(image);
        }
      });

      /*    files?.forEach((e) => {
            extension = e.split("."),
            if (extension[extension.lastIndex] == "pdf")
              {list.add(Image.file(File(e)))}
            else
              {list.add(Image.file(File(e)))}
          });*/
      return Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.all(Dimensions.marginSizeSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            (imageList.isNotEmpty)
                ? SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: imageList,
                    ),
                  )
                : const SizedBox(),
            for (var value in pdfList) value
          ],
        ),
      );
    }
  }

  pickImage() async {
    final cacheDir = await getTemporaryDirectory();
    // Capture a photo.
    final List<XFile> images = await picker.pickMultiImage(imageQuality: 50);

    if (images.isNotEmpty) {
      images.forEach((element) async {
        /*  final file = await CompressUtils.compressImageAndGetFile(
            File(element.path), cacheDir.path);*/
        controller.imageFiles.add(element.path);
      });
    }
  }

  openCameraForImage() async {
    // Capture a photo.
    final XFile? photo =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (photo?.path.isEmpty != true) {
      controller.imageFiles.add(photo!.path);
    }
  }

  pickVideo() async {
    // Pick a video.
    final XFile? galleryVideo =
        await picker.pickVideo(source: ImageSource.gallery);
    if (galleryVideo?.path.isNotEmpty == true) {
      controller.videoFile.value = galleryVideo!.path;

      var compressedPath = await CompressUtils.compressVideo(galleryVideo.path);
      /*     final thumbnailPath = await VideoThumbnail.thumbnailFile(
          video: compressedPath ?? "",
          imageFormat: ImageFormat.JPEG,
          timeMs: 1,
          quality: 50);*/
      if (!compressedPath.isEmptyOrNull) {
        final thumbnailPath =
            await VideoCompress.getFileThumbnail(compressedPath!);
        controller.thumbFile.value = thumbnailPath.path ?? "";
        controller.videoFile.value = compressedPath;
      }
      print(compressedPath);
    }
  }

  openCameraForVideo() async {
    final XFile? cameraVideo =
        await picker.pickVideo(source: ImageSource.camera);
    if (cameraVideo?.path.isNotEmpty == true) {
      controller.videoFile.value = cameraVideo!.path;

      var compressedPath = await CompressUtils.compressVideo(cameraVideo.path);
      if (!compressedPath.isEmptyOrNull) {
        final thumbnailPath =
            await VideoCompress.getFileThumbnail(compressedPath!);
        controller.thumbFile.value = thumbnailPath.path ?? "";
        controller.videoFile.value = compressedPath;
      }
    }
  }

  pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf'], allowMultiple: true);

    if (result != null) {
      // files = List.generate(1, (index) => result.files.first.name.toString());
      controller.documentFiles.clear();
      controller.documentFiles.addAll(result.paths.cast<String>());
    } else {
      // User canceled the picker
    }
  }

  Future<void> _submit() async {
    if (controller.imageFiles.isNotEmpty) {
      if (controller.imageUploadStatus.value == UploadStatus.notStarted ||
          controller.imageUploadStatus.value == UploadStatus.failed) {
        await _uploadAttachment(AttachmentType.Image);
      }
    }
    if (controller.videoFile.isNotEmpty) {
      if (controller.videoUploadStatus.value == UploadStatus.notStarted ||
          controller.videoUploadStatus.value == UploadStatus.failed) {
        if (!VideoCompress.isCompressing) {
          await _uploadAttachment(AttachmentType.Video);
        } else {
          showSnackBar(Get.context!, "Video is Compressing...");
        }
      }
    }
    if (controller.audioFile.isNotEmpty == true) {
      if (controller.audioUploadStatus.value == UploadStatus.notStarted ||
          controller.audioUploadStatus.value == UploadStatus.failed) {
        await _uploadAttachment(AttachmentType.Audio);
      }
    }
    if (controller.documentFiles.isNotEmpty) {
      if (controller.documentUploadStatus.value == UploadStatus.notStarted ||
          controller.documentUploadStatus.value == UploadStatus.failed) {
        await _uploadAttachment(AttachmentType.Document);
      }
    }
    if (controller.mapFile.isNotEmpty) {
      if (controller.mapUploadStatus.value == UploadStatus.notStarted ||
          controller.mapUploadStatus.value == UploadStatus.failed) {
        await _uploadAttachment(AttachmentType.Map);
      }
    }
  }

  Future<void> _uploadAttachment(AttachmentType attachmentType) async {
    HashMap<String, dynamic> hashMap = new HashMap();
    if (controller.data["from"] == VisitOption.BC_CASE_BI) {
      hashMap['applicationFileMasterID'] =
          controller.data["applicationFileMasterID"];
      hashMap['attachmentType'] = attachmentType.name.toString();
      if (attachmentType == AttachmentType.Image) {
        hashMap['files'] = [
          for (String value in controller.imageFiles)
            await dio.MultipartFile.fromFile("$value",
                filename: value.split("/").last)
        ];
      } else if (attachmentType == AttachmentType.Video) {
        hashMap['files'] = [
          await dio.MultipartFile.fromFile("${controller.videoFile}",
              filename: controller.videoFile.split("/").last)
        ];
      } else if (attachmentType == AttachmentType.Audio) {
        hashMap['files'] = [
          await dio.MultipartFile.fromFile("${controller.audioFile}",
              filename: controller.videoFile.split("/").last)
        ];
      } else if (attachmentType == AttachmentType.Document) {
        hashMap['files'] = [
          for (String value in controller.documentFiles)
            await dio.MultipartFile.fromFile("$value",
                filename: value.split("/").last)
        ];
      } else if (attachmentType == AttachmentType.Map) {
        hashMap['files'] = [
          await dio.MultipartFile.fromFile("${controller.mapFile}",
              filename: controller.mapFile.split("/").last)
        ];
      }

      await controller.updateBcCaseBiAttachment(hashMap, (response) async {
        if (controller.imageUploadStatus.value == UploadStatus.completed &&
            controller.videoUploadStatus.value == UploadStatus.completed &&
            controller.audioUploadStatus.value == UploadStatus.completed &&
            controller.mapUploadStatus.value == UploadStatus.completed &&
            controller.documentUploadStatus.value == UploadStatus.completed) {
          final success = await Utils.showSuccessDialog(
              Get.context!, "Successfully Uploaded.");
          if (success) {
            Get.back();
          }
        }
      });
    } else if (controller.data["from"] == VisitOption.TECHNICAL_REPORT) {
      hashMap['beatID'] = controller.data["Id"];
      hashMap['BeatVisitID'] = controller.data["BeatVisitID"];
      hashMap['attachmentType'] =  attachmentType.name;
      if (attachmentType == AttachmentType.Image) {
        hashMap['files'] = [
          for (String value in controller.imageFiles)
            await dio.MultipartFile.fromFile("$value",
                filename: value.split("/").last)
        ];
      } else if (attachmentType == AttachmentType.Video) {
        hashMap['files'] = [
          await dio.MultipartFile.fromFile("${controller.videoFile}",
              filename: controller.videoFile.split("/").last)
        ];
      } else if (attachmentType == AttachmentType.Document) {
        hashMap['files'] = [
          for (String value in controller.documentFiles)
            await dio.MultipartFile.fromFile("$value",
                filename: value.split("/").last)
        ];
      }

/*      await controller.updateBeatAttachment(hashMap,
          (ListResponse response) async {
        if (controller.imageUploadStatus.value == UploadStatus.completed &&
            controller.videoUploadStatus.value == UploadStatus.completed &&
            controller.documentUploadStatus.value == UploadStatus.completed) {
          final success = await Utils.showSuccessDialog(
              Get.context!, "Successfully Uploaded.");
          if (success) {
            Get.back();
          }
        }
      });*/
    }
  }

  Future<void> voiceRecordDialog(String title, double width) async {
    Audio m = await Get.generalDialog(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return ScaffoldMessenger(
            child: Builder(
                builder: (context) => Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Container(
                            height: 300,
                            width: width,
                            margin: EdgeInsets.all(10),
                            color: Colors.white,
                            child: SimpleRecorder(
                                controller.data["Id"].toString())),
                      ),
                    ))));
      },
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 200),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
    if (!m.name.isEmptyOrNull) controller.audioFile.value = m.name!;
  }

  void deleteUploadedFile() {
    if (controller.imageUploadStatus.value == UploadStatus.completed) {
      for (String value in controller.imageFiles) Utils.deleteFile(value);
    }
    if (controller.mapUploadStatus.value == UploadStatus.completed) {
      Utils.deleteFile(controller.mapFile.value);
    }
    if (controller.videoUploadStatus.value == UploadStatus.completed) {
      Utils.deleteFile(controller.videoFile.value);
    }
    if (controller.documentUploadStatus.value == UploadStatus.completed) {
      for (String value in controller.documentFiles) Utils.deleteFile(value);
    }
  }

  void showSnackBar(BuildContext context, String text,
      {Color color = Colors.red}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: color, content: Text(text)),
    );
  }

  void funValidation(VoidCallback callback, List image, String video,
      String audio, List document, String map) {
    UploadStatus mapUploadStatus = controller.mapUploadStatus.value;
    UploadStatus imageUploadStatus = controller.imageUploadStatus.value;
    UploadStatus videoUploadStatus = controller.videoUploadStatus.value;
    UploadStatus audioUploadStatus = controller.audioUploadStatus.value;
    UploadStatus documentUploadStatus = controller.documentUploadStatus.value;
    // Single
    if (image.isNotEmpty &&
        video.isEmpty &&
        audio.isEmpty &&
        document.isEmpty &&
        map.isEmpty) {
      print("1) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isEmpty &&
        video.isNotEmpty &&
        audio.isEmpty &&
        document.isEmpty &&
        map.isEmpty) {
      print("2) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (videoUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isEmpty &&
        video.isEmpty &&
        audio.isNotEmpty &&
        document.isEmpty &&
        map.isEmpty) {
      print("3) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (audioUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isEmpty &&
        video.isEmpty &&
        audio.isEmpty &&
        document.isNotEmpty &&
        map.isEmpty) {
      print("4) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (documentUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isEmpty &&
        video.isEmpty &&
        audio.isEmpty &&
        document.isEmpty &&
        map.isNotEmpty) {
      print("5) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (mapUploadStatus == UploadStatus.completed) {
        callback();
      }
    }
    // Double
    else if (image.isNotEmpty &&
        video.isNotEmpty &&
        audio.isEmpty &&
        document.isEmpty &&
        map.isEmpty) {
      print("6) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          videoUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isNotEmpty &&
        video.isEmpty &&
        audio.isNotEmpty &&
        document.isEmpty &&
        map.isEmpty) {
      print("7) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          audioUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isNotEmpty &&
        video.isEmpty &&
        audio.isEmpty &&
        document.isNotEmpty &&
        map.isEmpty) {
      print("8) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isNotEmpty &&
        video.isEmpty &&
        audio.isEmpty &&
        document.isEmpty &&
        map.isNotEmpty) {
      print("9) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          mapUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isEmpty &&
        video.isNotEmpty &&
        audio.isNotEmpty &&
        document.isEmpty &&
        map.isEmpty) {
      print("10) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (videoUploadStatus == UploadStatus.completed &&
          audioUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isEmpty &&
        video.isNotEmpty &&
        audio.isEmpty &&
        document.isNotEmpty &&
        map.isEmpty) {
      print("11) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (videoUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isEmpty &&
        video.isNotEmpty &&
        audio.isEmpty &&
        document.isEmpty &&
        map.isNotEmpty) {
      print("12) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (videoUploadStatus == UploadStatus.completed &&
          mapUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isEmpty &&
        video.isEmpty &&
        audio.isNotEmpty &&
        document.isNotEmpty &&
        map.isEmpty) {
      print("13) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (audioUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isEmpty &&
        video.isEmpty &&
        audio.isNotEmpty &&
        document.isEmpty &&
        map.isNotEmpty) {
      print("14) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (audioUploadStatus == UploadStatus.completed &&
          mapUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isEmpty &&
        video.isEmpty &&
        audio.isEmpty &&
        document.isNotEmpty &&
        map.isNotEmpty) {
      print("15) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (mapUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed) {
        callback();
      }
    }
    // Triple
    else if (image.isNotEmpty &&
        video.isNotEmpty &&
        audio.isNotEmpty &&
        document.isEmpty &&
        map.isEmpty) {
      print("16) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          videoUploadStatus == UploadStatus.completed &&
          audioUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isNotEmpty &&
        video.isNotEmpty &&
        audio.isEmpty &&
        document.isNotEmpty &&
        map.isEmpty) {
      print("17) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          videoUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isNotEmpty &&
        video.isNotEmpty &&
        audio.isEmpty &&
        document.isEmpty &&
        map.isNotEmpty) {
      print("18) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          videoUploadStatus == UploadStatus.completed &&
          mapUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isNotEmpty &&
        video.isEmpty &&
        audio.isEmpty &&
        document.isNotEmpty &&
        map.isNotEmpty) {
      print("20) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed &&
          mapUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isEmpty &&
        video.isEmpty &&
        audio.isNotEmpty &&
        document.isNotEmpty &&
        map.isNotEmpty) {
      print("21) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (audioUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed &&
          mapUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isEmpty &&
        video.isNotEmpty &&
        audio.isNotEmpty &&
        document.isNotEmpty &&
        map.isEmpty) {
      print("22) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (videoUploadStatus == UploadStatus.completed &&
          audioUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isNotEmpty &&
        video.isEmpty &&
        audio.isNotEmpty &&
        document.isNotEmpty &&
        map.isEmpty) {
      print("23) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          audioUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isNotEmpty &&
        video.isEmpty &&
        audio.isNotEmpty &&
        document.isEmpty &&
        map.isNotEmpty) {
      print("24) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          audioUploadStatus == UploadStatus.completed &&
          mapUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isEmpty &&
        video.isNotEmpty &&
        audio.isEmpty &&
        document.isNotEmpty &&
        map.isNotEmpty) {
      print("25) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (videoUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed &&
          mapUploadStatus == UploadStatus.completed) {
        callback();
      }
    }
    // Fourth
    else if (image.isNotEmpty &&
        video.isNotEmpty &&
        audio.isNotEmpty &&
        document.isNotEmpty &&
        map.isEmpty) {
      print("26) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          videoUploadStatus == UploadStatus.completed &&
          audioUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isNotEmpty &&
        video.isNotEmpty &&
        audio.isNotEmpty &&
        document.isEmpty &&
        map.isNotEmpty) {
      print("27) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          videoUploadStatus == UploadStatus.completed &&
          audioUploadStatus == UploadStatus.completed &&
          mapUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isNotEmpty &&
        video.isNotEmpty &&
        audio.isEmpty &&
        document.isNotEmpty &&
        map.isNotEmpty) {
      print("28) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          videoUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed &&
          mapUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isNotEmpty &&
        video.isEmpty &&
        audio.isNotEmpty &&
        document.isNotEmpty &&
        map.isNotEmpty) {
      print("29) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          audioUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed &&
          mapUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isEmpty &&
        video.isNotEmpty &&
        audio.isNotEmpty &&
        document.isNotEmpty &&
        map.isNotEmpty) {
      print("30) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (videoUploadStatus == UploadStatus.completed &&
          audioUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed &&
          mapUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else if (image.isNotEmpty &&
        video.isNotEmpty &&
        audio.isEmpty &&
        document.isNotEmpty &&
        map.isNotEmpty) {
      print("31) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          videoUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed &&
          mapUploadStatus == UploadStatus.completed) {
        callback();
      }
    }
    // Fifth
    else if (image.isNotEmpty &&
        video.isNotEmpty &&
        audio.isNotEmpty &&
        document.isNotEmpty &&
        map.isNotEmpty) {
      print("32) A: $image, B: $video, C: $audio, D: $document, E: $map");
      if (imageUploadStatus == UploadStatus.completed &&
          videoUploadStatus == UploadStatus.completed &&
          audioUploadStatus == UploadStatus.completed &&
          documentUploadStatus == UploadStatus.completed &&
          mapUploadStatus == UploadStatus.completed) {
        callback();
      }
    } else {
      print("Nothing");
    }
  }
}

void validationForDialog1(
    {UploadStatus image = UploadStatus.notStarted,
    UploadStatus video = UploadStatus.notStarted,
    UploadStatus audio = UploadStatus.notStarted,
    UploadStatus document = UploadStatus.notStarted,
    UploadStatus map = UploadStatus.notStarted}) {
//single
  if (image == UploadStatus.completed) {
    print("1) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (video == UploadStatus.completed) {
    print("2) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (audio == UploadStatus.completed) {
    print("3) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (document == UploadStatus.completed) {
    print("4) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (map == UploadStatus.completed) {
    print("5) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } //Double
  else if (image == UploadStatus.completed && video == UploadStatus.completed) {
    print("6) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (image == UploadStatus.completed &&
      audio == UploadStatus.completed) {
    print("7) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (image == UploadStatus.completed &&
      document == UploadStatus.completed) {
    print("8) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (image == UploadStatus.completed && map == UploadStatus.completed) {
    print("9) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (video == UploadStatus.completed &&
      audio == UploadStatus.completed) {
    print("10) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (video == UploadStatus.completed &&
      document == UploadStatus.completed) {
    print("11) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (video == UploadStatus.completed && map == UploadStatus.completed) {
    print("12) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (audio == UploadStatus.completed &&
      document == UploadStatus.completed) {
    print("13) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (audio == UploadStatus.completed && map == UploadStatus.completed) {
    print("14) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (document == UploadStatus.completed &&
      map == UploadStatus.completed) {
    print("15) A: $image, B: $video, C: $audio, D: $document, E: $map");
  }
//Triple
  else if (image == UploadStatus.completed &&
      video == UploadStatus.completed &&
      audio == UploadStatus.completed) {
    print("16) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (image == UploadStatus.completed &&
      video == UploadStatus.completed &&
      document == UploadStatus.completed) {
    print("17) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (image == UploadStatus.completed &&
      video == UploadStatus.completed &&
      map == UploadStatus.completed) {
    print("18) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (image == UploadStatus.completed &&
      video == UploadStatus.completed &&
      map == UploadStatus.completed) {
    print("19) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (image == UploadStatus.completed &&
      document == UploadStatus.completed &&
      map == UploadStatus.completed) {
    print("20) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (audio == UploadStatus.completed &&
      document == UploadStatus.completed &&
      map == UploadStatus.completed) {
    print("21) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (video == UploadStatus.completed &&
      audio == UploadStatus.completed &&
      document == UploadStatus.completed) {
    print("22) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (image == UploadStatus.completed &&
      audio == UploadStatus.completed &&
      document == UploadStatus.completed) {
    print("23) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (image == UploadStatus.completed &&
      audio == UploadStatus.completed &&
      map == UploadStatus.completed) {
    print("24) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (video == UploadStatus.completed &&
      document == UploadStatus.completed &&
      map == UploadStatus.completed) {
    print("25) A: $image, B: $video, C: $audio, D: $document, E: $map");
  }
//fourth
  else if (image == UploadStatus.completed &&
      video == UploadStatus.completed &&
      audio == UploadStatus.completed &&
      document == UploadStatus.completed) {
    print("26) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (image == UploadStatus.completed &&
      video == UploadStatus.completed &&
      audio == UploadStatus.completed &&
      map == UploadStatus.completed) {
    print("27) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (image == UploadStatus.completed &&
      video == UploadStatus.completed &&
      document == UploadStatus.completed &&
      map == UploadStatus.completed) {
    print("28) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (image == UploadStatus.completed &&
      audio == UploadStatus.completed &&
      document == UploadStatus.completed &&
      map == UploadStatus.completed) {
    print("29) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (video == UploadStatus.completed &&
      audio == UploadStatus.completed &&
      document == UploadStatus.completed &&
      map == UploadStatus.completed) {
    print("30) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else if (image == UploadStatus.completed &&
      video == UploadStatus.completed &&
      document == UploadStatus.completed &&
      map == UploadStatus.completed) {
    print("31 A: $image, B: $video, C: $audio, D: $document, E: $map");
  }
//fifth
  else if (image == UploadStatus.completed &&
      video == UploadStatus.completed &&
      audio == UploadStatus.completed &&
      document == UploadStatus.completed &&
      map == UploadStatus.completed) {
    print("32) A: $image, B: $video, C: $audio, D: $document, E: $map");
  } else {
    print("Nothing");
  }
}
