import 'dart:collection';

import 'package:apps_rtims/app/core/core.dart';
import 'package:apps_rtims/app/data/remote/po/dto/save_po_dto.dart';
import 'package:apps_rtims/app/data/repository/beat_po/model/Location_details.dart';
import 'package:apps_rtims/app/data/repository/beat_po/model/search_type_data.dart';

import '../../../core/model/CustomModel.dart';
import '../../repository/beat_po/model/po_visit_response.dart';

abstract class PORemoteDataSource {
  Future<DataResponse<SearchTypeData>> searchTypeById(String searchType);

  Future<ListResponse<LocationDetails>> locationByPoId(String firId);

  Future<DataResponse<SavePoDto>> savePOVisit(SavePoDto dto);

  Future<DataResponse<PoVisitResponse>> savePOVisitAudioWithPOID(
      HashMap<String, dynamic> hashMap);

  Future<DataResponse<CustomModel<String>>> updatePOAttachment(
      HashMap<String, dynamic> hashMap, Function uploadingCallback);
}
