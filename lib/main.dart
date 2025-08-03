import 'package:app_delivery_express/configs/bindings/home_binding.dart';
import 'package:app_delivery_express/configs/routers/app_pages.dart';
import 'package:app_delivery_express/configs/routers/app_routes.dart';
import 'package:app_delivery_express/configs/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Delivery Express',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.homeMain,
      getPages: AppPages.pages,
      initialBinding: HomeBinding(), // Vinculación inicial para el home
    );
  }
}
