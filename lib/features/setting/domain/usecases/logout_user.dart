import 'package:cash_flow/features/setting/domain/repo/user_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/logout_user_entities.dart';

class LogoutUser {
  final UserRepo userRepo;

  LogoutUser({required this.userRepo});

  Future<Either<Failure, LogoutUserEntities>> call() {
    return userRepo.logoutUser();
  }
}
