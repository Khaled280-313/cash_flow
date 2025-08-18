class TransactionEntities {
  final num amount;
  final String date;
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
