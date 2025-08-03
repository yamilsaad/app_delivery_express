import 'package:app_delivery_express/presentation/screens/menu_screen/controllers/menu_item_controller.dart';
import 'package:get/get.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    // El controlador de menú se crea con los argumentos pasados
    Get.lazyPut<MenuItemController>(() => MenuItemController());
  }
}
