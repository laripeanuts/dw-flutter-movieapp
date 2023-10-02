import 'package:flutter/material.dart';
import 'package:movieapp/controllers/home_controller.dart';
import 'package:movieapp/repositories/home_repository_mock.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryMock());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: _controller.movies,
          builder: (_, list, __) {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, index) {
                final movie = list[index];
                return ListTile(
                  title: Text(movie.title),
                  subtitle: Text(movie.year.toString()),
                );
              },
            );
          }),
    );
  }
}
