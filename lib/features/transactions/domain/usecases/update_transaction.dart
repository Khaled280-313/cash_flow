import 'package:cash_flow/features/transactions/domain/entities/transaction_entities.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repo/transaction_repo.dart';

class UpdateTransaction {
  final TransactionRepo transactionRepo;

  UpdateTransaction(this.transactionRepo);

  Future<Either<Failure, TransactionEntities>> call(
      TransactionEntities transaction) async {
    return await transactionRepo.updateTransaction(transaction);
  }
}
