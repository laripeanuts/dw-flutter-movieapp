import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/layout/background_layout.dart';
import 'package:movieapp/services/prefs_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.wait([
      PrefsService.isAuth(),
      Future.delayed(const Duration(seconds: 3)),
    ])
        .then((value) => value.first ? '/home' : '/login')
        .then((route) => Navigator.of(context).pushReplacementNamed(route));
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundLayout(
      child: Center(
        child: Lottie.asset(
          'assets/lotties/movie.json',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
