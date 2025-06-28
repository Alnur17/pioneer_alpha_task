import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/modules/home/controllers/theme_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final ThemeController themeController = Get.put(ThemeController());

  themeController.isDarkMode.value = themeController.box.read('isDarkMode') ?? false;

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
    ),
  );
}
