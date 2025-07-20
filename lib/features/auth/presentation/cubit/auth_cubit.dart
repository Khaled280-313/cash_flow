import 'package:cash_flow/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  String? signUpName;
  String? signUpEmail;
  String? signUpPassword;
  GlobalKey<FormState> signInFormKey = GlobalKey();
  String? signInEmail;
  String? signInPassword;

  bool isObscure = true;
  void togglePasswordVisibility() {
    isObscure = !isObscure;
    emit(TogglePasswordVisibilityState(isObscure));
  }

  SignUpWithNameEmailAndPassword() {}

  SignInWithEmailAndPassword() {}
}
