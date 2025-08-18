import 'package:cash_flow/features/transactions/domain/repo/transaction_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/transaction_entities.dart';

class GetAllTransactionsByCurrency {
  final TransactionRepo transactionRepo;

  GetAllTransactionsByCurrency({required this.transactionRepo});

  Future<Either<Failure, List<TransactionEntities>>> call(
      String currency) async {
    return await transactionRepo.getAllTransactionsByCurrency(currency);
  }
}
