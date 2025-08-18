part of 'transactions_cubit.dart';

abstract class TransactionsState {
  const TransactionsState();
}

class TransactionsInitial extends TransactionsState {}

class TransactionsLoading extends TransactionsState {}

class TransactionsLoaded extends TransactionsState {
  final List<TransactionEntities> transactions;

  TransactionsLoaded(this.transactions);
}

class TransactionAdded extends TransactionsState {
  final TransactionMessage transaction;

  TransactionAdded(this.transaction);
}

class TransactionsError extends TransactionsState {
  final String message;

  TransactionsError(this.message);
}
