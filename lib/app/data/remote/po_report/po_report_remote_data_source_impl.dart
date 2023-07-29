import 'dart:collection';

import 'package:apps_rtims/app/data/remote/po_report/po_report_remote_data_source.dart';

import '/app/core/base/base_remote_source.dart';
import '../../../../data/end_points.dart';
import '../../../core/model/list_response.dart';
import '../../repository/po_visit_report/model/po_report_model.dart';

class POReportRemoteDataSourceImpl extends BaseRemoteSource
    implements POReportRemoteDataSource {
  @override
  Future<ListResponse<PoReportModel>> getPONonVisitReportData(
      HashMap<String, dynamic> map) {
    var endpoint = Endpoints.nonVisitedReportUrl;
    var dioCall = dioClient.post(endpoint, data: map);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => ListResponse.fromJson(response.data, () {
                List<PoReportModel> items = [];
                if (response.data['ResponseObj'] != null) {
                  response.data['ResponseObj'].forEach((v) {
                    items.add(PoReportModel.fromJson(v));
                  });
                }
                return items;
              }));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ListResponse<PoReportModel>> getPOVisitedReportData(
      HashMap<String, dynamic> map) {
    var endpoint = Endpoints.visitedReportUrl;
    var dioCall = dioClient.post(endpoint, data: map);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => ListResponse.fromJson(response.data, () {
                List<PoReportModel> items = [];
                if (response.data['ResponseObj'] != null) {
                  response.data['ResponseObj'].forEach((v) {
                    items.add(PoReportModel.fromJson(v));
                  });
                }
                return items;
              }));
    } catch (e) {
      rethrow;
    }
  }
}
