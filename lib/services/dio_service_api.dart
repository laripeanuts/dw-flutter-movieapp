import 'package:dio/dio.dart';
import 'package:movieapp/services/dio_service.dart';

abstract class DioServiceApi implements DioService {
  final String token = '';

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
