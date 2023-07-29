import 'package:apps_rtims/app/modules/sp_case/sp_case_controller.dart';
import 'package:get/get.dart';
import '../../data/remote/sp_case/sp_case_remote_data_source.dart';
import '../../data/remote/sp_case/sp_case_remote_data_source_impl.dart';
import '../../data/repository/sp_case/sp_case_repository.dart';
import '../../data/repository/sp_case/sp_case_repository_impl.dart';

class SpCaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SPCaseRemoteDataSource>(
      () => SPCaseRemoteDataSourceImpl(),
      tag: (SPCaseRemoteDataSource).toString(),
    );
    Get.lazyPut<SPCaseRepository>(
      () => SPCaseRepositoryImpl(),
      tag: (SPCaseRepository).toString(),
    );
    Get.lazyPut<SPCaseController>(
      () => SPCaseController(),
    );
  }
}
