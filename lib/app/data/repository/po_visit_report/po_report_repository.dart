import 'dart:collection';

import '../../../core/model/list_response.dart';
import 'model/po_report_model.dart';

abstract class POReportRepository {
  Future<ListResponse<PoReportModel>> getPONonVisitReportData(
      HashMap<String, dynamic> map);

  Future<ListResponse<PoReportModel>> getPOVisitedReportData(
      HashMap<String, dynamic> map);
}
