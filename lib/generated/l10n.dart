// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Cash Flow`
  String get appName {
    return Intl.message('Cash Flow', name: 'appName', desc: '', args: []);
  }

  /// `Track your expenses with ease`
  String get onBoardingTitle1 {
    return Intl.message(
      'Track your expenses with ease',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Record your daily expenses and find out where your money is going`
  String get onBoardingSubTitle1 {
    return Intl.message(
      'Record your daily expenses and find out where your money is going',
      name: 'onBoardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Set up a customized budget`
  String get onBoardingTitle2 {
    return Intl.message(
      'Set up a customized budget',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Create budgets for different categories and track your adherence to them`
  String get onBoardingSubTitle2 {
    return Intl.message(
      'Create budgets for different categories and track your adherence to them',
      name: 'onBoardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Advanced financial analysis`
  String get onBoardingTitle3 {
    return Intl.message(
      'Advanced financial analysis',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Get detailed reports and charts to better understand your spending patterns`
  String get onBoardingSubTitle3 {
    return Intl.message(
      'Get detailed reports and charts to better understand your spending patterns',
      name: 'onBoardingSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `You have an account?`
  String get youHaveAccount {
    return Intl.message(
      'You have an account?',
      name: 'youHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don’t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Welcome!`
  String get welcome {
    return Intl.message('Welcome!', name: 'welcome', desc: '', args: []);
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Let’s`
  String get lets {
    return Intl.message('Let’s', name: 'lets', desc: '', args: []);
  }

  /// `Start!`
  String get start {
    return Intl.message('Start!', name: 'start', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Please enter your name`
  String get nameError {
    return Intl.message(
      'Please enter your name',
      name: 'nameError',
      desc: '',
      args: [],
    );
  }

  /// `name must be at least 3 characters`
  String get nameErrorLength {
    return Intl.message(
      'name must be at least 3 characters',
      name: 'nameErrorLength',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Please enter your Last name`
  String get lastNameError {
    return Intl.message(
      'Please enter your Last name',
      name: 'lastNameError',
      desc: '',
      args: [],
    );
  }

  /// `Last name must be at least 3 characters`
  String get lastNameErrorLength {
    return Intl.message(
      'Last name must be at least 3 characters',
      name: 'lastNameErrorLength',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message('User Name', name: 'userName', desc: '', args: []);
  }

  /// `Please enter your user name`
  String get userNameError {
    return Intl.message(
      'Please enter your user name',
      name: 'userNameError',
      desc: '',
      args: [],
    );
  }

  /// `User name must be at least 3 characters`
  String get userNameErrorLength {
    return Intl.message(
      'User name must be at least 3 characters',
      name: 'userNameErrorLength',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get emailError {
    return Intl.message(
      'Please enter your email',
      name: 'emailError',
      desc: '',
      args: [],
    );
  }

  /// `Email format is incorrect`
  String get emailErrorFormat {
    return Intl.message(
      'Email format is incorrect',
      name: 'emailErrorFormat',
      desc: '',
      args: [],
    );
  }

  /// `Email must be at least 3 characters`
  String get emailErrorLength {
    return Intl.message(
      'Email must be at least 3 characters',
      name: 'emailErrorLength',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get passwordError {
    return Intl.message(
      'Please enter your password',
      name: 'passwordError',
      desc: '',
      args: [],
    );
  }

  /// `Password does not match`
  String get passwordErrorMatch {
    return Intl.message(
      'Password does not match',
      name: 'passwordErrorMatch',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 5 characters`
  String get passwordErrorLength {
    return Intl.message(
      'Password must be at least 5 characters',
      name: 'passwordErrorLength',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Analytics`
  String get analytics {
    return Intl.message('Analytics', name: 'analytics', desc: '', args: []);
  }

  /// `Budgets`
  String get budgets {
    return Intl.message('Budgets', name: 'budgets', desc: '', args: []);
  }

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `Total Balance`
  String get totalBalance {
    return Intl.message(
      'Total Balance',
      name: 'totalBalance',
      desc: '',
      args: [],
    );
  }

  /// `Total Balance Filter`
  String get totalBalanceFilter {
    return Intl.message(
      'Total Balance Filter',
      name: 'totalBalanceFilter',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message('Cash', name: 'cash', desc: '', args: []);
  }

  /// `Bank Account`
  String get bankAccount {
    return Intl.message(
      'Bank Account',
      name: 'bankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `All Accounts`
  String get allAccounts {
    return Intl.message(
      'All Accounts',
      name: 'allAccounts',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Income`
  String get income {
    return Intl.message('Income', name: 'income', desc: '', args: []);
  }

  /// `Expenses`
  String get expenses {
    return Intl.message('Expenses', name: 'expenses', desc: '', args: []);
  }

  /// `Add Transaction`
  String get addTransaction {
    return Intl.message(
      'Add Transaction',
      name: 'addTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Add Transaction Title`
  String get addTransactionTitle {
    return Intl.message(
      'Add Transaction Title',
      name: 'addTransactionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Transaction Amount`
  String get addTransactionAmount {
    return Intl.message(
      'Add Transaction Amount',
      name: 'addTransactionAmount',
      desc: '',
      args: [],
    );
  }

  /// `Add Transaction Date`
  String get addTransactionDate {
    return Intl.message(
      'Add Transaction Date',
      name: 'addTransactionDate',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Amount`
  String get amount {
    return Intl.message('Amount', name: 'amount', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Select Date`
  String get selectDate {
    return Intl.message('Select Date', name: 'selectDate', desc: '', args: []);
  }

  /// `Select Time`
  String get selectTime {
    return Intl.message('Select Time', name: 'selectTime', desc: '', args: []);
  }

  /// `This field is required`
  String get requiredField {
    return Intl.message(
      'This field is required',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get noResultsFound {
    return Intl.message(
      'No results found',
      name: 'noResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up Success`
  String get signUpSaccess {
    return Intl.message(
      'Sign Up Success',
      name: 'signUpSaccess',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Profile Settings`
  String get profileSetting {
    return Intl.message(
      'Profile Settings',
      name: 'profileSetting',
      desc: '',
      args: [],
    );
  }

  /// `Edit Account`
  String get editAccount {
    return Intl.message(
      'Edit Account',
      name: 'editAccount',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message('Privacy', name: 'privacy', desc: '', args: []);
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `Feedback`
  String get feedback {
    return Intl.message('Feedback', name: 'feedback', desc: '', args: []);
  }

  /// `Version`
  String get version {
    return Intl.message('Version', name: 'version', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Currency`
  String get currency {
    return Intl.message('Currency', name: 'currency', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message('Light Mode', name: 'lightMode', desc: '', args: []);
  }

  /// `System Default`
  String get systemDefault {
    return Intl.message(
      'System Default',
      name: 'systemDefault',
      desc: '',
      args: [],
    );
  }

  /// `App`
  String get app {
    return Intl.message('App', name: 'app', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
