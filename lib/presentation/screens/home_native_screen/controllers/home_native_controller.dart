import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domains/models/model.dart';

class HomeNativeController extends GetxController {
  // Controlador para el TextField de búsqueda
  final searchController = TextEditingController();

  // Lista de todos los negocios
  final RxList<Negocio> negocios = <Negocio>[].obs;
  // Lista de negocios filtrados
  final RxList<Negocio> filteredNegocios = <Negocio>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Cargamos los datos de prueba
    negocios.assignAll(_getMockNegocios());
    // Inicialmente, los negocios filtrados son todos los negocios
    filteredNegocios.assignAll(negocios);
  }

  // Método para filtrar los negocios por nombre
  void filterNegocios(String query) {
    if (query.isEmpty) {
      filteredNegocios.assignAll(negocios);
    } else {
      filteredNegocios.assignAll(
        negocios.where((negocio) {
          return negocio.nombre.toLowerCase().contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  // Datos de prueba con números de teléfono agregados
  List<Negocio> _getMockNegocios() {
    return [
      Negocio(
        id: '1',
        nombre: 'Pizza Express',
        imageUrl: 'https://placehold.co/600x400/525252/FFFFFF?text=Pizza',
        categorias: ['Pizza', 'Italiana'],
        rating: 4.5,
        phoneNumber: '+5492645748636', // Número de prueba
      ),
      Negocio(
        id: '2',
        nombre: 'Hamburguesas del Chef',
        imageUrl:
            'https://placehold.co/600x400/1E40AF/FFFFFF?text=Hamburguesas',
        categorias: ['Hamburguesas', 'Americana'],
        rating: 4.8,
        phoneNumber: '+542645748636', // Número de prueba
      ),
      Negocio(
        id: '3',
        nombre: 'Tacos Dorados',
        imageUrl: 'https://placehold.co/600x400/F97316/FFFFFF?text=Tacos',
        categorias: ['Mexicana', 'Tacos'],
        rating: 4.2,
        phoneNumber: '+542645748636', // Número de prueba
      ),
      Negocio(
        id: '4',
        nombre: 'Sushi & Roll',
        imageUrl: 'https://placehold.co/600x400/06B6D4/FFFFFF?text=Sushi',
        categorias: ['Japonesa', 'Sushi'],
        rating: 4.9,
        phoneNumber: '+542645748636', // Número de prueba
      ),
    ];
  }
}
