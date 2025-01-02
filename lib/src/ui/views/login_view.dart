import 'dart:async';

import 'package:flutter/material.dart';
import '../../view_models/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text;
                final password = passwordController.text;

                await loginViewModel.login(email, password);

                if (loginViewModel.error != null){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(loginViewModel.error!)), //! je null assertion operator, compilerju pove da smo ziher da spremenljivka ni null na tej točki(tu pretvori nullable String? v String)
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login successful! tu zj morma nardit redirect na home')),
                  );
                   Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: const Text('Login'),
            ),
            if (loginViewModel.error != null) ...[
              const SizedBox(height: 16),
              Text(
                'Error: ${loginViewModel.error}',
                style: const TextStyle(color: Colors.red)
              ),
            ],
          ],
        ),
        ),
      );
  }
}