import 'package:calculator_converter/Cores/network/api_constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
   late Dio dio;

  void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

   Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio.options.method = "GET";
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
