import 'package:app_delivery_express/domains/models/order_item_model.dart';
import 'package:app_delivery_express/presentation/screens/menu_screen/controllers/menu_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CartController extends GetxController {
  // Obtenemos la instancia del controlador del menú, que contiene el carrito
  final MenuItemController menuController = Get.find<MenuItemController>();

  // Lista de ítems del carrito
  RxList<OrderItem> get cartItems => menuController.cartItems;

  // Total del pedido
  double get total => menuController.total;

  // Método para aumentar la cantidad de un ítem
  void incrementQuantity(OrderItem item) {
    item.quantity.value++;
  }

  // Método para disminuir la cantidad de un ítem
  void decrementQuantity(OrderItem item) {
    if (item.quantity.value > 1) {
      item.quantity.value--;
    } else {
      // Si la cantidad es 1, lo eliminamos del carrito
      removeItem(item);
    }
  }

  // Método para eliminar un ítem del carrito
  void removeItem(OrderItem item) {
    cartItems.remove(item);
  }

  // Método para enviar el pedido por WhatsApp
  void sendOrderViaWhatsApp() async {
    final phoneNumber = menuController.negocio.phoneNumber;
    final message = menuController.getWhatsAppMessage();

    final whatsappUrl =
        'whatsapp://send?phone=$phoneNumber&text=${Uri.encodeQueryComponent(message)}';

    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(
        Uri.parse(whatsappUrl),
        mode: LaunchMode.externalApplication,
      );
    } else {
      Get.snackbar(
        'Error',
        'No se pudo abrir WhatsApp. Asegúrate de tener la aplicación instalada.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
