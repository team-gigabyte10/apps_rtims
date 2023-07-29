import 'dart:collection';

import '../../../core/model/data_response.dart';
import '../auth/model/user_model.dart';
import 'model/dashboard_model.dart';

abstract class DashRepository {
  Future<UserModel> getUserInfo();

  Future<DataResponse<DashboardModel>> changePassword(
      HashMap<String, dynamic> hashMap);
}
