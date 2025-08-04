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
    try {
      final phoneNumber = menuController.negocio.phoneNumber;
      final message = menuController.getWhatsAppMessage();

      final whatsappUrl =
          'https://wa.me/$phoneNumber?text=${Uri.encodeQueryComponent(message)}';

      /*final whatsappUrl =
        'whatsapp://send?phone=$phoneNumber&text=${Uri.encodeQueryComponent(message)}';*/
      debugPrint('Intentando abrir: $whatsappUrl');
      if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
        await launchUrl(
          Uri.parse(whatsappUrl),
          mode: LaunchMode.externalNonBrowserApplication, // Alternativa
        );
        /*await launchUrl(
        Uri.parse(whatsappUrl),
        mode: LaunchMode.externalApplication,
      );*/
      } else {
        throw 'No se pudo abrir WhatsApp. ¿Está instalado?';
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
