import 'package:get/get.dart';

import '../../../data/remote/bc_case_bi/bc_case_bi_remote_data_source.dart';
import '../../../data/remote/bc_case_bi/bc_case_bi_remote_data_source_impl.dart';
import '../../../data/repository/bc_case_bi/bc_case_bi_repository.dart';
import '../../../data/repository/bc_case_bi/bc_case_bi_repository_impl.dart';
import '../../bc_case_bi/bc_case_bi_controller.dart';

class TechnicalReportBinding extends Bindings {
  @override
  void dependencies() {
/*    Get.lazyPut<TechnicalReportRemoteDataSource>(
      () => TechnicalReportRemoteDataSourceImpl(),
      tag: (TechnicalReportRemoteDataSource).toString(),
    );
    Get.lazyPut<TechnicalReportRepository>(
      () => TechnicalReportRepositoryImpl(),
      tag: (TechnicalReportRepository).toString(),
    );*/
/*
    Get.lazyPut<TechnicalReportController>(
      () => TechnicalReportController(),
    );
*/

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
