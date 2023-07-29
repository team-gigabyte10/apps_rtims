import 'dart:collection';

import '../../../core/model/CustomModel.dart';
import '../../../core/model/data_response.dart';
import '../../../core/model/list_response.dart';
import '../../remote/po/dto/save_po_dto.dart';
import 'model/Location_details.dart';
import 'model/po_visit_response.dart';
import 'model/search_type_data.dart';

abstract class PORepository {
  Future<DataResponse<SearchTypeData>> searchTypeById(String searchType);

  Future<ListResponse<LocationDetails>> locationByPoId(String locationDetail);

  Future<DataResponse<SavePoDto>> savePOVisit(SavePoDto dto);

  Future<DataResponse<PoVisitResponse>> savePOVisitAudioWithPOID(
      HashMap<String, dynamic> hashMap);

  Future<DataResponse<CustomModel<String>>> updatePOAttachment(
      HashMap<String, dynamic> hashMap, Function uploadingCallback);
}
