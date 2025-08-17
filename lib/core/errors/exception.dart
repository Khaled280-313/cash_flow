import 'dart:convert';

import 'package:dio/dio.dart';

//هذا الكلاس يحتوي على الايرور الذي يتم ارجاعه من السيرفر
// class ServerException implements Exception {
//   final ErrorModel errorModel;

//   ServerException({required this.errorModel});
// }

// //هذا الكلاس يحتوي على الايرور الذي يتم ارجاعه من الكاش
// class CacheException implements Exception {
//   final String errorMessage;

//   CacheException({required this.errorMessage});
// }

// class ConnectionTimeout extends ServerException {
//   ConnectionTimeout({required super.errorModel});
// }

// class SendTimeout extends ServerException {
//   SendTimeout({required super.errorModel});
// }

// class ReceiveTimeout extends ServerException {
//   ReceiveTimeout({required super.errorModel});
// }

// class BadCertificate extends ServerException {
//   BadCertificate({required super.errorModel});
// }

// class Cancel extends ServerException {
//   Cancel({required super.errorModel});
// }

// class ConnectionError extends ServerException {
//   ConnectionError({required super.errorModel});
// }

// class Unknown extends ServerException {
//   Unknown({required super.errorModel});
// }

// class BadResponse extends ServerException {
//   BadResponse({required super.errorModel});
// }

// void handelExceptionDio(DioException e) {
//   switch (e.type) {
//     case DioExceptionType.connectionTimeout:
//       throw ConnectionTimeout(errorModel: ErrorModel.fromMap(e.response!.data));

//     case DioExceptionType.sendTimeout:
//       throw SendTimeout(errorModel: ErrorModel.fromMap(e.response!.data));

//     case DioExceptionType.receiveTimeout:
//       throw ReceiveTimeout(errorModel: ErrorModel.fromMap(e.response!.data));

//     case DioExceptionType.badCertificate:
//       throw BadCertificate(errorModel: ErrorModel.fromMap(e.response!.data));

//     case DioExceptionType.cancel:
//       throw Cancel(errorModel: ErrorModel.fromMap(e.response!.data));

//     case DioExceptionType.connectionError:
//       throw ConnectionError(errorModel: ErrorModel.fromMap(e.response!.data));

//     case DioExceptionType.unknown:
//       throw Unknown(errorModel: ErrorModel.fromMap(e.response!.data));

//     case DioExceptionType.badResponse:
//       switch (e.response!.statusCode) {
//         case 400: //bad requste
//           throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));

//         case 401: //un auth
//           throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));

//         case 403: // farbidden
//           throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
//         case 404: //not found
//           throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
//         case 405: //method not allowed
//           throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
//         case 406: //not acceptable
//           throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
//         case 407: //proxy auth required
//           BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
//         case 408: //request timeout
//           throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));

//         case 409: //cofficent
//           throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
//         case 410: //gone
//           throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
//         case 422: // unproucessable entity
//           throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
//         case 423: //locked
//         case 504: //Server exception
//           throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
//       }
//   }
// }


// core/errors/exception.dart

/// نوع الخطأ العام الذي يصف فئة المشكلة.
enum AppErrorKind {
  connection,       // خطأ في الاتصال بالإنترنت
  timeout,          // timeout (connect/receive/send)
  cancel,           // request was cancelled
  badResponse,      // HTTP 4xx / 5xx
  parsing,          // JSON parsing problem in response
  unexpected,       // unexpected / unknown
}

class CacheException implements Exception {
  final String message;
  CacheException([this.message = 'Cache error']);
  @override String toString() => 'CacheException: $message';
}

/// كلاس يمثل خطأ موحّد نستعمله داخل التطبيق.
/// يمكنك توسيعه أو تحويله إلى Failure لاحقًا.
/// 
class AppException implements Exception {
  final AppErrorKind kind;
  final String message;        // رسالة قابلة للعرض أو للـ logs
  final int? httpStatus;       // http status code إن وجد
  final Map<String, dynamic>? body; // body مفكوك إن كان JSON
  final dynamic raw;           // raw response/data إن رغبت

  AppException({
    required this.kind,
    required this.message,
    this.httpStatus,
    this.body,
    this.raw,
  });

  @override
  String toString() =>
      'AppException(kind: $kind, httpStatus: $httpStatus, message: $message)';
}

