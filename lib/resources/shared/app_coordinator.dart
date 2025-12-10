import 'package:flutter/material.dart';

/// Coordenador de navegação da aplicação
class AppCoordinator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Navega para a tela de monitoramento
  Future<void> goToMonitoring() async {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/monitoring',
      (route) => false,
    );
  }

  /// Navega para a tela de login
  Future<void> goToLogin() async {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/login',
      (route) => false,
    );
  }

  /// Volta para a tela anterior
  void goBack() {
    navigatorKey.currentState?.pop();
  }
}
