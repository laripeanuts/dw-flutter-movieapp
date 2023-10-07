import 'package:movieapp/models/movies_model.dart';

abstract class MoviesRepository {
  Future<Movies> getMovies({
    required int listID,
    required int page,
  });
}
