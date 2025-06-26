import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/transaction_entities.dart';
import '../repo/transaction_repo.dart';

class GetTransaction {
  final TransactionRepo transactionRepo;

  GetTransaction(this.transactionRepo);

  Future<Either<Failure, TransactionEntities>> call(String id) async {
    return await transactionRepo.getTransaction(id);
  }
}
