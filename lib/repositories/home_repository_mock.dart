import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/repositories/home_repository.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<List<MovieModel>> getMovies() async {
    var result = await rootBundle.loadString('assets/data.json');
    List moviesJson = jsonDecode(result);
    print(moviesJson);
    return moviesJson.map((e) => MovieModel.fromJson(e)).toList();
  }
}
