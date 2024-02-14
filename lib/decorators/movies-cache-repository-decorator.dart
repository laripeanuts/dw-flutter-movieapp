import 'dart:convert';

import 'package:movieapp/decorators/movies-repository-decorator.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesCacheRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCacheRepositoryDecorator(MoviesRepository moviesRepository)
      : super(moviesRepository);

  @override
  Future<Movies> getMovies({
    required int listID,
    required int page,
  }) async {
    try {
      Movies movies = await super.getMovies(listID: listID, page: page);
      _saveInCache(movies, listID, page);
      return movies;
    } catch (e) {
      return _getFromCache(listID, page);
    }
  }

  _saveInCache(Movies movies, int id, int page) async {
    var preferences = await SharedPreferences.getInstance();
    var moviesJson = movies.toJson();
    preferences.setString('movies_cache_$id$page', jsonEncode(moviesJson));
  }

  Future<Movies> _getFromCache(int id, int page) async {
    var preferences = await SharedPreferences.getInstance();
    var moviesJson = preferences.getString('movies_cache_$id$page');
    Map moviesMap = jsonDecode(moviesJson!);

    return Movies.fromJson(moviesMap);
  }
}
