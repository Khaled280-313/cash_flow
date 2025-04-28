class BankAcountTransaction {
  final DateTime date;
  final double amount;

  BankAcountTransaction(this.date, this.amount);
}

List<BankAcountTransaction> bankAcountTransaction = [
  BankAcountTransaction(DateTime(2024, 1, 1), 20000000.0),
  BankAcountTransaction(DateTime(2024, 1, 2), 2500000.0),
  BankAcountTransaction(DateTime(2024, 1, 3), 3000000.0),
  BankAcountTransaction(DateTime(2024, 1, 4), 20000.0),
  BankAcountTransaction(DateTime(2024, 2, 5), 10000000.0),
  BankAcountTransaction(DateTime(2024, 2, 14), 100000.0),
  BankAcountTransaction(DateTime(2024, 2, 30), 1000000.0),
];
