import 'dart:io';
import 'package:intl/intl.dart';
import 'package:cash_flow/core/database/api/endpoint.dart';
import 'package:cash_flow/core/database/cache/cache_helper.dart';
import 'package:cash_flow/core/errors/exception.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cash_flow/core/database/api/api_consumer.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiConsumer api;
  AuthCubit(this.api) : super(AuthInitial());
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  String? signUpName;
  String? signUpLastName;
  String? signUpUserName;
  String? signUpEmail;
  String? signUpPassword;
  DateTime? selectedDate = DateTime.now();
  String get formattedBirthDate =>
      DateFormat('yyyy-MM-dd').format(selectedDate!);
  GlobalKey<FormState> signInFormKey = GlobalKey();
  // String? signInEmail;
  String? signInUserName;
  String? signInPassword;
  // SignInModel? user;

  bool isObscure = true;
  void togglePasswordVisibility() {
    isObscure = !isObscure;
    emit(TogglePasswordVisibilityState(isObscure));
  }

  Future signUpWithNameEmailAndPassword() async {
    try {
      if (!isClosed) emit(SignUpLoadingState());
      final response = await api.post(
        endpoint: Endpoint.registerEndpoint,
        data: {
          ApiKey.username: signUpUserName,
          ApiKey.password: signUpPassword,
          ApiKey.email: signUpEmail,
          ApiKey.firstName: signUpName,
          ApiKey.lastName: signUpLastName,
          ApiKey.profileImage: null,
          ApiKey.bio: "Bio",
          ApiKey.job: "Job",
          ApiKey.birthDate: formattedBirthDate,
        },
      );

      if (!isClosed) emit(SignUpSaccessState());
      return response;
    } on SocketException {
      emit(SignUpFailureState(errorMessage: "No Internet Connection"));
    } on ServerException catch (e) {
      emit(SignUpFailureState(errorMessage: e.errorModel.errorMassage));
    } catch (e) {
      if (!isClosed) {
        emit(SignUpFailureState(errorMessage: e.toString()));
      }
    }
  }

  Future signInWithUserNameAndPassword() async {
    try {
      if (!isClosed) emit(SignInLoadingState());

      final response = await api.post(
        endpoint: Endpoint.loginEndpoint,
        data: {
          ApiKey.username: signInUserName,
          ApiKey.password: signInPassword,
        },
      );

      final cookie = response.headers['set-cookie']?.first;
      if (cookie != null) {
        await getIt<CacheHelper>().saveData(key: 'auth_cookie', value: cookie);
      }

      if (!isClosed) emit(SignInSuccessState());
      return response;
    } on SocketException {
      if (!isClosed) {
        emit(SignInFailureState(errorMessage: "No Internet Connection"));
      }
    } on ServerException catch (e) {
      if (!isClosed) {
        emit(SignInFailureState(errorMessage: e.errorModel.errorMassage));
      }
    } catch (e) {
      if (!isClosed) emit(SignInFailureState(errorMessage: e.toString()));
    }
  }
}
