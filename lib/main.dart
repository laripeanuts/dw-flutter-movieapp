import 'package:flutter/material.dart';
import 'package:movieapp/pages/home_page.dart';
import 'package:movieapp/pages/login_page.dart';
import 'package:movieapp/pages/movie_details.dart';
import 'package:movieapp/pages/splash_page.dart';

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
          brightness: Brightness.dark,
          primaryColor: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashPage(),
          '/login': (_) => LoginPage(),
          '/home': (_) => const HomePage(),
        });
  }
}
