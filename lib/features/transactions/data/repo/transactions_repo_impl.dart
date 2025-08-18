import 'package:cash_flow/core/connection/network_info.dart';
import 'package:cash_flow/core/errors/exception.dart';
import 'package:cash_flow/core/errors/failure.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:cash_flow/features/transactions/data/datasources/transactions_data_local_source.dart';
import 'package:cash_flow/features/transactions/data/datasources/transactions_data_remote_source.dart';
import 'package:cash_flow/features/transactions/data/model/transaction_model.dart';
import 'package:cash_flow/features/transactions/domain/entities/transaction_entities.dart';
import 'package:cash_flow/features/transactions/domain/entities/transaction_message.dart';
import 'package:cash_flow/features/transactions/domain/repo/transaction_repo.dart';
import 'package:dartz/dartz.dart';

class TransactionsRepoImpl extends TransactionRepo {
  late TransactionsDataLocalSource? localDataSource;
  late TransactionsDataRemoteSource? remoteDataSource;

  TransactionsRepoImpl(
      {required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Either<Failure, TransactionMessage>> addTransaction(
      TransactionEntities transaction) async {
    if (await getIt<NetworkInfo>().isConnected!) {
      try {
        final result = await remoteDataSource!
            .addTransaction(TransactionModel.fromEntity(transaction));
        return Right(result);
      } on AppException catch (e) {
        return Left(mapAppExceptionToFailure(e));
      }
    } else {
      return Left(Failure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntities>>>
      getAllTransactions() async {
    if (await getIt<NetworkInfo>().isConnected!) {
      try {
        final result = await remoteDataSource!.getAllTransactions();
        await localDataSource!.saveTransactions(result);
        return Right(result);
      } on AppException catch (e) {
        return Left(mapAppExceptionToFailure(e));
      }
    } else {
      return Left(Failure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntities>>>
      getAllTransactionsByCategory(String category) async {
    if (await getIt<NetworkInfo>().isConnected!) {
      try {
        final result =
            await remoteDataSource!.getAllTransactionsByCategory(category);

        return Right(result);
      } on AppException catch (e) {
        return Left(mapAppExceptionToFailure(e));
      }
    } else {
      return Left(Failure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntities>>>
      getAllTransactionsByCurrency(String currency) async {
    if (await getIt<NetworkInfo>().isConnected!) {
      try {
        final result =
            await remoteDataSource!.getAllTransactionsByCurrency(currency);
        await localDataSource!.saveTransactions(result);
        return Right(result);
      } on AppException catch (e) {
        return Left(mapAppExceptionToFailure(e));
      }
    } else {
      return Left(Failure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntities>>>
      getTransactionsBySingleDate(DateTime date) async {
    if (await getIt<NetworkInfo>().isConnected!) {
      try {
        final result =
            await remoteDataSource!.getTransactionsBySingleDate(date);
        await localDataSource!.saveTransactions(result);
        return Right(result);
      } on AppException catch (e) {
        return Left(mapAppExceptionToFailure(e));
      }
    } else {
      return Left(Failure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntities>>>
      getTransactionsBySingleDateAndCategory(
          DateTime date, String category) async {
    if (await getIt<NetworkInfo>().isConnected!) {
      try {
        final result = await remoteDataSource!
            .getTransactionsBySingleDateAndCategory(date, category);
        await localDataSource!.saveTransactions(result);
        return Right(result);
      } on AppException catch (e) {
        return Left(mapAppExceptionToFailure(e));
      }
    } else {
      return Left(Failure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntities>>>
      getTransactionsBySingleDateAndCurrencyAndCategory(
          DateTime date, String currency, String category) async {
    if (await getIt<NetworkInfo>().isConnected!) {
      try {
        final result = await remoteDataSource!
            .getTransactionsBySingleDateAndCurrencyAndCategory(
                date, currency, category);
        await localDataSource!.saveTransactions(result);
        return Right(result);
      } on AppException catch (e) {
        return Left(mapAppExceptionToFailure(e));
      }
    } else {
      return Left(Failure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntities>>>
      getTransactionsForLastWeek() async {
    if (await getIt<NetworkInfo>().isConnected!) {
      try {
        final result = await remoteDataSource!.getTransactionsForLastWeek();
        await localDataSource!.saveTransactions(result);
        return Right(result);
      } on AppException catch (e) {
        return Left(mapAppExceptionToFailure(e));
      }
    } else {
      return Left(Failure(message: "No internet connection"));
    }
  }
}
