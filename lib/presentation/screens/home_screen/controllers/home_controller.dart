import 'dart:ui';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeController extends GetxController {
  // URL inicial de la página web
  final webUrl = 'https://delivery-app-iota-nine.vercel.app/'.obs;

  // Controlador de WebViewController para la WebView
  // Se cambia a 'late' para que pueda ser inicializado de nuevo si es necesario.
  late WebViewController webViewController;

  @override
  void onInit() {
    super.onInit();
    // Se inicializa la WebView al iniciar el controlador
    _initWebView();
  }

  void _initWebView() {
    // Inicializa el controlador de la webview
    webViewController =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Puedes usar esto para mostrar una barra de progreso
                print('WebView is loading (progress: $progress%)');
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                // Lógica para decidir si se permite la navegación
                if (request.url.startsWith('https://www.youtube.com/')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(webUrl.value));
  }
}
