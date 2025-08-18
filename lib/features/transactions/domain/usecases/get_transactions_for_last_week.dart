import 'package:cash_flow/core/errors/failure.dart';
import 'package:cash_flow/features/transactions/domain/entities/transaction_entities.dart';
import 'package:cash_flow/features/transactions/domain/repo/transaction_repo.dart';
import 'package:dartz/dartz.dart';

class GetTransactionsForLastWeek {
  final TransactionRepo transactionRepo;

  GetTransactionsForLastWeek(this.transactionRepo);

  Future<Either<Failure, List<TransactionEntities>>> call() async {
    return await transactionRepo.getTransactionsForLastWeek();
  }
}