import 'dart:collection';

import '../../../core/model/data_response.dart';
import '../../repository/dashboard/model/dashboard_model.dart';

abstract class DashboardRemoteDataSource {
  Future<DataResponse<DashboardModel>> changePassword(
      HashMap<String, dynamic> hashMap);
}
