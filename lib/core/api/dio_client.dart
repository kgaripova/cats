import 'package:cats/core/constants/api_endpoints.dart';
import 'package:dio/dio.dart';

import 'package:cats/core/constants/app_constants.dart';

class DioClient {
  DioClient._();

  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.catApiBaseUrl,
        headers: {
          'Content-Type': 'application/json',
          if (ApiEndpoints.catApiKey.isNotEmpty)
            'x-api-key': ApiEndpoints.catApiKey,
        },
      ),
    );
    return dio;
  }
}