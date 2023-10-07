import 'package:flutter/foundation.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';
import 'package:movieapp/utils/numbers.utils.dart';

class MoviesController {
  final MoviesRepository _moviesRepository;
  MoviesController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);

  Future<Movies> fetch({
    int? listID,
    int? page,
  }) async {
    movies.value = await _moviesRepository.getMovies(
      listID: listID ?? Numbers.randomNumber(),
      page: page ?? 1,
    );

    return movies.value!;
  }
}
