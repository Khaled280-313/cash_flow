import 'package:cash_flow/core/errors/failure.dart';
import '../entities/transaction_entities.dart';
import 'package:dartz/dartz.dart';

abstract class TransactionRepo {
  Future<Either<Failure, TransactionEntities>> getAllTransactions();
  addTransaction(TransactionEntities transaction);
  deleteTransaction(String transactionId);
  updateTransaction(TransactionEntities transaction);
}
