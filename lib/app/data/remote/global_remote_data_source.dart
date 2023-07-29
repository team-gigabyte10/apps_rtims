import 'dart:collection';

import 'package:apps_rtims/app/core/core.dart';

import '../repository/bc_case_bi/model/BcCaseBiFileModel.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '../../core/model/list_response.dart';
import '../model/attachment_model.dart';
import '../model/beat_attachment_model.dart';

abstract class GlobalRemoteDataSource {

  Future<ListResponse<AttachmentModel>> updateBcCaseBiAttachment(
      HashMap<String, dynamic> hashMap, Function uploadingCallback);

  Future<ListResponse<BeatAttachmentModel>> updateBeatAttachment(
      HashMap<String, dynamic> hashMap, Function uploadingCallback);
  Future<ListResponse<BcCaseBiFileModel>> getListByAssingedPerson(HashMap<String, dynamic> hashMap);

}
