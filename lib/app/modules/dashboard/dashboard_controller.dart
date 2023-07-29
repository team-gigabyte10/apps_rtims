import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../utils/color_resources.dart';
import '../../core/base/base_controller.dart';
import '../../core/model/data_response.dart';
import '../../core/values/app_values.dart';
import '../../core/values/text_styles.dart';
import '../../data/repository/auth/model/user_model.dart';
import '../../data/repository/dashboard/dash_repository.dart';
import '../../network/exceptions/base_exception.dart';
import '../auth/auth_controller.dart';
import 'dashboard_screen.dart';

Rx<MyLocation> myPosition = MyLocation(longitude: 0.0, latitude: 0.0).obs;

class DashboardController extends BaseController {
  final DashRepository _dashRepository =
      Get.find(tag: (DashRepository).toString());
  Future<UserModel?> userModel = Get.find<AuthController>().userModel;
  var versionCode = "";
  var localVersionCode = '';
  Rx<VisitOption> visitOption = VisitOption.BC_CASE_BI.obs;
  GoogleMapController? mapController;
  RxBool isMapLoading = false.obs;
  RxBool isAllowBRMS = false.obs;
  var args = Get.arguments;

  RxBool obscureText1 = true.obs;
  RxBool obscureText2 = true.obs;
  RxBool obscureText3 = true.obs;

  // Rx<MyLocation> myPosition = MyLocation(longitude: 0.0, latitude: 0.0).obs;
  Position? position;

  StreamSubscription<Position>? _positionStreamSubscription;

  //Position? lastPosition;

  clearUser() {
    Get.find<AuthController>().clearUser();
  }

  @override
  Future<void> onInit() async {
    final user = await userModel;
    //isAllowBRMS.value = user?.isAllowBRMS ?? false;

    super.onInit();
    // lastPosition = await Geolocator.getLastKnownPosition();
    determinePosition();
/*    Stream.periodic(10.seconds, (_) {
     determinePosition();
    }).listen((event) {

    });*/

    await startTracking();
  }

  Future<Position?> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showErrorMessage('Location services are disabled.');
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showErrorMessage('Location permissions are denied');
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      showErrorMessage(
          'Location permissions are permanently denied, we cannot request permissions.');
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var posi = await Geolocator.getCurrentPosition();
    position = posi;
    myPosition.value =
        MyLocation(latitude: posi.latitude, longitude: posi.longitude);
    mapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(position?.latitude ?? 0.0, position?.longitude ?? 0.0),
        zoom: 18.0,
      ),
    ));
    return posi;
  }

  Future<void> startTracking() async {
    await determinePosition();

    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 0,
    );

    final positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings);
    _positionStreamSubscription = positionStream.handleError((error) {
      _positionStreamSubscription?.cancel();
      _positionStreamSubscription = null;
    }).listen((position) {
      this.position = position;
      myPosition.value = MyLocation(
          latitude: position.latitude, longitude: position.longitude);
/*      mapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude ?? 0.0, position.longitude ?? 0.0),
          zoom: 18.0,
        ),
      ));*/
      print(position == null
          ? 'Unknown'
          : '${position.latitude.toString()}, ${position.longitude.toString()}');
    });

    // _timer = Timer.periodic(const Duration(minutes: 1), (_) async {
    //   final dbHelper = DBHelper();
    //   await dbHelper.insertLocation(
    //       position.latitude, position.longitude, DateTime.now().toString());
    // });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    if (_positionStreamSubscription != null) {
      _positionStreamSubscription!.cancel();
      _positionStreamSubscription = null;
    }
  }

  void toggle1() {
    obscureText1.value = !obscureText1.value;
  }

  void toggle2() {
    obscureText2.value = !obscureText2.value;
  }

  void toggle3() {
    obscureText3.value = !obscureText3.value;
  }

  Future<void> passwordChange(
      HashMap<String, dynamic> hashMap, Function callback) {
    return callDataService(_dashRepository.changePassword(hashMap),
        onSuccess: (DataResponse response) {
      callback(response);
    }, onError: (e) {
      callback(e);

      Get.snackbar("Error", (e as BaseException).message,
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.red);
    });
  }

  void showDownloaderDialog(String title, double width) {
    Get.generalDialog(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return ScaffoldMessenger(
          child: Builder(builder: (context) {
            return Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Container(
                      height: 200,
                      width: width,
                      margin: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: pageTitleStyle.copyWith(
                                color: ColorResources.kPrimaryColor),
                            textAlign: TextAlign.center,
                          ).width(double.infinity),
                          10.height,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14.0))),
                                ),
                                child: const Text(
                                  "Cancel ",
                                  style: TextStyle(fontSize: 18),
                                ).paddingAll(14),
                              )
                                  .width(double.infinity)
                                  .paddingRight(AppValues.smallPadding)
                                  .flexible(),
                              ElevatedButton(
                                onPressed: () {
                                  //  Get.back();
                                },
                                child: const Text(
                                  "Download ",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ).paddingLeft(AppValues.smallPadding).flexible(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
          }),
        );
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
  }
}

class MyLocation {
  double latitude = 0.0;

  double longitude = 0.0;
  double zoom = 6.0;

  MyLocation({required this.longitude, required this.latitude, zoom});
}
