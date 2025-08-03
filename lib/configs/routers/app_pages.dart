import 'package:app_delivery_express/configs/bindings/cart_binding.dart';
import 'package:app_delivery_express/configs/bindings/main_binding.dart';
import 'package:app_delivery_express/configs/bindings/menu_binding.dart';
import 'package:app_delivery_express/configs/routers/app_routes.dart';
import 'package:app_delivery_express/presentation/screens/cart/cart_screen.dart';
import 'package:get/get.dart';

import '../../presentation/screens/screens.dart';
import '../bindings/binding.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.homeMain,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    /*GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.homeNative,
      page: () => const HomeNativeScreen(),
      binding: HomeNativeBinding(),
    ),*/
    // Definición de la nueva página del menú
    GetPage(
      name: AppRoutes.menu,
      page: () => const MenuScreen(),
      binding: MenuBinding(),
    ),
    // Definición de la nueva página del carrito
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartScreen(),
      binding: CartBinding(),
    ),
  ];
}
