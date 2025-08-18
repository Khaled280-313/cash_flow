import 'package:cash_flow/core/errors/failure.dart';
import 'package:cash_flow/features/transactions/domain/entities/transaction_message.dart';
import '../entities/transaction_entities.dart';
import 'package:dartz/dartz.dart';

abstract class TransactionRepo {
  Future<Either<Failure, List<TransactionEntities>>> getAllTransactions();
  Future<Either<Failure, TransactionMessage>> addTransaction(
      TransactionEntities transaction);
  // Future<Either<Failure, void>> deleteTransaction(String transactionId);
  // Future<Either<Failure, TransactionEntities>> updateTransaction(
  //     TransactionEntities transaction);

  // Future<Either<Failure, TransactionEntities>> getTransaction(String id);
  Future<Either<Failure, List<TransactionEntities>>>
      getAllTransactionsByCurrency(String currency);
  Future<Either<Failure, List<TransactionEntities>>>
      getAllTransactionsByCategory(String category);
  Future<Either<Failure, List<TransactionEntities>>>
      getTransactionsBySingleDate(DateTime date);
  Future<Either<Failure, List<TransactionEntities>>>
      getTransactionsForLastWeek();
  Future<Either<Failure, List<TransactionEntities>>>
      getTransactionsBySingleDateAndCurrencyAndCategory(
          DateTime date, String currency, String category);

  Future<Either<Failure, List<TransactionEntities>>>
      getTransactionsBySingleDateAndCategory(DateTime date, String category);
}
