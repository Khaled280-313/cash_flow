import 'package:flutter/material.dart';

class TransactionEntities {
  final String description;
  final double amount;
  final DateTime date;
  final TimeOfDay time;

  TransactionEntities({
    required this.description,
    required this.amount,
    required this.date,
    required this.time,
  });
}
