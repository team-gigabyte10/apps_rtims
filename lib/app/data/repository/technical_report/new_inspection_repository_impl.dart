import 'package:apps_rtims/app/data/repository/technical_report/new_inspection_repository.dart';
import 'package:get/get.dart';
import '../../remote/technical_report/technical_report_remote_data_source.dart';


class TechnicalReportRepositoryImpl implements TechnicalReportRepository {
  final TechnicalReportRemoteDataSource _remoteSource =
      Get.find(tag: (TechnicalReportRemoteDataSource).toString());

}
