import 'package:movieapp/models/movie_model.dart';

abstract class HomeRepository {
  Future<List<MovieModel>> getMovies();

  Future<void> deleteMovie(MovieModel movie);
}
