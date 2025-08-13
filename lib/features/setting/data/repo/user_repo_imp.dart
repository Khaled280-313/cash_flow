import 'package:cash_flow/core/connection/network_info.dart';
import 'package:cash_flow/core/errors/exception.dart';
import 'package:cash_flow/core/errors/failure.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:cash_flow/features/setting/data/datasourecs/user_data_local_source.dart';
import 'package:cash_flow/features/setting/data/datasourecs/usre_data_remote_source.dart';
import 'package:cash_flow/features/setting/domain/entities/user_entities.dart';
import 'package:cash_flow/features/setting/domain/repo/user_repo.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/logout_user_entities.dart';

class UserRepoImp extends UserRepo {
  late UserDataLocalSource? localData;
  late UsreDataRemoteSource? remoteData;

  UserRepoImp({
    required this.localData,
    required this.remoteData,
  });

  @override
  Future<Either<Failure, UserEntities>> getUser() async {
    if (await getIt<NetworkInfo>().isConnected!) {
      try {
        final remotUser = await remoteData!.getUser();
        localData!.cacheUser(remotUser);
        return Right(remotUser);
      } on ServerException catch (e) {
        return Left(Failure(message: e.errorModel.errorMassage));
      }
    } else {
      try {
        final localUser = await localData!.getUserFromCache();
        return right(localUser);
      } on CacheException catch (e) {
        return Left(Failure(message: e.errorMessage));
      }
    }
  }

  @override
  Future<Either<Failure, LogoutUserEntities>> logoutUser() async {
    try {
      if (await getIt<NetworkInfo>().isConnected!) {
        final response = await remoteData!.logoutUser();
        return Right(response);
      } else {
        return Left(Failure(message: "No internet connection"));
      }
    } on ServerException catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
