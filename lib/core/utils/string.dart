class StringsApp {
  static final StringsApp _instance = StringsApp._internal();
  factory StringsApp() {
    return _instance;
  }
  StringsApp._internal();

  static const String appName = 'Cash Flow';
  static const String onBoardingTitle1 = 'Track your expenses with ease';
  static const String onBoardingSubTitle1 =
      'Record your daily expenses and find out where your money is going';
  static const String onBoardingTitle2 = 'Set up a customized budget';
  static const String onBoardingSubTitle2 =
      'Create budgets for different categories and track your adherence to them';
  static const String onBoardingTitle3 = 'Advanced financial analysis';
  static const String onBoardingSubTitle3 =
      'Get detailed reports and charts to better understand your spending patterns';
}
