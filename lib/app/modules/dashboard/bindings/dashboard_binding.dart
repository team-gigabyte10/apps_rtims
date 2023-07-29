import 'package:get/get.dart';

import '../../../data/remote/dashboard/dashboard_remote_data.dart';
import '../../../data/remote/dashboard/dashboard_remote_data_impl.dart';
import '../../../data/repository/dashboard/dash_repository.dart';
import '../../../data/repository/dashboard/dash_repository_impl.dart';
import '../../auth/auth_controller.dart';
import '../dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<DashRepository>(
      () => DashRepositoryImpl(),
      tag: (DashRepository).toString(),
    );
    Get.lazyPut<DashboardRemoteDataSource>(
      () => DashboardRemoteDataSourceImpl(),
      tag: (DashboardRemoteDataSource).toString(),
    );
  }
}
