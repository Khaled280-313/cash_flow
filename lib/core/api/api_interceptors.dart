import 'package:dio/dio.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/endpoint.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/cache/cache_helper.dart';

// هذا الكلاس يقوم بتحديد اللغة, وتنفيذ الطلبات الى السيرفر
class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
        CacheHelper().getData(key: ApiKey.token) != null
            ? "FOODAPI ${CacheHelper().getData(key: ApiKey.token)}"
            : null;

    super.onRequest(options, handler);
  }
}
