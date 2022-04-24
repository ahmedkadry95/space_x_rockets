import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  static const String BASE_URL = '';

  var dio = Dio();

  ApiService() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
      ),
    );
    var options = BaseOptions(
      baseUrl: BASE_URL,
    );

    dio.options = options;
  }

}
