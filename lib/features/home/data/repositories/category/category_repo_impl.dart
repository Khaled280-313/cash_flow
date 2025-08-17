import 'package:dartz/dartz.dart';

import 'package:cash_flow/core/connection/network_info.dart';
import 'package:cash_flow/core/errors/exception.dart';
import 'package:cash_flow/core/errors/failure.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:cash_flow/features/home/data/datasources/category/category_remot_data_source.dart';
import 'package:cash_flow/features/home/data/datasources/category/categoty_local_data_source.dart';
import 'package:cash_flow/features/home/data/model/category/category_model.dart';
import 'package:cash_flow/features/home/model/entities/catecory/category_entities.dart';

import '../../../model/entities/catecory/category_add_message.dart';
import '../../../model/repo/category/category_repo.dart';

class CategoryRepoImpl extends CategoryRepo {
  late CategoryLocalDataSource? localData;
  late CategoryRemoteDataSource? remoteData;
  CategoryRepoImpl({
    this.localData,
    this.remoteData,
  });

  @override
  Future<Either<Failure, CategoryAddMessage>> addCategory(
      CategoryEntities category) async {
    if (category.name.isEmpty) {
      return Left(Failure(message: "Category name cannot be empty"));
    }
    if (await getIt<NetworkInfo>().isConnected!) {
      try {
        final message =
            await remoteData!.addCategory(CategoryModel.fromEntity(category));
        return Right(message);
      } on AppException catch (e) {
        return Left(mapAppExceptionToFailure(e));
      }
    } else {
      return Left(Failure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntities>>> getCategories() async {
    if (await getIt<NetworkInfo>().isConnected!) {
      try {
        final remoteCategories = await remoteData!.getCategories();
        localData!.categoryCache(remoteCategories);
        return Right(remoteCategories.map((e) => e.toEntity()).toList());
      } on AppException catch (e) {
        return Left(mapAppExceptionToFailure(e));
      }
    } else {
      try {
        final localCategories = await localData!.getCachedCategories();
        return Right(localCategories.map((e) => e.toEntity()).toList());
      } on AppException catch (e) {
        return Left(mapAppExceptionToFailure(e));
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    }
  }
}
