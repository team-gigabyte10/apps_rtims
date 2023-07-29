import 'dart:collection';

import 'package:apps_rtims/app/core/core.dart';
import 'package:apps_rtims/app/data/repository/auth/model/user_model.dart';
import 'package:apps_rtims/app/data/repository/bc_case_bi/model/BcCaseBiFileModel.dart';
import 'package:apps_rtims/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/app/core/base/base_controller.dart';
import '/app/data/repository/global_repository.dart';
import '../../core/resource.dart';
import '../../network/exceptions/base_exception.dart';
import '../auth/auth_controller.dart';

class FileListController extends BaseController {
  final GlobalRepository _repository =
      Get.find(tag: (GlobalRepository).toString());
  final data = Get.arguments;
  Future<UserModel?> userModel = Get.find<AuthController>().userModel;
  List<BcCaseBiFileModel> bcCaseBiFileList = <BcCaseBiFileModel>[].obs;
  RxBool isLoading = false.obs;
  final BcCaseBiFileModel responseValue = BcCaseBiFileModel();

  final responseData = Resource.init(<Map<String, dynamic>>[], "").obs;

  //late Rx<BcCaseBiFileModel> listItemValue = responseValue.obs;

  @override
  void onInit() async {
    getListData();

    super.onInit();
  }

  getListData() async {
    HashMap<String, dynamic> map = HashMap();
    HashMap<String, dynamic> requestObject = HashMap();
    UserModel? user = await userModel;
    requestObject.addAll({
      "userID": user?.userAutoID,
      "statusID": "2",
      "inspectionFileType": (data["for"] == Routes.BC_CASE_BI)
          ? 1
          : (data["for"] == Routes.TECHNICAL_REPORT)
              ? 2
              : 0,
    });
    map["requestObj"] = requestObject;

    getListByAssingedPerson(map, (response) {});
  }

  //Login
  Future<void> getListByAssingedPerson(
      HashMap<String, dynamic> hashMap, Function callback) async {
    isLoading.value = true;
    return callDataService(_repository.getListByAssingedPerson(hashMap),
        onStart: () {
      showLoading();
      responseData.value = Resource.loading([]);
    }, onSuccess: (ListResponse<BcCaseBiFileModel> data) {
      if (data.statusCode == 1) {
        if (data.responseObj != null) {
          var listData = data.responseObj;
          if (listData?.isNotEmpty == true) {
            bcCaseBiFileList.addAll(listData!);
          }
          //_nonVisitedData.clear();
          if (listData?.isNotEmpty == true) {
            final data = <Map<String, dynamic>>[];
            listData!.asMap().forEach((index, element) {
              String refNo = element.refNo.toString();
              String dateString = element.assignDate.toString();
              DateTime assignDate = DateTime.parse(dateString);
              String thanaName = element.thanaNameBangla.toString();
              String mouzaName = element.mouzaNameBangla.toString();
              data.add({
                "Ref. No": "$refNo",
                "Assign Date": DateFormat("dd-MM-yyyy").format(assignDate),
                "Thana": "$thanaName",
                "Mouza": "$mouzaName"
              });
            });
            responseData.value = Resource.success(data);
          } else {
            responseData.value = Resource.success([]);
          }
        }
      }
      callback(data);
      isLoading.value = false;
    }, onError: (e) {
      responseData.value = Resource.error([], (e as BaseException).message);
      callback(e);
      isLoading.value = false;
      Get.snackbar("Error", (e as BaseException).message,
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.red);
    });
  }
}
