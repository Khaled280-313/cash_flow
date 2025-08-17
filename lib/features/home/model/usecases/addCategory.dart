import 'package:cash_flow/core/errors/failure.dart';
import 'package:cash_flow/features/home/model/repo/category/category_repo.dart'
    show CategoryRepo;
import 'package:dartz/dartz.dart';

import '../entities/catecory/category_add_message.dart';
import '../entities/catecory/category_entities.dart';

class AddCategory {
  final CategoryRepo categoryRepo;

  AddCategory({required this.categoryRepo});

  Future<Either<Failure, CategoryAddMessage>> call(CategoryEntities category) {
    return categoryRepo.addCategory(category);
  }
}
