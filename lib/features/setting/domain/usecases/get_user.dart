import 'package:cash_flow/features/setting/domain/repo/user_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user_entities.dart';

class GetUser {
  final UserRepo user;

  GetUser({required this.user});
  Future<Either<Failure, UserEntities>> call() {
    return user.getUser();
  }
} 
