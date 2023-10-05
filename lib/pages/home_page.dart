import 'package:flutter/material.dart';
import 'package:movieapp/controllers/movies_controller.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository_api.dart';
import 'package:movieapp/services/dio_service_api.dart';
import 'package:movieapp/services/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MoviesController _moviesController = MoviesController(
    MoviesRepositoryApi(
      DioServiceApi(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              _moviesController.fetch();
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
      body: ValueListenableBuilder<Movies?>(
          valueListenable: _moviesController.movies,
          builder: (_, movies, __) {
            final hasMovies = movies?.listMovies != null;
            return hasMovies
                ? ListView.separated(
                    shrinkWrap: true,
                    itemCount: movies!.listMovies.length,
                    itemBuilder: (_, index) {
                      final movie = movies.listMovies[index];
                      return ListTile(
                          leading: Text(movie.id.toString()),
                          title: Text(movie.title),
                          subtitle: Text(movie.releaseDate.toString()),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward),
                          ),
                          onTap: () {});
                    },
                    separatorBuilder: (_, __) => const Divider(),
                  )
                : const Center(child: CircularProgressIndicator());
          }),
      // body: ValueListenableBuilder(
      //     valueListenable: _homeController.movies,
      //     builder: (_, list, __) {
      //       return ListView.separated(
      //         shrinkWrap: true,
      //         itemCount: list.length,
      //         itemBuilder: (_, index) {
      //           final movie = list[index];
      //           return ListTile(
      //               leading: Text(movie.id.toString()),
      //               title: Text(movie.title),
      //               subtitle: Text(movie.year.toString()),
      //               trailing: IconButton(
      //                 onPressed: () {},
      //                 icon: const Icon(Icons.delete),
      //               ),
      //               onTap: () {
      //                 Navigator.of(context)
      //                     .pushNamed('/detail', arguments: movie);
      //               });
      //         },
      //         separatorBuilder: (_, __) => const Divider(),
      //       );
      //     }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add new movie',
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
