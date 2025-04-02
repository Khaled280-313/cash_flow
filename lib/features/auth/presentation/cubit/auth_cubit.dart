import 'package:cash_flow/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {


  
  AuthCubit() : super(AuthInitial());
}
