import 'dart:collection';

import 'package:apps_rtims/app/core/model/data_response.dart';
import 'package:apps_rtims/app/data/repository/bc_case_bi/model/BcCaseBiFileModel.dart';
import 'package:apps_rtims/app/data/repository/bc_case_bi/model/Inspection_details_model.dart';

import '../../../../data/end_points.dart';
import '../../../../utils/safe_convert.dart';
import '../../../core/base/base_remote_source.dart';
import '../../repository/bc_case_bi/model/details.dart';
import 'bc_case_bi_remote_data_source.dart';

class BcCaseBiRemoteDataSourceImpl extends BaseRemoteSource
    implements BcCaseBiRemoteDataSource {
  @override
  Future<DataResponse<InspectionDetailsModel>> getFileByIDWithInspectionDetails(
      String id) {
    var endpoint = Endpoints.getFileByIDWithInspectionDetailsUrl + "/$id";
    var dioCall = dioClient.get(endpoint);
    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          DataResponse.fromJson(
              response.data,
              () => InspectionDetailsModel.fromJson(asT<Map<String, dynamic>>(response.data, "responseObj"))));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataResponse<Details>> saveInspectionDetailsBCCase(
      Map<String, dynamic> details) {
    var endpoint = Endpoints.inspectionDetailsBCCaseUrl;
    var dioCall = dioClient.post(endpoint, data: {"requestObj": details});
    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          DataResponse.fromJson(
              response.data,
              () => Details.fromJson(
                  asT<Map<String, dynamic>>(response.data, "responseObj"))));
    } catch (e) {
      rethrow;
    }
  }
  @override
  Future<DataResponse<Details>> updateInspectionDetailsBCCase(
      Map<String, dynamic> details) {
    var endpoint = Endpoints.inspectionDetailsBCCaseUrl;
    var dioCall = dioClient.put(endpoint, data: {"requestObj": details});
    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          DataResponse.fromJson(
              response.data,
              () => Details.fromJson(
                  asT<Map<String, dynamic>>(response.data, "responseObj"))));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataResponse<BcCaseBiFileModel>> updateApplicationFileGeofence(HashMap<String, dynamic> hashMap) {
    var endpoint = Endpoints.updateApplicationFileGeofenceUrl;
    var dioCall = dioClient.put(endpoint, data: {"requestObj": hashMap});
    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          DataResponse.fromJson(
              response.data,
                  () => BcCaseBiFileModel.fromJson(
                  asT<Map<String, dynamic>>(response.data, "responseObj"))));
    } catch (e) {
      rethrow;
    }
  }
}
