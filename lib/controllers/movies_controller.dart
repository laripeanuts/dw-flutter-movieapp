import 'package:flutter/foundation.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';
import 'package:movieapp/utils/numbers.utils.dart';

class MoviesController {
  final MoviesRepository _moviesRepository;
  MoviesController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<bool> loading = ValueNotifier<bool>(false);
  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  Movies? _cachedMovies;

  Future<Movies> fetch({
    int? listID,
    int? page,
  }) async {
    loading.value = true;
    movies.value = await _moviesRepository.getMovies(
      listID: listID ?? Numbers.randomNumber(),
      page: page ?? 1,
    );
    _cachedMovies = movies.value;
    loading.value = false;
    return movies.value!;
  }

  searchOnChange(String value) {
    List<Movie> list = _cachedMovies!.listMovies
        .where((movie) =>
            movie.toString().toLowerCase().toLowerCase().contains(value))
        .toList();

    movies.value = movies.value!.copyWith(listMovies: list);
  }
}
