import 'package:cash_flow/core/api/endpoint.dart';
import 'package:cash_flow/core/cache/cache_helper.dart';
import 'package:dio/dio.dart';


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
