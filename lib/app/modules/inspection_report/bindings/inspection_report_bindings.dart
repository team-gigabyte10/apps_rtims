import 'package:get/get.dart';
import '../../../data/remote/inspection_report/inspection_report_remote_data_source.dart';
import '../../../data/remote/inspection_report/inspection_report_remote_data_source_impl.dart';
import '../../../data/repository/inspection_report/inspection_report_repository.dart';
import '../../../data/repository/inspection_report/inspection_report_repository_impl.dart';
import '../inspection_report_controller.dart';

class InspectionReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InspectionReportRemoteDataSource>(
      () => InspectionReportRemoteDataSourceImpl(),
      tag: (InspectionReportRemoteDataSource).toString(),
    );

    Get.lazyPut<InspectionReportRepository>(
      () => InspectionReportRepositoryImpl(),
      tag: (InspectionReportRepository).toString(),
    );

    Get.lazyPut<InspectionReportController>(
      () => InspectionReportController(),
    );
  }
}
