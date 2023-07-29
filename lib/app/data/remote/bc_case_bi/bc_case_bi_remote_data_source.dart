import 'dart:collection';

import '../../../core/model/data_response.dart';
import '../../repository/bc_case_bi/model/BcCaseBiFileModel.dart';
import '../../repository/bc_case_bi/model/Inspection_details_model.dart';
import '../../repository/bc_case_bi/model/details.dart';

abstract class BcCaseBiRemoteDataSource {
  Future<DataResponse<InspectionDetailsModel>> getFileByIDWithInspectionDetails(
      String id);

  Future<DataResponse<BcCaseBiFileModel>> updateApplicationFileGeofence(
      HashMap<String, dynamic> hashMap);

  Future<DataResponse<Details>> saveInspectionDetailsBCCase(
      Map<String, dynamic> details);

  Future<DataResponse<Details>> updateInspectionDetailsBCCase(
      Map<String, dynamic> details);
}
