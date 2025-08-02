// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cash_flow/core/database/api/endpoint.dart';
import 'package:cash_flow/core/database/cache/cache_helper.dart';
import 'package:cash_flow/core/errors/exception.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cash_flow/core/database/api/api_consumer.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_state.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../model/sign_in_model.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiConsumer api;
  AuthCubit(this.api) : super(AuthInitial());
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  String? signUpName;
  String? signUpLastName;
  String? signUpUserName;
  String? signUpEmail;
  String? signUpPassword;
  GlobalKey<FormState> signInFormKey = GlobalKey();
  // String? signInEmail;
  String? signInUserName;
  String? signInPassword;
  SignInModel? user;

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
          ApiKey.name: signUpName,
          ApiKey.lastName: signUpLastName,
          ApiKey.username: signUpUserName,
          ApiKey.email: signUpEmail,
          ApiKey.password: signUpPassword
        },
      ).timeout(const Duration(seconds: 10));

      if (!isClosed) emit(SignUpSaccessState());
    } on ServerException catch (e) {
      emit(SignUpFailureState(errorMessage: e.errorModel.errorMassage));
    }
  }

  Future signInWithEmailAndPassword() async {
    try {
      if (!isClosed) emit(SignInLoadingState());

      final response = await api.post(
        endpoint: Endpoint.loginEndpoint,
        data: {
          ApiKey.email: signInUserName,
          ApiKey.password: signInPassword,
        },
      ).timeout(const Duration(seconds: 10));

      user = SignInModel.fromMap(response);
      var decodedToken = JwtDecoder.decode(user!.token);

      await getIt<CacheHelper>()
          .saveData(key: ApiKey.token, value: user!.token);
      await getIt<CacheHelper>()
          .saveData(key: ApiKey.username, value: decodedToken[ApiKey.username]);

      if (!isClosed) emit(SignInSuccessState());
    } on RawSocketEvent {
      if (!isClosed) {
        emit(SignInFailureState(errorMessage: "No Internet Connection"));
      }
    } on SocketException {
      if (!isClosed) {
        emit(SignInFailureState(errorMessage: "No Internet Connection"));
      }
    } on ServerException catch (e) {
      if (!isClosed) {
        emit(SignInFailureState(errorMessage: e.errorModel.errorMassage));
      }
    } catch (e) {
      if (!isClosed) {
        emit(SignInFailureState(errorMessage: e.toString()));
      }
    }
  }
}
