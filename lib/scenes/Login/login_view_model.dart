import 'package:flutter/foundation.dart';
import 'login_service.dart';
import '../../resources/shared/app_coordinator.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginService service;
  final AppCoordinator coordinator;

  LoginViewModel({required this.service, required this.coordinator});

  bool isLoading = false;
  String? errorMessage;

  /// Realiza login
  Future<void> login({required String email, required String password}) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final success = await service.login(email: email, password: password);

      if (success) {
        await coordinator.goToMonitoring();
      } else {
        errorMessage = 'Email ou senha inválidos';
      }
    } catch (e) {
      errorMessage = 'Erro ao fazer login: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// Valida email
  String? validateEmail(String? value) => service.validateEmail(value);

  /// Valida senha
  String? validatePassword(String? value) => service.validatePassword(value);
}
