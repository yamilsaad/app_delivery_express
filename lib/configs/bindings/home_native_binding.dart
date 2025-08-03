import 'package:app_delivery_express/presentation/screens/home_native_screen/controllers/home_native_controller.dart';
import 'package:get/get.dart';

class HomeNativeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeNativeController>(() => HomeNativeController());
  }
}
