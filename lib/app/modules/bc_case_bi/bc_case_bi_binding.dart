import 'package:apps_rtims/app/data/remote/bc_case_bi/bc_case_bi_remote_data_source.dart';
import 'package:apps_rtims/app/modules/bc_case_bi/bc_case_bi_controller.dart';
import 'package:get/get.dart';

import '../../data/remote/bc_case_bi/bc_case_bi_remote_data_source_impl.dart';
import '../../data/repository/bc_case_bi/bc_case_bi_repository_impl.dart';
import '../../data/repository/bc_case_bi/bc_case_bi_repository.dart';


class BcCaseBiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BcCaseBiController>(
      () => BcCaseBiController(),
    );
    Get.lazyPut<BcCaseBiRepository>(
          () => BcCaseBiRepositoryImpl(),
      tag: (BcCaseBiRepository).toString(),
    );
    Get.lazyPut<BcCaseBiRemoteDataSource>(
          () => BcCaseBiRemoteDataSourceImpl(),
      tag: (BcCaseBiRemoteDataSource).toString(),
    );
  }
}
