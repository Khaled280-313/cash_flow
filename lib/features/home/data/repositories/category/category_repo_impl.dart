import 'package:dartz/dartz.dart';

import 'package:cash_flow/core/connection/network_info.dart';
import 'package:cash_flow/core/errors/exception.dart';
import 'package:cash_flow/core/errors/failure.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:cash_flow/features/home/data/datasources/category/category_remot_data_source.dart';
import 'package:cash_flow/features/home/data/datasources/category/categoty_local_data_source.dart';
import 'package:cash_flow/features/home/data/model/category/category_model.dart';
import 'package:cash_flow/features/home/model/entities/catecory/category_entities.dart';

import '../../../model/repo/category/category_repo.dart';

class CategoryRepoImpl extends CategoryRepo {
  late CategoryLocalDataSource? localData;
  late CategoryRemoteDataSource? remoteData;
  CategoryRepoImpl({
    this.localData,
    this.remoteData,
  });

  @override
  Future<Either<Failure, void>> addCategory(CategoryEntities category) async {
    if (category.name.isEmpty) {
      return Future.value(
          Left(Failure(message: "Category name cannot be empty")));
    }
    if (await getIt<NetworkInfo>().isConnected!) {
      try {
        remoteData!.addCategory(CategoryModel.fromEntity(category));
        return Future.value(Right(null));
      } on ServerException catch (e) {
        return Future.value(Left(Failure(message: e.errorModel.errorMassage)));
      }
    } else {
      return Future.value(Left(Failure(message: "No internet connection")));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntities>>> getCategories() async {
    if (await getIt<NetworkInfo>().isConnected!) {
      try {
        final remoteCategories = await remoteData!.getCategories();
        localData!.categoryCache(remoteCategories);
        return Right(remoteCategories.map((e) => e.toEntity()).toList());
      } on ServerException catch (e) {
        return Left(Failure(message: e.errorModel.errorMassage));
      }
    } else {
      try {
        final localCategories = await localData!.getCachedCategories();
        return Right(localCategories.map((e) => e.toEntity()).toList());
      } on CacheException catch (e) {
        return Left(Failure(message: e.errorMessage));
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    }
  }
}
