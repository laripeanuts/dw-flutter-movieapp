import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/controllers/movies_controller.dart';
import 'package:movieapp/layout/background_layout.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository_api.dart';
import 'package:movieapp/services/dio_service_api.dart';
import 'package:movieapp/services/prefs_service.dart';
import 'package:movieapp/widgets/movie_card_list_widget.dart';

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
    return BackgroundLayout(
      appBar: AppBar(
        title: const Row(
          children: [
            SizedBox(width: 10),
            Text('Movies random list'),
          ],
        ),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              PrefsService.logout();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
            icon: const Icon(Icons.logout),
          ),
          const SizedBox(width: 24)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<Movies?>(
                valueListenable: _moviesController.movies,
                builder: (_, movies, __) {
                  final hasMovies = movies?.listMovies != null;
                  return hasMovies
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    movies!.name,
                                    overflow: TextOverflow.fade,
                                    maxLines: 2,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    _moviesController.fetch();
                                  },
                                  icon: const Icon(Icons.refresh),
                                  tooltip: "New movies list",
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(),
                                labelText: 'Search',
                              ),
                              onChanged: (value) {
                                _moviesController.searchOnChange(value);
                              },
                            ),
                            const SizedBox(height: 20),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: movies.listMovies.length,
                              itemBuilder: (_, index) {
                                final movie = movies.listMovies[index];
                                return MovieCardListWidget(movie: movie);
                              },
                              separatorBuilder: (_, __) => const Divider(
                                color: Colors.transparent,
                                height: 20,
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: Center(
                            child: Lottie.asset(
                              'assets/lotties/movie.json',
                              width: 100,
                              height: 100,
                            ),
                          ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
