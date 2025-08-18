import 'package:cash_flow/features/transactions/domain/entities/transaction_message.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/transaction_entities.dart';
import '../repo/transaction_repo.dart';

class PostTransaction {
  final TransactionRepo transactionRepo;

  PostTransaction({required this.transactionRepo});

  Future<Either<Failure, TransactionMessage>> call(
      TransactionEntities transaction) async {
    return await transactionRepo.addTransaction(transaction);
  }
}
