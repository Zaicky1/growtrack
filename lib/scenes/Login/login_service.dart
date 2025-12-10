import 'dart:async';

class LoginService {
  /// Simula autenticação
  Future<bool> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));

    // Simula validação básica
    if (email.isEmpty || password.isEmpty) {
      return false;
    }

    // Aceita qualquer email/senha válidos para demo
    if (email.contains('@') && password.length >= 6) {
      return true;
    }

    return false;
  }

  /// Valida email
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe o email';
    }
    if (!value.contains('@')) {
      return 'Email inválido';
    }
    return null;
  }

  /// Valida senha
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe a senha';
    }
    if (value.length < 6) {
      return 'Senha deve ter pelo menos 6 caracteres';
    }
    return null;
  }
}
