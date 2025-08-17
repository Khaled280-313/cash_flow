import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../entities/catecory/category_add_message.dart';
import '../../entities/catecory/category_entities.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<CategoryEntities>>> getCategories();
  Future<Either<Failure, CategoryAddMessage>> addCategory(CategoryEntities category);
  // Future<Either<Failure, void>> updateCategory(CategoryEntities category);
  // Future<Either<Failure, void>> deleteCategory(String id);
}
