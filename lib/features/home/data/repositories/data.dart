class DailyExpense {
  final DateTime date;
  final double amount;

  DailyExpense(this.date, this.amount);
}

List<DailyExpense> dailyExpenses = [
  DailyExpense(DateTime(2023, 10, 1), 10),
  DailyExpense(DateTime(2023, 10, 2), 150),
  DailyExpense(DateTime(2023, 10, 3), 80),
  DailyExpense(DateTime(2023, 10, 4), 30),
  DailyExpense(DateTime(2023, 10, 5), 200),
  DailyExpense(DateTime(2023, 10, 6), 90),
  DailyExpense(DateTime(2023, 10, 7), 130),
  DailyExpense(DateTime(2023, 10, 8), 300),
  DailyExpense(DateTime(2023, 10, 9), 180),
  DailyExpense(DateTime(2023, 10, 10), 200),
];
