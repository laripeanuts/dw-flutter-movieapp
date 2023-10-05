import 'package:flutter/foundation.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';

class MoviesController {
  final MoviesRepository _moviesRepository;
  MoviesController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);

  Future<Movies> fetch() async {
    movies.value = await _moviesRepository.getMovies();
    return movies.value!;
  }
}
