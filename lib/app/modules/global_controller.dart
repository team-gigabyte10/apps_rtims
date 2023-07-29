import 'dart:collection';

import 'package:apps_rtims/app/core/core.dart';
import 'package:apps_rtims/app/core/model/upload_status.dart';
import 'package:apps_rtims/app/data/repository/beat_po/po_repository.dart';
import 'package:apps_rtims/app/data/repository/global_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:video_compress/video_compress.dart';

import '../core/base/base_controller.dart';
import '../network/exceptions/base_exception.dart';

enum AttachmentType { Audio, Video, Image, Document, Map }

extension AttachmentTypeExtension on AttachmentType {
  int get name {
    switch (this) {
      case AttachmentType.Audio:
        return 1;
      case AttachmentType.Image:
        return 2;
      case AttachmentType.Video:
        return 3;
      case AttachmentType.Map:
        return 4;
      case AttachmentType.Document:
        return 5;
      default:
        return 0;
    }
  }

  void talk() {
    print('meow');
  }
}

class GlobalController extends BaseController {
  final GlobalRepository _globalRepository =
      Get.find(tag: (GlobalRepository).toString());
  final PORepository _poRepository = Get.find(tag: (PORepository).toString());

  late Subscription _subscription;

  Rx<UploadStatus> mapUploadStatus = UploadStatus.notStarted.obs;
  Rx<UploadStatus> imageUploadStatus = UploadStatus.notStarted.obs;
  Rx<UploadStatus> videoUploadStatus = UploadStatus.notStarted.obs;
  Rx<UploadStatus> audioUploadStatus = UploadStatus.notStarted.obs;
  Rx<UploadStatus> documentUploadStatus = UploadStatus.notStarted.obs;
  RxDouble mapUploadingProgress = 0.0.obs;
  RxDouble imageUploadingProgress = 0.0.obs;
  RxDouble videoUploadingProgress = 0.0.obs;
  RxDouble audioUploadingProgress = 0.0.obs;
  RxDouble documentUploadingProgress = 0.0.obs;
  RxBool isImageCompressCompleted = false.obs;
  RxBool isVideoCompressCompleted = false.obs;
  RxDouble compressProgress = 0.0.obs;
  GoogleMapController? mapController;

  List<String> imageFiles = <String>[].obs;
  RxString mapFile = "".obs;
  RxString videoFile = "".obs;
  RxString thumbFile = "".obs;
  List<String> documentFiles = <String>[].obs;
  RxString audioFile = "".obs;

  // Rx<Audio> recordedAudioFile = Audio(name: "").obs;
  dynamic data;

  @override
  void onInit() {
    data = Get.arguments;
    super.onInit();
    _subscription = VideoCompress.compressProgress$.subscribe((progress) {
      logger.d('progress: $progress');
      compressProgress.value = progress;
    });
  }

