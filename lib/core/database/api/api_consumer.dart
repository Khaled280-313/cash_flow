// هنا نعمل في هذا الكلاس تعريف فقط للدوال الريسيه لعمل ريقوست
abstract class ApiConsumer {
  Future<dynamic> delete({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
  Future<dynamic> patch({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
  Future<dynamic> get({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> post({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
}
