import 'package:dio/dio.dart';
import 'error_model.dart';

//هذا الكلاس يحتوي على الايرور الذي يتم ارجاعه من السيرفر
class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

//هذا الكلاس يحتوي على الايرور الذي يتم ارجاعه من الكاش
class CacheException implements Exception {
  final String errorMessage;

  CacheException({required this.errorMessage});
}

class ConnectionTimeout extends ServerException {
  ConnectionTimeout({required super.errorModel});
}

class SendTimeout extends ServerException {
  SendTimeout({required super.errorModel});
}

class ReceiveTimeout extends ServerException {
  ReceiveTimeout({required super.errorModel});
}

class BadCertificate extends ServerException {
  BadCertificate({required super.errorModel});
}

class Cancel extends ServerException {
  Cancel({required super.errorModel});
}

class ConnectionError extends ServerException {
  ConnectionError({required super.errorModel});
}

class Unknown extends ServerException {
  Unknown({required super.errorModel});
}

class BadResponse extends ServerException {
  BadResponse({required super.errorModel});
}

void handelExceptionDio(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ConnectionTimeout(errorModel: ErrorModel.fromMap(e.response!.data));

    case DioExceptionType.sendTimeout:
      throw SendTimeout(errorModel: ErrorModel.fromMap(e.response!.data));

    case DioExceptionType.receiveTimeout:
      throw ReceiveTimeout(errorModel: ErrorModel.fromMap(e.response!.data));

    case DioExceptionType.badCertificate:
      throw BadCertificate(errorModel: ErrorModel.fromMap(e.response!.data));

    case DioExceptionType.cancel:
      throw Cancel(errorModel: ErrorModel.fromMap(e.response!.data));

    case DioExceptionType.connectionError:
      throw ConnectionError(errorModel: ErrorModel.fromMap(e.response!.data));

    case DioExceptionType.unknown:
      throw Unknown(errorModel: ErrorModel.fromMap(e.response!.data));

    case DioExceptionType.badResponse:
      switch (e.response!.statusCode) {
        case 400: //bad requste
          throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));

        case 401: //un auth
          throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));

        case 403: // farbidden
          throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
        case 404: //not found
          throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
        case 405: //method not allowed
          throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
        case 406: //not acceptable
          throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
        case 407: //proxy auth required
          BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
        case 408: //request timeout
          throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));

        case 409: //cofficent
          throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
        case 410: //gone
          throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
        case 422: // unproucessable entity
          throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
        case 423: //locked
        case 504: //Server exception
          throw BadResponse(errorModel: ErrorModel.fromMap(e.response!.data));
      }
  }
}
