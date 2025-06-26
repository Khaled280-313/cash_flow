import 'package:cash_flow/features/transactions/domain/repo/transaction_repo.dart';

class DeleteTransaction {
  final TransactionRepo transactionRepo;

  DeleteTransaction(this.transactionRepo);

  Future<void> call(String transactionId) async {
    await transactionRepo.deleteTransaction(transactionId);
  }
  
}