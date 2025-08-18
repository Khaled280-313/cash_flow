import 'package:cash_flow/core/errors/failure.dart';
import 'package:cash_flow/features/transactions/domain/entities/transaction_entities.dart';
import 'package:cash_flow/features/transactions/domain/repo/transaction_repo.dart';
import 'package:dartz/dartz.dart';

class GetTransactionsBySingleDateAndCategory {
  final TransactionRepo transactionRepo;

  GetTransactionsBySingleDateAndCategory(this.transactionRepo);

  Future<Either<Failure, List<TransactionEntities>>> call(
      DateTime date, String category) async {
    return await transactionRepo.getTransactionsBySingleDateAndCategory(
        date, category);
  }
}