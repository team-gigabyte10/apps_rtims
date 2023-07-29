import 'package:get/get.dart';
import '../../data/remote/draft_man_report/draftman_report_remote_data_source.dart';
import '../../data/remote/draft_man_report/draftman_report_remote_data_source_impl.dart';
import '../../data/repository/draft_man_report/draftman_report_repository.dart';
import '../../data/repository/draft_man_report/draftman_report_repository_impl.dart';
import 'draft_man_controller.dart';

class DraftManBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DraftManReportRemoteDataSource>(
      () => DraftManReportRemoteDataSourceImpl(),
      tag: (DraftManReportRemoteDataSource).toString(),
    );
    Get.lazyPut<DraftManReportRepository>(
      () => DraftManReportRepositoryImpl(),
      tag: (DraftManReportRepository).toString(),
    );
    Get.lazyPut<DraftManController>(
      () => DraftManController(),
    );
  }
}