/// يحاول تحويل response.data إلى Map`<String, dynamic>` بأمان.
/// في حال تعذّر التحويل يرجع null.
Map<String, dynamic>? _safeParseResponseData(dynamic data) {
  try {
    if (data == null) return null;
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) {
      final trimmed = data.trim();
      if (trimmed.isEmpty) return null;
      final decoded = jsonDecode(trimmed);
      if (decoded is Map<String, dynamic>) return decoded;
      return null;
    }
    // إذا جاء كـ List أو bytes أو غيرها: لا نحاول مزيداً
    return null;
  } catch (_) {
    return null;
  }
}

/// الدالة الرئيسية: تحول DioException إلى AppException موحّد وآمن.
/// استعملها داخل catch (on DioException e) { throw handleDioException(e); }
AppException handleDioException(DioException e) {
  final resp = e.response;
  final data = resp?.data;
  final parsedBody = _safeParseResponseData(data);

  // debug helper (يمكن تعطيل الطباعة في الإنتاج)
  // ignore: avoid_print
  print('handleDioException -> type=${e.type}, status=${resp?.statusCode}, dataType=${data?.runtimeType}, data=$data');

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return AppException(
        kind: AppErrorKind.timeout,
        message: 'Request timed out. Please check your connection.',
        httpStatus: resp?.statusCode,
        body: parsedBody,
        raw: data,
      );

    case DioExceptionType.cancel:
      return AppException(
        kind: AppErrorKind.cancel,
        message: 'Request was cancelled.',
        httpStatus: resp?.statusCode,
        body: parsedBody,
        raw: data,
      );

    case DioExceptionType.badResponse:
      // خطأ 4xx أو 5xx — حاول استخراج رسالة من body، وإلا استخدم الرسالة الافتراضية
      final status = resp?.statusCode;
      final bodyMessage = _extractMessageFromBody(parsedBody);
      final msg = bodyMessage ??
          'Received invalid status code $status from server.';
      return AppException(
        kind: AppErrorKind.badResponse,
        message: msg,
        httpStatus: status,
        body: parsedBody,
        raw: data,
      );

    case DioExceptionType.unknown:
      // unknown قد يعني network down، DNS failure، أو response غير قابل للفك
      // إن كان response موجود وحاولنا فكّه لكنه غير صالح => parsing
      if (resp != null && parsedBody == null && data != null) {
        return AppException(
          kind: AppErrorKind.parsing,
          message: 'Invalid/Unexpected response format from server.',
          httpStatus: resp.statusCode,
          body: null,
          raw: data,
        );
      }
      // حالة الشبكة/الاتصال
      return AppException(
        kind: AppErrorKind.connection,
        message: 'Network error. Please check your internet connection.',
        httpStatus: resp?.statusCode,
        body: parsedBody,
        raw: data,
      );

    // للتوافق مع أي إضافة مستقبلية
    default:
      return AppException(
        kind: AppErrorKind.unexpected,
        message: e.message ?? 'Unexpected error occurred.',
        httpStatus: resp?.statusCode,
        body: parsedBody,
        raw: data,
      );
  }
}

/// يحاول استخراج رسالة خطأ مفيدة من body الملّف (اعتمادًا على حقول شائعة)
String? _extractMessageFromBody(Map<String, dynamic>? body) {
  if (body == null) return null;
  // الحقول الشائعة: message, error, errorMessage, errors, details, description, msg
  final candidates = <String>[
    'message',
    'error',
    'errorMessage',
    'errors',
    'details',
    'description',
    'msg',
    'message_ar', // لو API عربي
    'message_en',
  ];
  for (final key in candidates) {
    if (body.containsKey(key) && body[key] != null) {
      final val = body[key];
      if (val is String && val.trim().isNotEmpty) return val;
      if (val is List && val.isNotEmpty) return val.first.toString();
      if (val is Map && val.containsKey('message')) {
        final m = val['message'];
        if (m is String && m.trim().isNotEmpty) return m;
      }
    }
  }
  // أحيانًا API يعيد errorCode + message
  if (body.containsKey('errorCode') && body.containsKey('message')) {
    final m = body['message'];
    if (m is String && m.isNotEmpty) return m;
  }
  return null;
}

/// مساعدة لتحويل AppException إلى كائن Failure مشروعك.
/// هنا مثال عام — عدّله ليتوافق مع كلاس Failure الحقيقي لديك.
dynamic appExceptionToFailure(AppException e) {
  // مثال: لو لديك class Failure { final String message; final int? code; ... }
  // return Failure(message: e.message, code: e.httpStatus);
  // إن لم تكن تريد تحويل فعليًا، أرجع خريطة:
  return {
    'message': e.message,
    'code': e.httpStatus,
    'kind': e.kind.toString(),
  };
}
