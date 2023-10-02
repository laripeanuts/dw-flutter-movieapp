import 'package:flutter/material.dart';
import 'package:movieapp/controllers/login_controller.dart';

class LoginButton extends StatelessWidget {
  final LoginController loginController;
  const LoginButton({Key? key, required this.loginController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.loading,
      builder: (_, loading, __) => loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.indigo,
              ),
            )
          : ElevatedButton(
              onPressed: () {
                loginController.auth().then((value) {
                  if (value) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Login failed'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 5),
                      ),
                    );
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.all(24),
              ),
              child: const Text('Login'),
            ),
    );
  }
}
