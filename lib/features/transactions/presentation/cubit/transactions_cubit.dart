import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(TransactionsInitial());
  GlobalKey<FormState> addTransactionFormKey = GlobalKey();
  // TextEditingController categoryController = TextEditingController();
  late num amount;
  DateTime selectedDate = DateTime.now();
  String get formattedBirthDate =>
      DateFormat('yyyy-MM-dd').format(selectedDate);
  late String description;
  late String currency;
  late String selectedCategory;
  String type = 'EXPENSE';

  void changeTransactionType(int index) {
    if (index == 0) {
      type = 'INCOME';
    } else {
      type = 'EXPENSE';
    }
  }
}
