import 'package:apps_rtims/app/data/remote/global_remote_data_source.dart';
import 'package:apps_rtims/app/data/repository/global_repository.dart';
import 'package:get/get.dart';

import '../../data/remote/global_remote_data_source_impl.dart';
import '../../data/repository/global_repository_impl.dart';
import 'file_list_controller.dart';

class FileListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FileListController>(
      () => FileListController(),
    );
    Get.lazyPut<GlobalRepository>(
          () => GlobalRepositoryImpl(),
      tag: (GlobalRepository).toString(),
    );
    Get.lazyPut<GlobalRemoteDataSource>(
          () => GlobalRemoteDataSourceImpl(),
      tag: (GlobalRemoteDataSource).toString(),
    );
  }
}
