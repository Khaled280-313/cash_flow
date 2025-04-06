import 'package:cash_flow/core/database/api/api_consumer.dart';
import 'package:cash_flow/core/database/api/api_interceptors.dart';
import 'package:cash_flow/core/database/api/endpoint.dart';
import 'package:cash_flow/core/errors/exception.dart';
import 'package:dio/dio.dart';

//هذا الكلاس يقوم بتنفيذ الطلبات الى السيرفر
class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    //هنا نقوم بتحديد الرابط الذي سنقوم بالاتصال به
    dio.options.baseUrl = Endpoint.baseUrl;
// هذا الانترسيبتور يمكننا من تعديل الطلبات قبل ارسالها
    dio.interceptors.add(ApiInterceptors());
    //هذا الانترسيبتور يمكننا من نرى الرساله المرسله والرساله المستلمه
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }
  @override
  Future delete(
      {required String endpoint,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      //هنا نقوم بارسال الطلب
      final response = await dio.delete(
        endpoint,
        //هنا نقوم بتحويل البيانات الى فورم داتا
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handelExceptionDio(e);
    }
  }

  @override
  Future get({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      //
      final response = await dio.get(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handelExceptionDio(e);
    }
  }

  @override
  Future patch({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      //
      final response = await dio.patch(
        endpoint,
        //هنا نقوم بتحويل البيانات الى فورم داتا
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      handelExceptionDio(e);
    }
  }

  @override
  Future post({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      //هنا نقوم بارسال الطلب
      final response = await dio.post(
        endpoint,
        //هنا نقوم بتحويل البيانات الى فورم داتا
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      handelExceptionDio(e);
    }
  }
}
