import 'package:get/get.dart';
import '../../core/base/base_controller.dart';
import '../../data/repository/atp_fromat/atp_format_repository.dart';


class AtpFormatController extends BaseController {
  final AtpFormatRepository _atpFormatRepository =
      Get.find(tag: (AtpFormatRepository).toString());


}
