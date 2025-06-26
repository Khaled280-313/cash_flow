import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/transaction_entities.dart';
import '../repo/transaction_repo.dart';

class PostTransaction {
  final TransactionRepo transactionRepo;

  PostTransaction(this.transactionRepo);

  Future<Either<Failure, TransactionEntities>> call(
      TransactionEntities transaction) async {
    return await transactionRepo.addTransaction(transaction);
  }
}
