import 'package:e_commercial/core/constants/app_themes.dart';
import 'package:e_commercial/core/utils/theme_controller.dart';
import 'package:e_commercial/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  await GetStorage.init();
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return MaterialApp.router(
      title: 'NeverEnd Shop',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: themeController.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().config(),
    );
  }
}