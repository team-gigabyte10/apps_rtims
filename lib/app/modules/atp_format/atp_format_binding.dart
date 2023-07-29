import 'package:get/get.dart';
import '../../data/remote/atp_fromat/atp_remote_data_source.dart';
import '../../data/remote/atp_fromat/atp_remote_data_source_impl.dart';
import '../../data/repository/atp_fromat/atp_format_repository.dart';
import '../../data/repository/atp_fromat/atp_format_repository_impl.dart';
import 'atp_format_controller.dart';

class AtpFormatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AtpFormatRemoteDataSource>(
      () => AtpFormatRemoteDataSourceImpl(),
      tag: (AtpFormatRemoteDataSource).toString(),
    );
    Get.lazyPut<AtpFormatRepository>(
      () => AtpFormatRepositoryImpl(),
      tag: (AtpFormatRepository).toString(),
    );
    Get.lazyPut<AtpFormatController>(
      () => AtpFormatController(),
    );
  }
}
