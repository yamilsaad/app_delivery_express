// lib/presentations/screens/home_screen/home_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Delivery Express'),
            actions: [
              // Botón de WhatsApp para enviar el pedido
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.whatsapp),
                onPressed: () {
                  // TODO: Implementar la lógica para enviar el pedido por WhatsApp
                  Get.snackbar(
                    '¡Pronto!',
                    'La funcionalidad de WhatsApp se implementará pronto.',
                    backgroundColor: Colors.white,
                    colorText: Colors.black,
                  );
                },
              ),
            ],
          ),
          body: WebViewWidget(controller: controller.webViewController),
        );
      },
    );
  }
}
