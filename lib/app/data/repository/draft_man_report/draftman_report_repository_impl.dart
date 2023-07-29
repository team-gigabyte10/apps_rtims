import 'package:get/get.dart';
import '../../remote/draft_man_report/draftman_report_remote_data_source.dart';
import 'draftman_report_repository.dart';

class DraftManReportRepositoryImpl implements DraftManReportRepository {
  final DraftManReportRemoteDataSource _remoteSource =
      Get.find(tag: (DraftManReportRemoteDataSource).toString());

}
