import 'package:flutter/material.dart';
import 'package:movieapp/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.indigo.shade100,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.people_rounded,
                    size: 108, color: Colors.indigo),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'Enter your e-mail',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: _controller.setEmail,
                ),
                const SizedBox(height: 24),
                TextField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    onChanged: _controller.setPassword),
                const SizedBox(height: 24),
                ValueListenableBuilder<bool>(
                  valueListenable: _controller.loading,
                  builder: (_, loading, __) => loading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.indigo,
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            _controller.auth().then((value) {
                              if (value) {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
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
                ),
              ],
            )));
  }
}
