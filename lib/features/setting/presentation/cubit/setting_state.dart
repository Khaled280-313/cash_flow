part of 'setting_cubit.dart';

abstract class SettingState {
  const SettingState();
}

class SettingInitial extends SettingState {}

class GetUserSucess extends SettingState {
  final UserEntities user;

  GetUserSucess({required this.user});
}

class GetUserFailuer extends SettingState {
  final String errrMessage;

  GetUserFailuer({required this.errrMessage});
}

class GetUserLoading extends SettingState {}

class LogoutUserFailure extends SettingState {
  final String errorMessage;

  LogoutUserFailure({required this.errorMessage});
}

class LogoutUserSuccess extends SettingState {
  final String message;

  LogoutUserSuccess({required this.message});
}

class LogoutUserLoading extends SettingState {}
