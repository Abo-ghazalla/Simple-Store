import 'package:dartz/dartz.dart';
import 'package:quantum_proj/utils/constants/resources.dart' as constants;
import 'package:dio/dio.dart';
import 'package:quantum_proj/data/service/hive_services.dart' as hive_helper;
import 'package:quantum_proj/utils/helpers/connectivity_helper.dart';

class APIService {
  late Dio _dio;
  APIService(String url) {
    _dio = Dio(BaseOptions(
      baseUrl: url,
      headers: {"Content-Type": 'application/json'},
      validateStatus: (val) => val! < 500,
    ));
    setHeaderToken();
  }

  Future<Either<Response, String>> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    if (!(await hasNetworkConnection())) {
      return const Right(constants.netError);
    }

    return Left(await _dio.get(path, queryParameters: query));
  }

  Future<Either<Response, String>> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) async {
    if (!(await hasNetworkConnection())) {
      return const Right(constants.netError);
    }
   
    final res = await _dio.post(
      path,
      queryParameters: query,
      data: body,
    );
    return Left(res);
  }

  Future<Either<Response, String>> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) async {
    if (!(await hasNetworkConnection())) {
      return const Right(constants.netError);
    }
    return Left(await _dio.put(path, queryParameters: query, data: body));
  }

  void setHeaderToken() {
    final token = hive_helper.readToken;
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
  }

  void resetHeaderToken() => _dio.options.headers["Authorization"] = null;
}
