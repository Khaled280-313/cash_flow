import 'dart:convert';
import 'package:cash_flow/core/database/cache/cache_helper.dart';
import 'package:cash_flow/core/errors/exception.dart';
import 'package:cash_flow/core/services/servic_locator.dart';

import '../model/transaction_model.dart';

class TransactionsDataLocalSource {
  Future saveTransactions(List<TransactionModel>? transactions) async {
    if (transactions == null) {
      throw CacheException("No transactions to cache");
    } else {
      final jsonString =
          jsonEncode(transactions.map((c) => c.toJson()).toList());
      getIt<CacheHelper>()
          .saveData(key: "cached_transactions", value: jsonString);
    }
  }

  Future<List<TransactionModel>> getCachedTransactions() async {
    final jsonString =
        await getIt<CacheHelper>().getData(key: "cached_transactions");
    if (jsonString == null || (jsonString is String && jsonString.isEmpty)) {
      throw CacheException("No cached transactions found");
    }
    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList.map((json) => TransactionModel.fromJson(json)).toList();
  }
}
