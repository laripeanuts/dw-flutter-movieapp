import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';
import 'package:movieapp/services/dio_service.dart';
import 'package:movieapp/utils/api.utils.dart';

class MoviesRepositoryApi implements MoviesRepository {
  final DioService _dioService;

  MoviesRepositoryApi(this._dioService);

  @override
  Future<Movies> getMovies({
    required int listID,
    required int page,
  }) async {
    final url = '${API.REQUEST_MOVIE_LIST}/$listID?page=$page';
    final response = await _dioService.getDio().get(url);

    return Movies.fromJson(response.data);
  }
}
