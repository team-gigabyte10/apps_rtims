import 'dart:collection';

import 'package:apps_rtims/app/core/model/data_response.dart';
import 'package:apps_rtims/app/data/remote/bc_case_bi/bc_case_bi_remote_data_source.dart';
import 'package:apps_rtims/app/data/repository/bc_case_bi/model/BcCaseBiFileModel.dart';
import 'package:apps_rtims/app/data/repository/bc_case_bi/model/Inspection_details_model.dart';
import 'package:get/get.dart' as get_x;
import 'package:get/get_core/src/get_main.dart';

import 'bc_case_bi_repository.dart';
import 'model/details.dart';

class BcCaseBiRepositoryImpl implements BcCaseBiRepository {
  final BcCaseBiRemoteDataSource _remoteSource =
      Get.find(tag: (BcCaseBiRemoteDataSource).toString());

  @override
  Future<DataResponse<InspectionDetailsModel>> getFileByIDWithInspectionDetails(
      String id) {
    return _remoteSource.getFileByIDWithInspectionDetails(id);
  }

  @override
  Future<DataResponse<Details>> saveInspectionDetailsBCCase(
      Map<String, dynamic> details) {
    return _remoteSource.saveInspectionDetailsBCCase(details);
  }

  @override
  Future<DataResponse<Details>> updateInspectionDetailsBCCase(
      Map<String, dynamic> details) {
    return _remoteSource.updateInspectionDetailsBCCase(details);
  }

  @override
  Future<DataResponse<BcCaseBiFileModel>> updateApplicationFileGeofence(
      HashMap<String, dynamic> hashMap) {
    return _remoteSource.updateApplicationFileGeofence(hashMap);
  }
}
