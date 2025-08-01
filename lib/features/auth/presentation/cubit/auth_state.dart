class AuthState {}

class AuthInitial extends AuthState {}

class SignUpSaccessState extends AuthState {}

class SignUpLoadingState extends AuthState {}

class SignUpFailureState extends AuthState {
  final String errorMessage;

  SignUpFailureState({required this.errorMessage});
}

class SignInSuccessState extends AuthState {
  SignInSuccessState();
}

class SignInLoadingState extends AuthState {}

class SignInFailureState extends AuthState {
  final String errorMessage;

  SignInFailureState({required this.errorMessage});
}

class TogglePasswordVisibilityState extends AuthState {
  final bool isObscure;

  TogglePasswordVisibilityState(this.isObscure);
}
