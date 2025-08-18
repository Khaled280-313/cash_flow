import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(TransactionsInitial());
  GlobalKey<FormState> addTransactionFormKey = GlobalKey();
  // TextEditingController categoryController = TextEditingController();
  late num amount;
  DateTime selectedDate = DateTime.now();
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
