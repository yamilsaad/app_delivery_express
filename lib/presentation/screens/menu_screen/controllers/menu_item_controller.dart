import 'package:app_delivery_express/configs/themes/app_themes.dart';
import 'package:app_delivery_express/domains/models/menu_item_model.dart';
import 'package:app_delivery_express/domains/models/negocio_model.dart';
import 'package:app_delivery_express/domains/models/order_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuItemController extends GetxController {
  // Negocio seleccionado, pasado como argumento
  late final Negocio negocio;

  // Lista observable de los ítems del menú
  final RxList<MenuItem> menuItems = <MenuItem>[].obs;

  // Lista observable para los ítems del carrito
  final RxList<OrderItem> cartItems = <OrderItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Recupera los argumentos de la ruta, que es el objeto Negocio
    negocio = Get.arguments as Negocio;
    // Cargar datos de prueba del menú (simula una llamada a API)
    menuItems.assignAll(_getMockMenuItems());
  }

  // Método para agregar un ítem al carrito o aumentar su cantidad
  void addItemToCart(MenuItem item) {
    // Busca si el ítem ya está en el carrito
    final existingItem = cartItems.firstWhereOrNull(
      (orderItem) => orderItem.menuItem.id == item.id,
    );

    if (existingItem != null) {
      // Si ya existe, aumenta la cantidad
      existingItem.quantity.value++;
    } else {
      // Si no existe, agrega un nuevo OrderItem al carrito
      cartItems.add(OrderItem(menuItem: item));
    }
    Get.snackbar(
      '¡Agregado!',
      '${item.nombre} ha sido agregado al pedido.',
      backgroundColor: Colors.white,
      colorText: AppColors.deepBlue,
    );
  }

  // Método para calcular el total del carrito
  double get total => cartItems.fold(
    0,
    (sum, item) => sum + (item.menuItem.precio * item.quantity.value),
  );

  // Método para generar el mensaje de WhatsApp
  String getWhatsAppMessage() {
    final buffer = StringBuffer();
    buffer.writeln('*Pedido para ${negocio.nombre}*');
    buffer.writeln('-----------------------------------');

    for (final item in cartItems) {
      buffer.writeln(
        '${item.quantity.value} x ${item.menuItem.nombre} - \$${(item.menuItem.precio * item.quantity.value).toStringAsFixed(2)}',
      );
    }

    buffer.writeln('-----------------------------------');
    buffer.writeln('*Total: \$${total.toStringAsFixed(2)}*');
    buffer.writeln('\n¡Gracias por tu pedido!');

    return buffer.toString();
  }

  // Datos de prueba para el menú
  List<MenuItem> _getMockMenuItems() {
    return [
      MenuItem(
        id: '101',
        nombre: 'Hamburguesa Clásica',
        descripcion: 'Carne, queso, lechuga, tomate y salsa especial.',
        precio: 9.99,
        imageUrl: 'https://placehold.co/600x400/F97316/FFFFFF?text=Hamburguesa',
      ),
      MenuItem(
        id: '102',
        nombre: 'Papas Fritas',
        descripcion: 'Papas crujientes con sal.',
        precio: 3.50,
        imageUrl: 'https://placehold.co/600x400/1E40AF/FFFFFF?text=Papas',
      ),
      MenuItem(
        id: '103',
        nombre: 'Refresco',
        descripcion: 'Coca-Cola, Sprite, etc.',
        precio: 2.50,
        imageUrl: 'https://placehold.co/600x400/F97316/FFFFFF?text=Refresco',
      ),
    ];
  }
}
