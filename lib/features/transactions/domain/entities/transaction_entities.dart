class TransactionEntities {
  final num amount;
   final String category;
  final String date;
  final String description;
  final String currency;
 
  // final TimeOfDay time;

  TransactionEntities({
    required this.amount,
    required this.category,
    required this.date,
    required this.description,
    required this.currency,
    
  });
}
