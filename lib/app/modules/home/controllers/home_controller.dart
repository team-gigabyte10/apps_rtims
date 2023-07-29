import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/data/repository/global_repository.dart';

class HomeController extends BaseController {
  final GlobalRepository _repository =
      Get.find(tag: (GlobalRepository).toString());
}
