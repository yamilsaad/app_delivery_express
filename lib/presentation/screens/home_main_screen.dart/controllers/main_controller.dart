import 'package:get/get.dart';

class MainController extends GetxController {
  // Índice de la pestaña seleccionada, observable para actualizar la UI
  final RxInt selectedIndex = 0.obs;

  // Método para cambiar la pestaña seleccionada
  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
