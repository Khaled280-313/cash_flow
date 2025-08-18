// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionEntities {
  final double amount;
  final DateTime date;
  final String description;
  final String currency;
  final String category;
  // final TimeOfDay time;

  TransactionEntities({
    required this.amount,
    required this.date,
    required this.description,
    required this.currency,
    required this.category,
  });
}
