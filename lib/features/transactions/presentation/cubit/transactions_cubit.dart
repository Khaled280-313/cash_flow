import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(TransactionsInitial());
  GlobalKey<FormState> addTransactionFormKey = GlobalKey();
  // TextEditingController categoryController = TextEditingController();
  late String selectedCategory;
  TextEditingController amountController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  void changeTransactionType(int index) {
    if (index == 0) {
      type = 'income';
    } else {
      type = 'expenses';
    }
  }

  String type = 'expenses'; // <-- Initialize with a default value
}
