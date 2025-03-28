import 'package:dio/dio.dart';

import 'error_model.dart';

//هذا الكلاس يحتوي على الايرور الذي يتم ارجاعه من السيرفر
class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handelExceptionDio(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errorModel: ErrorModel.fromMap(e.response!.data));

    case DioExceptionType.sendTimeout:
      throw ServerException(errorModel: ErrorModel.fromMap(e.response!.data));

    case DioExceptionType.receiveTimeout:
      throw ServerException(errorModel: ErrorModel.fromMap(e.response!.data));

    case DioExceptionType.badCertificate:
      throw ServerException(errorModel: ErrorModel.fromMap(e.response!.data));

    case DioExceptionType.cancel:
      throw ServerException(errorModel: ErrorModel.fromMap(e.response!.data));

    case DioExceptionType.connectionError:
      throw ServerException(errorModel: ErrorModel.fromMap(e.response!.data));

    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorModel.fromMap(e.response!.data));

    case DioExceptionType.badResponse:
      switch (e.response!.statusCode) {
        case 400: //bad requste
          throw ServerException(
              errorModel: ErrorModel.fromMap(e.response!.data));

        case 401: //un auth
          throw ServerException(
              errorModel: ErrorModel.fromMap(e.response!.data));

        case 403: // farbidden
          throw ServerException(
              errorModel: ErrorModel.fromMap(e.response!.data));
        case 404: //not found
          throw ServerException(
              errorModel: ErrorModel.fromMap(e.response!.data));
        case 405: //method not allowed
          throw ServerException(
              errorModel: ErrorModel.fromMap(e.response!.data));
        case 406: //not acceptable
          throw ServerException(
              errorModel: ErrorModel.fromMap(e.response!.data));
        case 407: //proxy auth required
          ServerException(errorModel: ErrorModel.fromMap(e.response!.data));
        case 408: //request timeout
          throw ServerException(
              errorModel: ErrorModel.fromMap(e.response!.data));

        case 409: //cofficent
          throw ServerException(
              errorModel: ErrorModel.fromMap(e.response!.data));
        case 410: //gone
          throw ServerException(
              errorModel: ErrorModel.fromMap(e.response!.data));
        case 422: // unproucessable entity
          throw ServerException(
              errorModel: ErrorModel.fromMap(e.response!.data));
        case 504: //Server exception
          throw ServerException(
              errorModel: ErrorModel.fromMap(e.response!.data));
      }
  }
}
