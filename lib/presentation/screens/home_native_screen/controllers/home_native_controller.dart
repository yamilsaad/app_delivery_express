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
        nombre: 'Pizza Regional',
        imageUrl:
            'https://irp-cdn.multiscreensite.com/3e655c6a/MOBILE/jpg/1836095-logo-v1.jpg',
        categorias: ['Pizza', 'Italiana'],
        rating: 4.5,
        phoneNumber: '+5492645748636', // Número de prueba
      ),
      Negocio(
        id: '2',
        nombre: 'Hamburguesas del Chef',
        imageUrl:
            'https://pxcdn.0223.com.ar/f/012025/1736014397200.webp?cw=748&ch=420&cma=1&extw=jpg',
        categorias: ['Hamburguesas', 'Americana'],
        rating: 4.8,
        phoneNumber: '+542645748636', // Número de prueba
      ),
      Negocio(
        id: '3',
        nombre: 'Tacos Dorados',
        imageUrl:
            'https://backyardtaco.com/wp-content/uploads/2023/04/BackyardTaco_Are-Tacos-Mexican_Featured.jpg',
        categorias: ['Mexicana', 'Tacos'],
        rating: 4.2,
        phoneNumber: '+542645748636', // Número de prueba
      ),
      Negocio(
        id: '4',
        nombre: 'Sushi & Roll',
        imageUrl:
            'https://sushibarhospitality.com/wp-content/uploads/2024/07/sushibar-featured-chicago.jpg',
        categorias: ['Japonesa', 'Sushi'],
        rating: 4.9,
        phoneNumber: '+542645748636', // Número de prueba
      ),
    ];
  }
}
