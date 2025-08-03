import 'package:get/get.dart';

import 'package:app_delivery_express/domains/models/menu_item_model.dart';

class OrderItem {
  final MenuItem menuItem;
  RxInt quantity;

  OrderItem({required this.menuItem, int quantity = 1})
    : quantity = quantity.obs;
}
