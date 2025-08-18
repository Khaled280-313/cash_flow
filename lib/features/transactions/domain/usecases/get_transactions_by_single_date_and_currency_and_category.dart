import 'package:cash_flow/core/errors/failure.dart';
import 'package:cash_flow/features/transactions/domain/entities/transaction_entities.dart';
import 'package:cash_flow/features/transactions/domain/repo/transaction_repo.dart';
import 'package:dartz/dartz.dart';

class GetTransactionsBySingleDateAndCurrencyAndCategory {
  final TransactionRepo transactionRepo;

  GetTransactionsBySingleDateAndCurrencyAndCategory(this.transactionRepo);

  Future<Either<Failure, List<TransactionEntities>>> call(
      DateTime date, String currency, String category) async {
    return await transactionRepo.getTransactionsBySingleDateAndCurrencyAndCategory(
        date, currency, category);
  }
}