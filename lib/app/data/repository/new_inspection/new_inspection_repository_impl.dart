import 'package:get/get.dart';
import '../../remote/new_inspection/new_inspection_remote_data_source.dart';
import 'new_inspection_repository.dart';

class NewInspectionRepositoryImpl implements NewInspectionRepository {
  final NewInspectionRemoteDataSource _remoteSource =
      Get.find(tag: (NewInspectionRemoteDataSource).toString());

}
