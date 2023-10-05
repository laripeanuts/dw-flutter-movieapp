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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Movies',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    InkWell(
                      onTap: () {
                        PrefsService.logout;
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (route) => false);
                      },
                      child: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox.fromSize(
                  size: const Size.fromHeight(24),
                ),
                ValueListenableBuilder<Movies?>(
                  valueListenable: _moviesController.movies,
                  builder: (_, movies, __) {
                    final hasMovies = movies?.listMovies != null;
                    return hasMovies
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: movies!.listMovies.length,
                            itemBuilder: (_, index) {
                              final movie = movies.listMovies[index];
                              return MovieCardListWidget(movie: movie);
                            },
                            separatorBuilder: (_, __) => const Divider(
                              color: Colors.transparent,
                              height: 20,
                            ),
                          )
                        : hasMovies && movies!.listMovies.isEmpty
                            ? const Center(
                                child: Text('No movies found'),
                              )
                            : Center(
                                child: Lottie.asset(
                                  'assets/lotties/movie.json',
                                  width: 100,
                                  height: 100,
                                ),
                              );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
