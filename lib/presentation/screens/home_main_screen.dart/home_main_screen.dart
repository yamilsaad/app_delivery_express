import 'package:app_delivery_express/configs/themes/app_themes.dart';
import 'package:app_delivery_express/presentation/screens/home_native_screen/home_native_screen.dart';
import 'package:app_delivery_express/presentation/screens/home_screen/home_screen.dart';
import 'package:app_delivery_express/presentation/screens/home_main_screen.dart/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Instancia el controlador principal
    final MainController controller = Get.find<MainController>();

    // Lista de las pantallas que se mostrarán en las pestañas
    final List<Widget> screens = [HomeScreen(), HomeNativeScreen()];

    return Scaffold(
      // Usamos Obx para escuchar cambios en el índice seleccionado del controlador
      // Usamos IndexedStack para mantener el estado de los widgets hijos y evitar su reconstrucción
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColors.deepBlue,
          selectedItemColor: AppColors.vibrantOrange,
          // ignore: deprecated_member_use
          unselectedItemColor: Colors.white.withOpacity(0.6),
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTabIndex,
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.globe),
              label: 'Web View',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.mobileScreenButton),
              label: 'Nativo',
            ),
          ],
        ),
      ),
    );
  }
}
