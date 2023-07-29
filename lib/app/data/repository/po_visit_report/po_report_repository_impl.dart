import 'dart:collection';

import 'package:apps_rtims/app/data/repository/po_visit_report/po_report_repository.dart';
import 'package:get/get.dart';

import '../../../core/model/list_response.dart';
import '../../remote/po_report/po_report_remote_data_source.dart';
import 'model/po_report_model.dart';

class POReportRepositoryImpl implements POReportRepository {
  final POReportRemoteDataSource _remoteSource =
      Get.find(tag: (POReportRemoteDataSource).toString());

  @override
  Future<ListResponse<PoReportModel>> getPONonVisitReportData(
      HashMap<String, dynamic> map) {
    return _remoteSource.getPONonVisitReportData(map);
  }

  @override
  Future<ListResponse<PoReportModel>> getPOVisitedReportData(
      HashMap<String, dynamic> map) {
    return _remoteSource.getPOVisitedReportData(map);
  }
}
