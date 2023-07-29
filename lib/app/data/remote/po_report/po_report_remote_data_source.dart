import 'dart:collection';

import '../../../core/model/list_response.dart';
import '../../repository/po_visit_report/model/po_report_model.dart';

abstract class POReportRemoteDataSource {
  Future<ListResponse<PoReportModel>> getPONonVisitReportData(
      HashMap<String, dynamic> map);

  Future<ListResponse<PoReportModel>> getPOVisitedReportData(
      HashMap<String, dynamic> map);
}
