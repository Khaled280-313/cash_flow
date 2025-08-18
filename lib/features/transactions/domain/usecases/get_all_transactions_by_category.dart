import 'package:cash_flow/core/errors/failure.dart';
import 'package:cash_flow/features/transactions/domain/entities/transaction_entities.dart';
import 'package:cash_flow/features/transactions/domain/repo/transaction_repo.dart';
import 'package:dartz/dartz.dart';

class GetAllTransactionsByCategory {
  final TransactionRepo transactionRepo;

  GetAllTransactionsByCategory(this.transactionRepo);

  Future<Either<Failure, List<TransactionEntities>>> call(
      String category) async {
    return await transactionRepo.getAllTransactionsByCategory(category);
  }
}
