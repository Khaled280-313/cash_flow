import 'package:cash_flow/features/category/presentation/cubit/budgets_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetsCubit extends Cubit<BudgetsState> {
  BudgetsCubit() : super(BudgetsInitial());
}
