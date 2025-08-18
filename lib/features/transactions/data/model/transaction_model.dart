import 'package:cash_flow/core/database/api/endpoint.dart';

import '../../domain/entities/transaction_entities.dart';

class TransactionModel extends TransactionEntities {
  TransactionModel(
      {required super.amount,
      required super.date,
      required super.description,
      required super.currency,
      required super.category});
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      amount: (json[ApiKey.amount] as num).toDouble(),
      date: json[ApiKey.date] as String,
      description: json[ApiKey.description] as String,
      currency: json[ApiKey.currency] as String,
      category: json[ApiKey.category] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.amount: amount,
      ApiKey.date: date,
      ApiKey.description: description,
      ApiKey.currency: currency,
      ApiKey.category: category,
    };
  }

  TransactionEntities toEntity() {
    return TransactionEntities(
      amount: amount,
      date: date,
      description: description,
      currency: currency,
      category: category,
    );
  }

  factory TransactionModel.fromEntity(TransactionEntities entity) =>
      TransactionModel(
        amount: entity.amount,
        date: entity.date,
        description: entity.description,
        currency: entity.currency,
        category: entity.category,
      );
}
