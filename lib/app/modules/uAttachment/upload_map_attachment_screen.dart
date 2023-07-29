import 'dart:collection';
import 'dart:io';
import 'dart:math';

import 'package:apps_rtims/app/core/core.dart';
import 'package:apps_rtims/app/core/model/upload_status.dart';
import 'package:apps_rtims/app/modules/dashboard/dashboard_controller.dart';
import 'package:apps_rtims/app/modules/dashboard/dashboard_screen.dart';
import 'package:apps_rtims/app/modules/global_controller.dart';
import 'package:apps_rtims/utils/utils.dart';
import 'package:dio/dio.dart' as dio;
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_compress/video_compress.dart';

import '../../../../utils/extensions.dart';
import '../../core/base/base_view.dart';
import '../../core/values/app_values.dart';
import '../../core/widget/background.dart';

@immutable
class UploadMapAttachmentView extends BaseView<GlobalController> {
  final ImagePicker picker = ImagePicker();

  bool finalValidation() {
    if (controller.imageFiles.isEmpty &&
        controller.videoFile.isEmpty &&
        controller.documentFiles.isEmpty) {
      showSnackBar(Get.context!, appLocalization.msg1);
      return false;
    }
    return true;
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return getAppBar(context, "বার্ড আই ভিউ সংযুক্তি", enableBackButton: true,
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
        final leavePage = await Utils.leaveDialog(context,
            title: appLocalization.msgLeave,
            cancelLabel: appLocalization.titleCancel,
            doneLabel: appLocalization.titleLeave);
        return leavePage ?? false;
      },
      child: Obx(() {
        return Background(
            child: Column(
          children: [
            GoogleMap(
              mapType: MapType.satellite,
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
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              mapToolbarEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(myPosition.value.latitude ?? 23.777176,
                    myPosition.value.longitude ?? 90.399452),
                zoom: 19,
              ),
              markers: {
                /*    Marker(
                            markerId: const MarkerId("MyLocation"),
                            position: LatLng(controller.position?.latitude ?? 23.777176,
                                controller.position?.longitude ?? 90.399452)),*/
              },
            ).expand(),
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
                      child: Text(
                        appLocalization.titleCancel,
                        style: TextStyle(fontSize: 18),
                      ).paddingAll(14),
                    )
                        .width(double.infinity)
                        .paddingRight(AppValues.smallPadding)
                        .flexible(),
                    ElevatedButton(
                      onPressed: () {
                        captureAndSaveImage();
                      },
                      child: Text(
                        "ছবি তুলুন",
                        style: TextStyle(fontSize: 18),
                      ),
                    ).paddingLeft(AppValues.smallPadding).flexible(),
                  ],
                ),
              ],
            ).paddingAll(10),
          ],
        ));
      }),
    );
  }


  Future<Uint8List?> captureWidgetToImage(GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
       ui.Image image = await boundary.toImage(pixelRatio: 1.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      print(e);
      return null;
    }
  }

// Usage example
  GlobalKey _widgetKey = GlobalKey();

// Capture the widget and save as an image
  void captureAndSaveImage() async {
    final cacheDir = await getTemporaryDirectory();
    Uint8List? imageBytes  = await controller.mapController?.takeSnapshot();
  //  Uint8List? imageBytes = await captureWidgetToImage(_widgetKey);
    if (imageBytes != null) {
    String filePath = "${cacheDir.path}/map_${Random().nextInt(10000)}.png";
    await saveImage(imageBytes, filePath);
    Get.back(result: filePath);

    }
  }
  Future<void> saveImage(Uint8List imageBytes, String filePath) async {
    final compressedImageBytes = await FlutterImageCompress.compressWithList(
      imageBytes,
      minHeight: 1920,
      minWidth: 1080,
      quality: 90,
    );

    final file = File(filePath);
    await file.writeAsBytes(compressedImageBytes);
    print('Image saved: $filePath');
  }



  void showSnackBar(BuildContext context, String text,
      {Color color = Colors.red}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: color, content: Text(text)),
    );
  }
}
