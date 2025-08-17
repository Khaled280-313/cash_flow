import 'package:cash_flow/core/errors/exception.dart';

class Failure {
  final String message;
  final int? code;
  final String? kind;
  Failure({required this.message, this.code, this.kind});
}

Failure mapAppExceptionToFailure(AppException ex) {
  final kindStr = ex.kind.toString().split('.').last;
  return Failure(
    message: ex.message.isNotEmpty ? ex.message : 'Unknown error',
    code: ex.httpStatus,
    kind: kindStr,
  );
}
