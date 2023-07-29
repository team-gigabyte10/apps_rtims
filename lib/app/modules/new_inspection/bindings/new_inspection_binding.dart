import 'package:get/get.dart';
import '../../../data/remote/new_inspection/new_inspection_remote_data_source.dart';
import '../../../data/remote/new_inspection/new_inspection_remote_data_source_impl.dart';
import '../../../data/repository/new_inspection/new_inspection_repository.dart';
import '../../../data/repository/new_inspection/new_inspection_repository_impl.dart';
import '../controllers/new_inspection_controller.dart';

class NewInspectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewInspectionRemoteDataSource>(
      () => NewInspectionRemoteDataSourceImpl(),
      tag: (NewInspectionRemoteDataSource).toString(),
    );
    Get.lazyPut<NewInspectionRepository>(
      () => NewInspectionRepositoryImpl(),
      tag: (NewInspectionRepository).toString(),
    );
    Get.lazyPut<NewInspectionController>(
      () => NewInspectionController(),
    );
  }
}
