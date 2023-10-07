import 'package:flutter/material.dart';

class BackgroundLayout extends StatelessWidget {
  final Widget child;
  final AppBar? appBar;
  final FloatingActionButton? floatingActionButton;
  final Widget? bottomNavigationBar;

  const BackgroundLayout(
      {super.key,
      required this.child,
      this.appBar,
      this.floatingActionButton,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
