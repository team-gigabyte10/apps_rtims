import 'package:get/get.dart';

import '../data/remote/new_inspection/new_inspection_remote_data_source.dart';
import '../data/remote/new_inspection/new_inspection_remote_data_source_impl.dart';
import '/app/data/remote/global_remote_data_source.dart';
import '/app/data/remote/global_remote_data_source_impl.dart';
import '../data/remote/auth/auth_remote_data_source.dart';
import '../data/remote/auth/auth_remote_data_source_impl.dart';
import '../data/remote/po/po_remote_data_source.dart';
import '../data/remote/po/po_remote_data_source_impl.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalRemoteDataSource>(
      () => GlobalRemoteDataSourceImpl(),
      tag: (GlobalRemoteDataSource).toString(),
    );
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(),
      tag: (AuthRemoteDataSource).toString(),
    );
    Get.lazyPut<NewInspectionRemoteDataSource>(
      () => NewInspectionRemoteDataSourceImpl(),
      tag: (NewInspectionRemoteDataSource).toString(),
    );
    Get.lazyPut<PORemoteDataSource>(
      () => PORemoteDataSourceImpl(),
      tag: (PORemoteDataSource).toString(),
    );
  }
}
