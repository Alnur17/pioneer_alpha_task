import 'package:get/get.dart';

import 'package:pioneer_alpha_task/app/modules/home/controllers/theme_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(
      () => ThemeController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
