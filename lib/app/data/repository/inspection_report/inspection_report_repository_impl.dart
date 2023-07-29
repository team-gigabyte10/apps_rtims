import 'package:get/get.dart';

import '../../remote/inspection_report/inspection_report_remote_data_source.dart';
import 'inspection_report_repository.dart';

class InspectionReportRepositoryImpl implements InspectionReportRepository {
  final InspectionReportRemoteDataSource _remoteDataSource =
      Get.find(tag: (InspectionReportRemoteDataSource).toString());

}
