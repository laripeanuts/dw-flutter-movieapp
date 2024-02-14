import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';

class MoviesRepositoryDecorator implements MoviesRepository {
  final MoviesRepository _moviesRepository;
  MoviesRepositoryDecorator(this._moviesRepository);

  @override
  Future<Movies> getMovies({
    required int listID,
    required int page,
  }) async {
    return _moviesRepository.getMovies(listID: listID, page: page);
  }
}
