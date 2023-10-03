import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/repositories/home_repository.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<List<MovieModel>> getMovies() async {
    var result = await rootBundle.loadString('assets/data.json');
    List moviesJson = jsonDecode(result);
    return moviesJson.map((e) => MovieModel.fromJson(e)).toList();
  }

  @override
  Future<void> deleteMovie(MovieModel movie) async {
    await Future.delayed(const Duration(seconds: 2));
    return;
  }
}
