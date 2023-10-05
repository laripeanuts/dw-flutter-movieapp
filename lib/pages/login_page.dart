import 'package:flutter/material.dart';
import 'package:movieapp/components/login/button.dart';
import 'package:movieapp/controllers/login_controller.dart';
import 'package:movieapp/layout/background_layout.dart';
import 'package:movieapp/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundLayout(
        child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.movie_creation_rounded,
                    size: 108, color: Colors.blue),
                CustomTextField(
                    label: 'E-mail',
                    hint: 'Enter your e-mail',
                    icon: Icons.email,
                    onChanged: _controller.setEmail),
                const SizedBox(height: 24),
                CustomTextField(
                    label: 'Password',
                    hint: 'Enter your password',
                    icon: Icons.lock,
                    onChanged: _controller.setPassword,
                    obscureText: true),
                const SizedBox(height: 24),
                LoginButton(loginController: _controller),
              ],
            )));
  }
}
