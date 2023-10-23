import 'package:dio/dio.dart';
import 'package:movieapp/services/dio_service.dart';

class DioServiceApi implements DioService {
  final String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYzRkM2IxMzIyN2M1OWYwNzNlNTgyNGI3OTUyYWQyOCIsInN1YiI6IjU0NmMyMGVhOTI1MTQxMzA1NjAwMDg2ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._tOnHDF5lJdySRPnreula100NvXLB1IymKGqJpG6GGY';

  late Dio _dio;
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/4/', headers: {
        'content-type': 'application/json;charset=utf-8',
        'authorization': 'Bearer $token'
      }),
    );
  }

  // @override
  // Future<Response<T>> get<T>(
  //   String path, {
  //   Map<String, dynamic>? queryParameters,
  // }) {
  //   return _dio.get<T>(
  //     path,
  //     queryParameters: queryParameters,
  //   );
  // }
}
