import 'package:app_delivery_express/configs/routers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:app_delivery_express/configs/themes/app_themes.dart';
import 'package:app_delivery_express/presentation/screens/menu_screen/controllers/menu_item_controller.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Aquí se "encuentra" el controlador que el Binding ya puso en memoria.
    final MenuItemController controller = Get.find<MenuItemController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.negocio.nombre,
        ), // Usa el nombre del negocio pasado
        elevation: 0,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.menuItems.length,
          itemBuilder: (context, index) {
            final menuItem = controller.menuItems[index];
            return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    menuItem.imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey[300],
                          child: const Icon(Icons.fastfood, color: Colors.grey),
                        ),
                  ),
                ),
                title: Text(
                  menuItem.nombre,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(menuItem.descripcion),
                trailing: Text(
                  '\$${menuItem.precio.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.vibrantOrange,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  // Llama al método del controlador para agregar el ítem al carrito
                  controller.addItemToCart(menuItem);
                },
              ),
            );
          },
        ),
      ),
      // Botón flotante para ver el carrito
      floatingActionButton: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const SizedBox.shrink();
        }
        return FloatingActionButton.extended(
          onPressed: () {
            // Navega a la pantalla del carrito
            Get.toNamed(AppRoutes.cart);
          },
          label: Text(
            'Ver pedido (\$${controller.total.toStringAsFixed(2)})',
            style: const TextStyle(color: Colors.white),
          ),
          icon: const FaIcon(
            FontAwesomeIcons.cartShopping,
            color: Colors.white,
          ),
          backgroundColor: AppColors.vibrantOrange,
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
