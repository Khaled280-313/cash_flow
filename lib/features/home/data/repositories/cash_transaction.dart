class CashTransaction {
  final DateTime date;
  final double amount;

  CashTransaction(this.date, this.amount);
}

List<CashTransaction>  cashTransaction= [
  CashTransaction(DateTime(2024, 1, 1), 10000000.0),
  CashTransaction(DateTime(2024, 1, 2), 1500000.0),
  CashTransaction(DateTime(2024, 1, 3), 1000000.0),
  CashTransaction(DateTime(2024, 1, 4), 250000.0),
  CashTransaction(DateTime(2024, 2, 5), 30000000.0),
  CashTransaction(DateTime(2024, 2, 14), 600000.0),
  CashTransaction(DateTime(2024, 2, 30), 1000000.0),
];
