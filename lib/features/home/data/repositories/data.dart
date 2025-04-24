class DailyExpense {
  final DateTime date;
  final double amount;

  DailyExpense(this.date, this.amount);
}

List<DailyExpense> dailyExpenses = [
  DailyExpense(DateTime(2024, 1, 1), 100.0),
  DailyExpense(DateTime(2024, 1, 2), 150.0),
  DailyExpense(DateTime(2024, 1, 3), 2000.0),
  DailyExpense(DateTime(2024, 1, 4), 2500.0),
  DailyExpense(DateTime(2024, 2, 5), 3000.0),
  DailyExpense(DateTime(2024, 2, 14), 6000.0),
  DailyExpense(DateTime(2024, 2, 30), 1000.0),
];
