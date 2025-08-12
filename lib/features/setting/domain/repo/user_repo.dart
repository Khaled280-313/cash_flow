import 'package:cash_flow/core/errors/failure.dart';
import 'package:cash_flow/features/setting/domain/entities/user_entities.dart';
import 'package:dartz/dartz.dart';

import '../entities/logout_user_entities.dart';

abstract class UserRepo {
  Future<Either<Failure, UserEntities>> getUser();
  Future<Either<Failure, LogoutUserEntities>> logoutUser();
}
