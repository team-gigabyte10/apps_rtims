import 'dart:collection';

import 'package:apps_rtims/app/core/core.dart';
import 'package:apps_rtims/app/data/repository/bc_case_bi/model/Inspection_details_model.dart';

import 'model/BcCaseBiFileModel.dart';
import 'model/details.dart';

abstract class BcCaseBiRepository {
  Future<DataResponse<InspectionDetailsModel>> getFileByIDWithInspectionDetails(
      String id);

  Future<DataResponse<Details>> saveInspectionDetailsBCCase(
      Map<String, dynamic> details);

  Future<DataResponse<Details>> updateInspectionDetailsBCCase(
      Map<String, dynamic> details);

  Future<DataResponse<BcCaseBiFileModel>> updateApplicationFileGeofence(
      HashMap<String, dynamic> hashMap);
}
