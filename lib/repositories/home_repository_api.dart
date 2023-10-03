import 'package:dio/dio.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/repositories/home_repository.dart';

class HomeRepositoryApi implements HomeRepository {
  @override
  Future<List<MovieModel>> getMovies() async {
    final dio = Dio();

    try {
      print("getMovies");
      final response =
          await dio.get('https://651b0b2e340309952f0e2fff.mockapi.io/movies');
      List moviesJson = response.data;
      return moviesJson.map((e) => MovieModel.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
    return [];
  }

  @override
  Future<void> deleteMovie(MovieModel movie) async {
    final dio = Dio();

    try {
      await dio.delete(
          'https://651b0b2e340309952f0e2fff.mockapi.io/movies/${movie.id}');
    } catch (e) {
      print(e);
    }
  }
}
