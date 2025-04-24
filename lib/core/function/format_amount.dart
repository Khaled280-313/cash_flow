String formatAmount(double amount) {
  if (amount >= 1000000) {
    double result = amount / 1000000;
    return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}M';
  } else if (amount >= 1000) {
    double result = amount / 1000;
    return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}K';
  } else {
    return "${amount.toStringAsFixed(0)}\$";
  }
}
