import 'package:cash_flow/core/errors/failure.dart';
import '../entities/transaction_entities.dart';
import 'package:dartz/dartz.dart';

abstract class TransactionRepo {
  Future<Either<Failure, TransactionEntities>> getAllTransactions();
  Future<Either<Failure, TransactionEntities>> addTransaction(
      TransactionEntities transaction);
  Future<Either<Failure, void>> deleteTransaction(String transactionId);
  Future<Either<Failure, TransactionEntities>> updateTransaction(
      TransactionEntities transaction);

  Future<Either<Failure, TransactionEntities>> getTransaction(String id);
}
