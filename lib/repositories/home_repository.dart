import 'package:movieapp/models/movie_model.dart';

abstract class HomeRepository {
  Future<List<MovieModel>> getMovies();
}
