import 'package:get/get.dart';
import '../../remote/atp_fromat/atp_remote_data_source.dart';
import 'atp_format_repository.dart';


class AtpFormatRepositoryImpl implements AtpFormatRepository {
  final AtpFormatRemoteDataSource _remoteSource =
      Get.find(tag: (AtpFormatRemoteDataSource).toString());

}
