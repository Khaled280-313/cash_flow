class DailyExpense {
  final DateTime date;
  final double amount;

  DailyExpense(this.date, this.amount);
}

List<DailyExpense> dailyExpenses = [
  DailyExpense(DateTime(2023, 10, 1), 100),
  DailyExpense(DateTime(2023, 10, 2), 150),
  DailyExpense(DateTime(2023, 10, 3), 80),
  DailyExpense(DateTime(2023, 10, 4), 120),
  DailyExpense(DateTime(2023, 10, 5), 200),
  DailyExpense(DateTime(2023, 10, 6), 90),
  DailyExpense(DateTime(2023, 10, 7), 130),
  DailyExpense(DateTime(2023, 10, 8), 110),
  DailyExpense(DateTime(2023, 10, 9), 180),
];
