import 'package:flutter_bloc/flutter_bloc.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(ExpensesInitial());
}
