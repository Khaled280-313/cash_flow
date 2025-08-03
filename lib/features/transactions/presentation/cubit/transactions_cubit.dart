import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(TransactionsInitial());
  GlobalKey<FormState> addTransactionFormKey = GlobalKey();
  TextEditingController categoryController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  String type = 'expenses'; // <-- Initialize with a default value
}
