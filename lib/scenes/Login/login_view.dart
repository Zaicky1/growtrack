import 'package:flutter/material.dart';
import 'package:growtrack/Designsystem/components/button/button.dart';
import 'package:growtrack/Designsystem/components/button/button_viewmodel.dart';
import 'package:growtrack/Designsystem/components/input/input.dart';
import 'package:growtrack/Designsystem/components/input/input_viewmodel.dart';
import 'package:growtrack/Designsystem/components/label/label.dart';
import 'package:growtrack/Designsystem/components/label/label_viewmodel.dart';
import 'package:growtrack/Designsystem/components/card/card.dart';
import 'package:growtrack/Designsystem/instantiate.dart';
import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  final LoginViewModel viewModel;

  const LoginView({super.key, required this.viewModel});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GrowTrack'), elevation: 0),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    // Logo/Title
                    Text(
                      'Bem-vindo',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Faça login para continuar',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 40),

                    // Email
                    Instantiate.component<LabelViewModel>(
                      viewModel: LabelViewModel(
                        size: LabelSize.medium,
                        variant: LabelVariant.default_,
                        text: 'Email',
                        isRequired: true,
                      ),
                      builder: (vm) =>
                          GTLabel(text: vm.text, isRequired: vm.isRequired),
                    ),
                    const SizedBox(height: 8),
                    Instantiate.component<InputViewModel>(
                      viewModel: InputViewModel(
                        size: InputSize.medium,
                        type: InputType.email,
                        state: InputState.normal,
                        placeholder: 'seu@email.com',
                        isRequired: true,
                      ),
                      builder: (vm) => GTInput(
                        child: TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'seu@email.com',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: widget.viewModel.validateEmail,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password
                    Instantiate.component<LabelViewModel>(
                      viewModel: LabelViewModel(
                        size: LabelSize.medium,
                        variant: LabelVariant.default_,
                        text: 'Senha',
                        isRequired: true,
                      ),
                      builder: (vm) =>
                          GTLabel(text: vm.text, isRequired: vm.isRequired),
                    ),
                    const SizedBox(height: 8),
                    Instantiate.component<InputViewModel>(
                      viewModel: InputViewModel(
                        size: InputSize.medium,
                        type: InputType.password,
                        state: InputState.normal,
                        placeholder: 'Digite sua senha',
                        isRequired: true,
                      ),
                      builder: (vm) => GTInput(
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            hintText: 'Digite sua senha',
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: widget.viewModel.validatePassword,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Error message
                    if (widget.viewModel.errorMessage != null)
                      GTCard(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          widget.viewModel.errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),

                    // Login button
                    SizedBox(
                      width: double.infinity,
                      child: Instantiate.component<ButtonViewModel>(
                        viewModel: ButtonViewModel(
                          size: ButtonSize.medium,
                          variant: ButtonVariant.primary,
                          label: 'Entrar',
                          isLoading: widget.viewModel.isLoading,
                        ),
                        builder: (vm) => GTButton(
                          child: vm.isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(vm.label),
                          onPressed: widget.viewModel.isLoading
                              ? null
                              : () {
                                  if (!_formKey.currentState!.validate())
                                    return;

                                  widget.viewModel.login(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text,
                                  );
                                },
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Demo credentials
                    GTCard(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Credenciais de Demo:',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(height: 8),
                          const Text('Email: demo@email.com'),
                          const Text('Senha: 123456'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
