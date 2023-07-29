import 'package:apps_rtims/app/data/repository/sp_case/sp_case_repository.dart';
import 'package:get/get.dart';
import '../../remote/sp_case/sp_case_remote_data_source.dart';


class SPCaseRepositoryImpl implements SPCaseRepository {
  final SPCaseRemoteDataSource _remoteSource =
      Get.find(tag: (SPCaseRemoteDataSource).toString());

}
