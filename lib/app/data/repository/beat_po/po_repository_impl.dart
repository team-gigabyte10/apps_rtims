import 'dart:collection';

import 'package:apps_rtims/app/data/repository/beat_po/po_repository.dart';
import 'package:get/get.dart';

import '../../../core/model/CustomModel.dart';
import '../../../core/model/data_response.dart';
import '../../../core/model/list_response.dart';
import '../../remote/po/dto/save_po_dto.dart';
import '../../remote/po/po_remote_data_source.dart';
import 'model/Location_details.dart';
import 'model/po_visit_response.dart';
import 'model/search_type_data.dart';

class PORepositoryImpl implements PORepository {
  final PORemoteDataSource _remoteSource =
      Get.find(tag: (PORemoteDataSource).toString());

  @override
  Future<DataResponse<SearchTypeData>> searchTypeById(String searchType) {
    return _remoteSource.searchTypeById(searchType);
  }

  @override
  Future<ListResponse<LocationDetails>> locationByPoId(String locationDetail) {
    return _remoteSource.locationByPoId(locationDetail);
  }

  @override
  Future<DataResponse<SavePoDto>> savePOVisit(SavePoDto dto) {
    return _remoteSource.savePOVisit(dto);
  }

  @override
  Future<DataResponse<PoVisitResponse>> savePOVisitAudioWithPOID(
      HashMap<String, dynamic> hashMap) {
    return _remoteSource.savePOVisitAudioWithPOID(hashMap);
  }

  @override
  Future<DataResponse<CustomModel<String>>> updatePOAttachment(
      HashMap<String, dynamic> hashMap, Function uploadingCallback) {
    return _remoteSource.updatePOAttachment(hashMap, uploadingCallback);
  }
}