  Future<void> updateBcCaseBiAttachment(
      HashMap<String, dynamic> hashMap, Function callback) async {
    return callDataService(
        onStart: () {
          if (hashMap["attachmentType"] == AttachmentType.Image.name.toString()) {
            imageUploadStatus.value = UploadStatus.inProgress;
          } else if (hashMap["attachmentType"] ==
              AttachmentType.Video.name.toString()) {
            videoUploadStatus.value = UploadStatus.inProgress;
          } else if (hashMap["attachmentType"] ==
              AttachmentType.Document.name.toString()) {
            documentUploadStatus.value = UploadStatus.inProgress;
          } else if (hashMap["attachmentType"] ==
              AttachmentType.Audio.name.toString()) {
            audioUploadStatus.value = UploadStatus.inProgress;
          } else if (hashMap["attachmentType"] == AttachmentType.Map.name.toString()) {
            mapUploadStatus.value = UploadStatus.inProgress;
          }
        },
        _globalRepository.updatePOAttachment(hashMap, (double value) {
          if (hashMap["attachmentType"] == AttachmentType.Image.name.toString()) {
            imageUploadingProgress.value = value / 100;
          } else if (hashMap["attachmentType"] ==
              AttachmentType.Video.name.toString()) {
            videoUploadingProgress.value = value / 100;
          } else if (hashMap["attachmentType"] ==
              AttachmentType.Document.name.toString()) {
            documentUploadingProgress.value = value / 100;
          } else if (hashMap["attachmentType"] ==
              AttachmentType.Audio.name.toString()) {
            audioUploadingProgress.value = value / 100;
          } else if (hashMap["attachmentType"] == AttachmentType.Map.name.toString()) {
            mapUploadingProgress.value = value / 100;
          }
        }),
        onSuccess: (ListResponse response) {
          if (response.statusCode == 1) {
            //   showSuccessMessage(response.message);
            if (hashMap["attachmentType"] == AttachmentType.Image.name.toString()) {
              imageUploadStatus.value = UploadStatus.completed;
            } else if (hashMap["attachmentType"] ==
                AttachmentType.Video.name.toString()) {
              videoUploadStatus.value = UploadStatus.completed;
            } else if (hashMap["attachmentType"] ==
                AttachmentType.Document.name.toString()) {
              documentUploadStatus.value = UploadStatus.completed;
            } else if (hashMap["attachmentType"] ==
                AttachmentType.Audio.name.toString()) {
              audioUploadStatus.value = UploadStatus.completed;
            } else if (hashMap["attachmentType"] ==
                AttachmentType.Map.name.toString()) {
              mapUploadStatus.value = UploadStatus.completed;
            }
          } else {
            if (hashMap["attachmentType"] == AttachmentType.Image.name.toString()) {
              imageUploadStatus.value = UploadStatus.failed;
            } else if (hashMap["attachmentType"] ==
                AttachmentType.Video.name.toString()) {
              videoUploadStatus.value = UploadStatus.failed;
            } else if (hashMap["attachmentType"] ==
                AttachmentType.Document.name.toString()) {
              documentUploadStatus.value = UploadStatus.failed;
            } else if (hashMap["attachmentType"] ==
                AttachmentType.Audio.name.toString()) {
              audioUploadStatus.value = UploadStatus.failed;
            } else if (hashMap["attachmentType"] ==
                AttachmentType.Map.name.toString()) {
              mapUploadStatus.value = UploadStatus.failed;
            }
            showErrorMessage(response.message);
          }
          callback(response);
        },
        onComplete: () {},
        onError: (e) {
          if (hashMap["attachmentType"] == AttachmentType.Image.name.toString()) {
            imageUploadStatus.value = UploadStatus.failed;
          } else if (hashMap["attachmentType"] ==
              AttachmentType.Video.name.toString()) {
            videoUploadStatus.value = UploadStatus.failed;
          } else if (hashMap["attachmentType"] ==
              AttachmentType.Document.name.toString()) {
            documentUploadStatus.value = UploadStatus.failed;
          } else if (hashMap["attachmentType"] ==
              AttachmentType.Audio.name.toString()) {
            audioUploadStatus.value = UploadStatus.failed;
          } else if (hashMap["attachmentType"] == AttachmentType.Map.name.toString()) {
            mapUploadStatus.value = UploadStatus.failed;
          }
          callback(e);
          // showSnackBar(Get.context!, (e as BaseApiException).message);
          Get.snackbar("Error", (e as BaseException).message,
              snackPosition: SnackPosition.BOTTOM, colorText: Colors.red);
        });
  }

/*
  Future<void> updateBeatAttachment(
      HashMap<String, dynamic> hashMap, Function callback) async {
    return callDataService(
        onStart: () {
          if (hashMap["attachmentType"] == attachmentType.Image.name.toString()) {
            imageUploadStatus.value = UploadStatus.inProgress;
          } else if (hashMap["attachmentType"] == attachmentType.Video.name.toString()) {
            videoUploadStatus.value = UploadStatus.inProgress;
          } else if (hashMap["attachmentType"] == attachmentType.Document.name.toString()) {
            documentUploadStatus.value = UploadStatus.inProgress;
          }
        },
        _globalRepository.updateBeatAttachment(hashMap, (double value) {
          if (hashMap["attachmentType"] == attachmentType.Image.name.toString()) {
            imageUploadingProgress.value = value / 100;
          } else if (hashMap["attachmentType"] == attachmentType.Video.name.toString()) {
            videoUploadingProgress.value = value / 100;
          } else if (hashMap["attachmentType"] == attachmentType.Document.name.toString()) {
            documentUploadingProgress.value = value / 100;
          }
        }),
        onSuccess: (ListResponse response) {
          if (response.statusCode == 1) {
            //   showSuccessMessage(response.message);
            if (hashMap["attachmentType"] == attachmentType.Image.name.toString()) {
              imageUploadStatus.value = UploadStatus.completed;
            } else if (hashMap["attachmentType"] == attachmentType.Video.name.toString()) {
              videoUploadStatus.value = UploadStatus.completed;
            } else if (hashMap["attachmentType"] == attachmentType.Document.name.toString()) {
              documentUploadStatus.value = UploadStatus.completed;
            }
          } else {
            if (hashMap["attachmentType"] == attachmentType.Image.name.toString()) {
              imageUploadStatus.value = UploadStatus.failed;
            } else if (hashMap["attachmentType"] == attachmentType.Video.name.toString()) {
              videoUploadStatus.value = UploadStatus.failed;
            } else if (hashMap["attachmentType"] == attachmentType.Document.name.toString()) {
              documentUploadStatus.value = UploadStatus.failed;
            }
            showErrorMessage(response.message);
          }
          callback(response);
        },
        onComplete: () {},
        onError: (e) {
          if (hashMap["attachmentType"] == attachmentType.Image.name.toString()) {
            imageUploadStatus.value = UploadStatus.failed;
          } else if (hashMap["attachmentType"] == attachmentType.Video.name.toString()) {
            videoUploadStatus.value = UploadStatus.failed;
          } else if (hashMap["attachmentType"] == attachmentType.Document.name.toString()) {
            documentUploadStatus.value = UploadStatus.failed;
          }
          callback(e);
          // showSnackBar(Get.context!, (e as BaseApiException).message);
          Get.snackbar("Error", (e as BaseException).message,
              snackPosition: SnackPosition.BOTTOM, colorText: Colors.red);
        });
  }
*/

  @override
  void onClose() {
    _subscription.unsubscribe();
    VideoCompress.cancelCompression();
    super.onClose();
  }
}
