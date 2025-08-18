import 'package:cash_flow/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/transaction_entities.dart';
import '../repo/transaction_repo.dart';

class GetTransactionsBySingleDate {
  final TransactionRepo transactionRepo;

  GetTransactionsBySingleDate({required this.transactionRepo});

  Future<Either<Failure, List<TransactionEntities>>> call(
      DateTime date) async {
    return await transactionRepo.getTransactionsBySingleDate(date);
  }
}