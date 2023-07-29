import 'package:get/get.dart';

import '/app/modules/home/controllers/home_controller.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/other/controllers/other_controller.dart';
import '/app/modules/settings/controllers/settings_controller.dart';
import '../../auth/auth_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
      fenix: true,
    );
    Get.lazyPut<OtherController>(
      () => OtherController(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
