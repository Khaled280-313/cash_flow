import 'package:cash_flow/features/home/model/repo/category/category_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../entities/catecory/category_entities.dart';

class GetCategories {
  final CategoryRepo categoryRepo;

  GetCategories({required this.categoryRepo});
  Future<Either<Failure, List<CategoryEntities>>> call() {
    return categoryRepo.getCategories();
  }
}
