import 'dart:collection';

import 'package:apps_rtims/app/core/model/data_response.dart';
import 'package:apps_rtims/app/data/remote/po/dto/save_po_dto.dart';
import 'package:apps_rtims/app/data/repository/beat_po/model/po_visit_response.dart';
import 'package:apps_rtims/data/end_points.dart';
import 'package:dio/dio.dart';

import '/app/core/base/base_remote_source.dart';
import '../../../core/model/CustomModel.dart';
import '../../../core/model/list_response.dart';
import '../../repository/beat_po/model/Location_details.dart';
import '../../repository/beat_po/model/search_type_data.dart';
import 'po_remote_data_source.dart';

class PORemoteDataSourceImpl extends BaseRemoteSource
    implements PORemoteDataSource {
  @override
  Future<DataResponse<SearchTypeData>> searchTypeById(String searchType) {
    var endpoint = Endpoints.searchTypeUrl + "?id=$searchType";
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          DataResponse.fromJson(
              response.data,
              () => response.data['ResponseObj'] != null
                  ? SearchTypeData.fromJson(response.data['ResponseObj'])
                  : null));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ListResponse<LocationDetails>> locationByPoId(String firId) {
    var endpoint = Endpoints.locationByPoIdUrl + "?id=$firId";
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => ListResponse.fromJson(response.data, () {
                List<LocationDetails> items = [];
                if (response.data['ResponseObj'] != null) {
                  response.data['ResponseObj'].forEach((v) {
                    items.add(LocationDetails.fromJson(v));
                  });
                }
                return items;
              }));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataResponse<SavePoDto>> savePOVisit(SavePoDto dto) {
    var endpoint = Endpoints.poSaveUrl;
    var dioCall = dioClient.post(endpoint, data: dto.toJson());

    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          DataResponse.fromJson(response.data,
              () => SavePoDto.fromJson(response.data["ResponseObj"])));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataResponse<PoVisitResponse>> savePOVisitAudioWithPOID(
      HashMap<String, dynamic> hashMap) {
    var endpoint = Endpoints.savePOVisitAudioWithPOIDUrl;
    final formData = FormData.fromMap(hashMap);
    var dioCall = dioClient.post(endpoint, data: formData);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => DataResponse.fromJson(response.data, () {
                if (response.data["ResponseObj"] is Map<String, dynamic>) {
                  return PoVisitResponse.fromJson(response.data["ResponseObj"]);
                } else {
                  return null;
                }
              }));
/*          DataResponse.fromJson(response.data,
              () => PoVisitResponse.fromJson(response.data["ResponseObj"])));*/
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataResponse<CustomModel<String>>> updatePOAttachment(
      HashMap<String, dynamic> hashMap, Function uploadingCallback) {
    var endpoint = Endpoints.updatePOAttachmentUrl;
    final formData = FormData.fromMap(hashMap);
    var dioCall = dioClient.post(
      endpoint,
      data: formData,
      onSendProgress: (int sent, int total) {
        double progress = sent / total * 100;
        uploadingCallback(progress);
      },
    );

    try {
      return callApiWithErrorParser(dioCall).then((response) =>
          DataResponse.fromJson(response.data,
              () => CustomModel<String>(data: response.data["ResponseObj"])));
    } catch (e) {
      rethrow;
    }
  }
}
