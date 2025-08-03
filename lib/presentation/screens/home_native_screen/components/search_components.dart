import 'package:app_delivery_express/configs/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchComponent extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchComponent({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Buscar restaurantes...',
            hintStyle: TextStyle(color: Colors.grey[500]),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: AppColors.deepBlue,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                color: AppColors.vibrantOrange,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
