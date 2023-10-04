import 'package:flutter/material.dart';
import 'package:movieapp/controllers/home_controller.dart';
import 'package:movieapp/repositories/home_repository_api.dart';
import 'package:movieapp/services/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryApi());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('My best movies', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(
            onPressed: () {
              _controller.fetch();
            },
            tooltip: 'Refresh',
            icon: const Icon(Icons.refresh, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              PrefsService.logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (route) => false);
            },
            tooltip: 'Logout',
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
          SizedBox.fromSize(size: const Size(24, 20)),
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: _controller.movies,
          builder: (_, list, __) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (_, index) {
                final movie = list[index];
                return ListTile(
                    leading: Text(movie.id.toString()),
                    title: Text(movie.title),
                    subtitle: Text(movie.year.toString()),
                    trailing: IconButton(
                      onPressed: () {
                        _controller.delete(movie);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/detail', arguments: movie);
                    });
              },
              separatorBuilder: (_, __) => const Divider(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.create();
        },
        tooltip: 'Add new movie',
        backgroundColor: Colors.indigoAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
