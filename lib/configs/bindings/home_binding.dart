// lib/presentations/screens/home_screen/bindings/home_binding.dart

import 'package:app_delivery_express/presentation/screens/home_screen/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
