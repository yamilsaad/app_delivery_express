import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_delivery_express/configs/themes/app_themes.dart';
import 'package:app_delivery_express/presentation/screens/home_native_screen/components/search_components.dart';
import 'package:app_delivery_express/presentation/screens/home_native_screen/controllers/home_native_controller.dart';
import 'package:app_delivery_express/presentation/screens/home_native_screen/widgets/lista_negocios_widget.dart';

class HomeNativeScreen extends StatelessWidget {
  const HomeNativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Encuentra la instancia del controlador
    final HomeNativeController controller = Get.find<HomeNativeController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Negocios Cercanos'), elevation: 0),
      body: Column(
        children: [
          // Usa el controlador de texto y llama al método de filtrado con el valor del texto
          SearchComponent(
            controller: controller.searchController,
            onChanged: (query) => controller.filterNegocios(query),
          ),
          // Usa el nombre correcto de la lista de negocios filtrados
          ListaNegociosWidget(negocios: controller.filteredNegocios),
        ],
      ),
    );
  }
}
