import 'dart:collection';

import '/app/core/base/base_remote_source.dart';
import '../../../../data/end_points.dart';
import '../../../../utils/safe_convert.dart';
import '../../../core/model/data_response.dart';
import '../../repository/dashboard/model/dashboard_model.dart';
import 'dashboard_remote_data.dart';

class DashboardRemoteDataSourceImpl extends BaseRemoteSource
    implements DashboardRemoteDataSource {
  @override
  Future<DataResponse<DashboardModel>> changePassword(
      HashMap<String, dynamic> hashMap) {
    var endpoint = Endpoints.passwordChangeUrl;
    var dioCall = dioClient.post(endpoint, data: hashMap);

    try {
      return callApiWithErrorParser(dioCall).then(
          (response) => /* DataResponse.fromJson(response.data, () {
            if(response.data["ResponseObj"] is Map<String,dynamic>) {
              return PoVisitResponse.fromJson(response.data["ResponseObj"]);
            }else{
              return null;
            }
              }));*/
              DataResponse.fromJson(
                  response.data,
                  () => DashboardModel.fromJson(asT<Map<String, dynamic>>(
                      response.data, "ResponseObj"))));
    } catch (e) {
      rethrow;
    }
  }
}
