import 'package:cash_flow/core/database/api/api_consumer.dart';
import 'package:cash_flow/core/database/api/endpoint.dart';
import 'package:cash_flow/features/transactions/data/model/transaction_model.dart';
import 'package:cash_flow/features/transactions/domain/entities/transaction_message.dart';

class TransactionsDataRemoteSource {
  final ApiConsumer api;

  TransactionsDataRemoteSource(this.api);

  Future<List<TransactionModel>> getAllTransactions() async {
    final response = await api.get(endpoint: Endpoint.getAllTransactions);
    final dynamic payload = response;
    List<dynamic> jsonList;
    if (payload is List) {
      jsonList = payload;
    } else if (payload is Map && payload['data'] is List) {
      jsonList = payload['data'] as List<dynamic>;
    } else {
      throw FormatException(
          'Unexpected JSON format for categories: ${payload.runtimeType}');
    }
    return jsonList
        .map((e) =>
            TransactionModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<List<TransactionModel>> getAllTransactionsByCategory(
      String category) async {
    final response = await api.get(
        endpoint: Endpoint.getAllTransactionsByCategory(category));
    final dynamic payload = response;

    List<dynamic> jsonList;
    if (payload is List) {
      jsonList = payload;
    } else if (payload is Map && payload['data'] is List) {
      jsonList = payload['data'] as List<dynamic>;
    } else {
      throw FormatException(
          'Unexpected JSON format for categories: ${payload.runtimeType}');
    }
    return jsonList
        .map((e) =>
            TransactionModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<List<TransactionModel>> getAllTransactionsByCurrency(
      String currency) async {
    final response = await api.get(
        endpoint: Endpoint.getAllTransactionsByCurrency(currency));
    final dynamic payload = response;

    List<dynamic> jsonList;
    if (payload is List) {
      jsonList = payload;
    } else if (payload is Map && payload['data'] is List) {
      jsonList = payload['data'] as List<dynamic>;
    } else {
      throw FormatException(
          'Unexpected JSON format for categories: ${payload.runtimeType}');
    }
    return jsonList
        .map((e) =>
            TransactionModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<List<TransactionModel>> getTransactionsBySingleDateAndCategory(
      DateTime date, String category) async {
    final response = await api.get(
        endpoint:
            Endpoint.getTransactionsBySingleDateAndCategory(date, category));
    final dynamic payload = response;

    List<dynamic> jsonList;
    if (payload is List) {
      jsonList = payload;
    } else if (payload is Map && payload['data'] is List) {
      jsonList = payload['data'] as List<dynamic>;
    } else {
      throw FormatException(
          'Unexpected JSON format for categories: ${payload.runtimeType}');
    }
    return jsonList
        .map((e) =>
            TransactionModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<List<TransactionModel>> getTransactionsBySingleDate(
      DateTime date) async {
    final response =
        await api.get(endpoint: Endpoint.getTransactionsBySingleDate(date));
    final dynamic payload = response;

    List<dynamic> jsonList;
    if (payload is List) {
      jsonList = payload;
    } else if (payload is Map && payload['data'] is List) {
      jsonList = payload['data'] as List<dynamic>;
    } else {
      throw FormatException(
          'Unexpected JSON format for categories: ${payload.runtimeType}');
    }
    return jsonList
        .map((e) =>
            TransactionModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<List<TransactionModel>>
      getTransactionsBySingleDateAndCurrencyAndCategory(
          DateTime date, String currency, String category) async {
    final response = await api.get(
        endpoint: Endpoint.getTransactionsBySingleDateAndCurrencyAndCategory(
            date, currency, category));
    final dynamic payload = response;

    List<dynamic> jsonList;
    if (payload is List) {
      jsonList = payload;
    } else if (payload is Map && payload['data'] is List) {
      jsonList = payload['data'] as List<dynamic>;
    } else {
      throw FormatException(
          'Unexpected JSON format for categories: ${payload.runtimeType}');
    }
    return jsonList
        .map((e) =>
            TransactionModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<TransactionMessage> addTransaction(
      TransactionModel transaction) async {
    final response = await api.post(
        endpoint: Endpoint.addTransaction, data: transaction.toJson());
    return TransactionMessage(message: response.data.toString());
  }

  Future<List<TransactionModel>> getTransactionsForLastWeek() async {
    final response =
        await api.get(endpoint: Endpoint.getTransactionsForLastWeek);
    final dynamic payload = response;

    List<dynamic> jsonList;
    if (payload is List) {
      jsonList = payload;
    } else if (payload is Map && payload['data'] is List) {
      jsonList = payload['data'] as List<dynamic>;
    } else {
      throw FormatException(
          'Unexpected JSON format for categories: ${payload.runtimeType}');
    }
    return jsonList
        .map((e) =>
            TransactionModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }
}
