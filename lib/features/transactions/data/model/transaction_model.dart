// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../domain/entities/transaction_entities.dart';

class TransactionModel extends TransactionEntities {
  final String id;

  final String currency;
  TransactionModel({
    required this.id,
    required this.currency,
    required super.description,
    required super.amount,
    required super.date,
    // required super.time,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as String,
      currency: json['currency'] as String,
      description: json['description'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      // time: DateTime.parse(json['time'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'currency': currency,
      'description': description,
      'amount': amount,
      'date': date.toIso8601String(),
      // 'time': time.toString(),
    };
  }
}
