import 'package:cash_flow/core/database/api/dio_consumer.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:cash_flow/features/transactions/data/datasources/transactions_data_local_source.dart';
import 'package:cash_flow/features/transactions/data/datasources/transactions_data_remote_source.dart';
import 'package:cash_flow/features/transactions/data/repo/transactions_repo_impl.dart';
import 'package:cash_flow/features/transactions/domain/entities/transaction_message.dart';
import 'package:cash_flow/features/transactions/domain/usecases/add_transaction.dart';
import 'package:cash_flow/features/transactions/domain/usecases/get_all_transaction.dart';
import 'package:cash_flow/features/transactions/domain/usecases/get_all_transactions_by_category.dart';
import 'package:cash_flow/features/transactions/domain/usecases/get_all_transactions_by_currency.dart';
import 'package:cash_flow/features/transactions/domain/usecases/get_transactions_by_single_date.dart';
import 'package:cash_flow/features/transactions/domain/usecases/get_transactions_by_single_date_and_category.dart';
import 'package:cash_flow/features/transactions/domain/usecases/get_transactions_by_single_date_and_currency_and_category.dart';
import 'package:cash_flow/features/transactions/domain/usecases/get_transactions_for_last_week.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/transaction_entities.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(TransactionsInitial());
  GlobalKey<FormState> addTransactionFormKey = GlobalKey();

  late num amount;
  DateTime selectedDate = DateTime.now();
  String get formattedBirthDate =>
      DateFormat('yyyy-MM-dd').format(selectedDate);
  late String description;
  late String currency = "USD";
  late String selectedCategory;
  String type = 'EXPENSE';

  void changeTransactionType(int index) {
    if (index == 0) {
      type = 'INCOME';
    } else {
      type = 'EXPENSE';
    }
  }

  addTransactions() async {
    emit(TransactionsLoading());
    final result = await PostTransaction(
      transactionRepo: TransactionsRepoImpl(
          localDataSource: null,
          remoteDataSource:
              TransactionsDataRemoteSource(api: getIt<DioConsumer>())),
    ).call(TransactionEntities(
      amount: amount,
      category: selectedCategory,
      date: formattedBirthDate,
      description: description,
      currency: currency,
    ));
    result.fold(
      (failure) => emit(TransactionsError(failure.message)),
      (message) => emit(TransactionAdded(message)),
    );
  }

  getAllTransaction() async {
    emit(TransactionsLoading());
    final result = await GetAllTransaction(
      transactionRepo: TransactionsRepoImpl(
          localDataSource: getIt<TransactionsDataLocalSource>(),
          remoteDataSource:
              TransactionsDataRemoteSource(api: getIt<DioConsumer>())),
    ).call();
    result.fold(
      (failure) => emit(TransactionsError(failure.message)),
      (transactions) => emit(TransactionsLoaded(transactions)),
    );
  }

  getAllTransactionsByCategory(String category) async {
    emit(TransactionsLoading());
    final result = await GetAllTransactionsByCategory(
      transactionRepo: TransactionsRepoImpl(
          localDataSource: getIt<TransactionsDataLocalSource>(),
          remoteDataSource:
              TransactionsDataRemoteSource(api: getIt<DioConsumer>())),
    ).call(category);
    result.fold(
      (failure) => emit(TransactionsError(failure.message)),
      (transactions) => emit(TransactionsLoaded(transactions)),
    );
  }

  getAllTransactionsByCurrency(String currency) async {
    emit(TransactionsLoading());
    final result = await GetAllTransactionsByCurrency(
      transactionRepo: TransactionsRepoImpl(
          localDataSource: getIt<TransactionsDataLocalSource>(),
          remoteDataSource:
              TransactionsDataRemoteSource(api: getIt<DioConsumer>())),
    ).call(currency);
    result.fold(
      (failure) => emit(TransactionsError(failure.message)),
      (transactions) => emit(TransactionsLoaded(transactions)),
    );
  }

  getTransactionsBySingleDate(DateTime date) async {
    emit(TransactionsLoading());
    final result = await GetTransactionsBySingleDate(
      transactionRepo: TransactionsRepoImpl(
          localDataSource: getIt<TransactionsDataLocalSource>(),
          remoteDataSource:
              TransactionsDataRemoteSource(api: getIt<DioConsumer>())),
    ).call(date);
    result.fold(
      (failure) => emit(TransactionsError(failure.message)),
      (transactions) => emit(TransactionsLoaded(transactions)),
    );
  }

  getTransactionsBySingleDateAndCategory(DateTime date, String category) async {
    emit(TransactionsLoading());
    final result = await GetTransactionsBySingleDateAndCategory(
      transactionRepo: TransactionsRepoImpl(
          localDataSource: getIt<TransactionsDataLocalSource>(),
          remoteDataSource:
              TransactionsDataRemoteSource(api: getIt<DioConsumer>())),
    ).call(date, category);
    result.fold(
      (failure) => emit(TransactionsError(failure.message)),
      (transactions) => emit(TransactionsLoaded(transactions)),
    );
  }

  getTransactionsBySingleDateAndCurrencyAndCategory(
      DateTime date, String currency, String category) async {
    emit(TransactionsLoading());
    final result = await GetTransactionsBySingleDateAndCurrencyAndCategory(
      transactionRepo: TransactionsRepoImpl(
          localDataSource: getIt<TransactionsDataLocalSource>(),
          remoteDataSource:
              TransactionsDataRemoteSource(api: getIt<DioConsumer>())),
    ).call(date, currency, category);
    result.fold(
      (failure) => emit(TransactionsError(failure.message)),
      (transactions) => emit(TransactionsLoaded(transactions)),
    );
  }

  getTransactionsForLastWeek() async {
    emit(TransactionsLoading());
    final result = await GetTransactionsForLastWeek(
      transactionRepo: TransactionsRepoImpl(
          localDataSource: getIt<TransactionsDataLocalSource>(),
          remoteDataSource:
              TransactionsDataRemoteSource(api: getIt<DioConsumer>())),
    ).call();
    result.fold(
      (failure) => emit(TransactionsError(failure.message)),
      (transactions) => emit(TransactionsLoaded(transactions)),
    );
  }
}
