import 'package:app_delivery_express/presentation/screens/home_native_screen/controllers/home_native_controller.dart';
import 'package:app_delivery_express/presentation/screens/home_screen/controllers/home_controller.dart';
import 'package:app_delivery_express/presentation/screens/home_main_screen.dart/controllers/main_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // Vincula el controlador principal
    Get.lazyPut<MainController>(() => MainController());

    // Vincula los controladores de las vistas que se cargarán en las pestañas
    // Usamos Get.lazyPut para que se creen solo cuando se necesitan
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeNativeController>(() => HomeNativeController());
  }
}
