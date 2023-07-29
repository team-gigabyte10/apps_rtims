import 'dart:collection';

import 'package:get/get.dart';

import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/remote/global_remote_data_source.dart';
import '/app/data/repository/global_repository.dart';
import '../../core/model/list_response.dart';
import '../model/attachment_model.dart';
import '../model/beat_attachment_model.dart';
import 'bc_case_bi/model/BcCaseBiFileModel.dart';

class GlobalRepositoryImpl implements GlobalRepository {
  final GlobalRemoteDataSource _remoteSource =
      Get.find(tag: (GlobalRemoteDataSource).toString());

  @override
  Future<ListResponse<BcCaseBiFileModel>> getListByAssingedPerson(
      HashMap<String, dynamic> hashMap) {
    return _remoteSource.getListByAssingedPerson(hashMap);
  }


  @override
  Future<ListResponse<BeatAttachmentModel>> updateBeatAttachment(
      HashMap<String, dynamic> hashMap, Function uploadingCallback) {
    return _remoteSource.updateBeatAttachment(hashMap, uploadingCallback);
  }

  @override
  Future<ListResponse<AttachmentModel>> updatePOAttachment(
      HashMap<String, dynamic> hashMap, Function uploadingCallback) {
    return _remoteSource.updateBcCaseBiAttachment(hashMap, uploadingCallback);
  }
}
