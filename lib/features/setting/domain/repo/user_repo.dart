import 'package:cash_flow/core/errors/failure.dart';
import 'package:cash_flow/features/setting/domain/entities/user_entities.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepo {
  Future<Either<Failure, UserEntities>> getUser();
}
