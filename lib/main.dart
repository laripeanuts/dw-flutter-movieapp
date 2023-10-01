import 'package:flutter/material.dart';
import 'package:movieapp/page/login_page.dart';
import 'package:movieapp/page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.indigo,
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashPage(),
          '/login': (_) => const LoginPage(),
        });
  }
}
