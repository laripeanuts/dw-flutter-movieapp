import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository;
  HomeController(this._homeRepository);

  ValueNotifier<List<MovieModel>> movies = ValueNotifier<List<MovieModel>>([]);

  fetch() async {
    movies.value = await _homeRepository.getMovies();
  }

  create() async {
    print("TODO: Save");
  }

  delete(MovieModel movie) async {
    await _homeRepository.deleteMovie(movie);
    movies.value = await _homeRepository.getMovies();
  }
}
