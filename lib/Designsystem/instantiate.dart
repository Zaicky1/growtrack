import 'package:flutter/material.dart';

/// Padrão de Instantiate para criar componentes do design system
///
/// Uso:
/// ```dart
/// Instantiate.button(
///   viewModel: myButtonViewModel,
///   child: Text('Clique aqui'),
///   onPressed: () {},
/// )
/// ```
///
/// Este padrão garante que todos os componentes sejam criados
/// com seus respectivos ViewModels de forma consistente.
class Instantiate {
  /// Cria um componente com seu ViewModel de forma segura
  ///
  /// Padrão genérico que pode ser usado por qualquer componente
  static Widget component<T>({
    required T viewModel,
    required Widget Function(T viewModel) builder,
  }) {
    return builder(viewModel);
  }
}
