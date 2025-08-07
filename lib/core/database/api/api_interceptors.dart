import 'dart:io';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:dio/dio.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../cache/cache_helper.dart';

class CustomInterceptor extends InterceptorsWrapper {
  final Dio dio;
  static const _cookieKey = 'auth_cookie';

  CustomInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // إضافة User-Agent متقدم
    final deviceInfo = DeviceInfoPlugin();
    String deviceData;
    if (Platform.isAndroid) {
      final android = await deviceInfo.androidInfo;
      deviceData = 'Android ${android.version.release}; ${android.model}';
    } else {
      final ios = await deviceInfo.iosInfo;
      deviceData = 'iOS ${ios.systemVersion}; ${ios.utsname.machine}';
    }
    options.headers['User-Agent'] = 'CashFlowApp/1.0.0 ($deviceData; Flutter)';

    // إرسال الكوكي الكامل في هيدر Cookie
    final rawCookie = getIt<CacheHelper>().getDataString(key: _cookieKey);
    if (rawCookie != null && rawCookie.isNotEmpty) {
      options.headers['Cookie'] = rawCookie;
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // محاولة تجديد الجلسة
      try {
        final refreshResp = await dio.post('/refresh');
        final newRawCookie = refreshResp.headers['set-cookie']?.first;
        if (newRawCookie != null) {
          // حفظ الكوكي الجديد
          await getIt<CacheHelper>()
              .saveData(key: _cookieKey, value: newRawCookie);

          // إعادة إرسال الطلب الأصلي مع الكوكي المحدث
          final opts = Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          );
          final clone = await dio.request(
            err.requestOptions.path,
            options: opts,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );
          return handler.resolve(clone);
        }
      } catch (_) {
        // فشل التج
        getIt<CacheHelper>().removeData(key: "isAuthVisited");
      }
      // فشل التجديد → مسح الكوكي وإظهار خطأ
      await getIt<CacheHelper>().removeData(key: _cookieKey);
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: 'انتهت صلاحية الجلسة، يرجى إعادة تسجيل الدخول.',
          type: DioExceptionType.badResponse,
        ),
      );
    }
    handler.next(err);
  }


}
