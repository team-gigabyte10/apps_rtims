import 'dart:collection';

import 'package:apps_rtims/app/core/core.dart';

import '../../core/model/list_response.dart';
import '../model/attachment_model.dart';
import '../model/beat_attachment_model.dart';
import 'bc_case_bi/model/BcCaseBiFileModel.dart';

abstract class GlobalRepository {
  Future<ListResponse<BcCaseBiFileModel>> getListByAssingedPerson(
      HashMap<String, dynamic> hashMap);

  Future<ListResponse<BeatAttachmentModel>> updateBeatAttachment(
      HashMap<String, dynamic> hashMap, Function uploadingCallback);

  Future<ListResponse<AttachmentModel>> updatePOAttachment(
      HashMap<String, dynamic> hashMap, Function uploadingCallback);
}
