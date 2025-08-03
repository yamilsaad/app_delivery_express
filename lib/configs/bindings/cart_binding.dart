import 'package:get/get.dart';

import 'package:app_delivery_express/presentation/screens/cart/controllers/cart_controller.dart';
import 'package:app_delivery_express/presentation/screens/menu_screen/controllers/menu_item_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    // Si el MenuItemController no está en memoria, lo inicializamos aquí
    Get.lazyPut<MenuItemController>(() => MenuItemController());
    Get.lazyPut<CartController>(() => CartController());
  }
}
