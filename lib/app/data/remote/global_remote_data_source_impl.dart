import 'dart:collection';

import 'package:apps_rtims/app/core/model/data_response.dart';
import 'package:dio/dio.dart';

import '../repository/bc_case_bi/model/BcCaseBiFileModel.dart';
import '/app/core/base/base_remote_source.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/remote/global_remote_data_source.dart';
import '/app/network/dio_provider.dart';
import '../../../data/end_points.dart';
import '../../core/model/list_response.dart';
import '../model/attachment_model.dart';
import '../model/beat_attachment_model.dart';

class GlobalRemoteDataSourceImpl extends BaseRemoteSource
    implements GlobalRemoteDataSource {


  @override
  Future<ListResponse<BcCaseBiFileModel>> getListByAssingedPerson(HashMap<String, dynamic> hashMap) {
    var endpoint = Endpoints.getListByAssingedPersonUrl;
    var dioCall = dioClient.post(endpoint, data: hashMap);
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => ListResponse.fromJson(response.data, () {
        List<BcCaseBiFileModel> items = [];
        if (response.data['responseObj'] != null) {
          response.data['responseObj'].forEach((v) {
            items.add(BcCaseBiFileModel.fromJson(v));
          });
        }
        return items;
      }));
    } catch (e) {
      rethrow;
    }
  }
  @override
  Future<ListResponse<AttachmentModel>> updateBcCaseBiAttachment(
      HashMap<String, dynamic> hashMap, Function uploadingCallback) {
    var endpoint = Endpoints.saveApplicationFileAttachmentsUrl;
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
      return callApiWithErrorParser(dioCall)
          .then((response) => ListResponse.fromJson(response.data, () {
                List<AttachmentModel> items = [];
                if (response.data['ResponseObj'] != null) {
                  response.data['ResponseObj'].forEach((v) {
                    items.add(AttachmentModel.fromJson(v));
                  });
                }
                return items;
              }));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ListResponse<BeatAttachmentModel>> updateBeatAttachment(
      HashMap<String, dynamic> hashMap, Function uploadingCallback) {
    var endpoint = Endpoints.updateBeatAttachmentUrl;
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
      return callApiWithErrorParser(dioCall)
          .then((response) => ListResponse.fromJson(response.data, () {
                List<BeatAttachmentModel> items = [];
                if (response.data['ResponseObj'] != null) {
                  response.data['ResponseObj'].forEach((v) {
                    items.add(BeatAttachmentModel.fromJson(v));
                  });
                }
                return items;
              }));
    } catch (e) {
      rethrow;
    }
  }



}
