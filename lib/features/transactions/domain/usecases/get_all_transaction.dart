import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/transaction_entities.dart';
import '../repo/transaction_repo.dart';

class GetAllTransaction {
  final TransactionRepo transactionRepo;

  GetAllTransaction(this.transactionRepo);

  Future<Either<Failure, List<TransactionEntities>>> call() async {
    return await transactionRepo.getAllTransactions();
  }
}
