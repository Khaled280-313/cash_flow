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
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
      currency: json['currency'] as String,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'date': date.toIso8601String(),
      'description': description,
      'currency': currency,
      'category': category,
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
