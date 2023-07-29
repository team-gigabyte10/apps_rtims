import 'package:apps_rtims/app/data/remote/global_remote_data_source.dart';
import 'package:apps_rtims/app/data/repository/beat_po/po_repository.dart';
import 'package:apps_rtims/app/data/repository/global_repository.dart';
import 'package:apps_rtims/app/modules/global_controller.dart';
import 'package:get/get.dart';
import '../../../data/remote/global_remote_data_source_impl.dart';
import '../../../data/remote/new_inspection/new_inspection_remote_data_source.dart';
import '../../../data/remote/new_inspection/new_inspection_remote_data_source_impl.dart';
import '../../../data/remote/po/po_remote_data_source.dart';
import '../../../data/remote/po/po_remote_data_source_impl.dart';
import '../../../data/repository/beat_po/po_repository_impl.dart';
import '../../../data/repository/global_repository_impl.dart';

class UploadAttachBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalRemoteDataSource>(
      () => GlobalRemoteDataSourceImpl(),
      tag: (GlobalRemoteDataSource).toString(),
    );
    Get.lazyPut<NewInspectionRemoteDataSource>(
      () => NewInspectionRemoteDataSourceImpl(),
      tag: (NewInspectionRemoteDataSource).toString(),
    );
    Get.lazyPut<PORemoteDataSource>(
      () => PORemoteDataSourceImpl(),
      tag: (PORemoteDataSource).toString(),
    );
    Get.lazyPut<GlobalRepository>(
      () => GlobalRepositoryImpl(),
      tag: (GlobalRepository).toString(),
    );
    Get.lazyPut<PORepository>(
      () => PORepositoryImpl(),
      tag: (PORepository).toString(),
    );
    Get.lazyPut<GlobalController>(
      () => GlobalController(),
    );
  }
}
