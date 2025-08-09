import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/function/on_boarding_and_auth_visited.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_state.dart';
import 'package:cash_flow/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../generated/l10n.dart';
import '../../../onboarding/presentation/widgets/custom_botton.dart';

class CustomFormSignIn extends StatefulWidget {
  const CustomFormSignIn({super.key});

  @override
  State<CustomFormSignIn> createState() => _CustomFormSignInState();
}

class _CustomFormSignInState extends State<CustomFormSignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          isAuthVisited();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(S.of(context).signUpSaccess)));
          customNavigatPushReplacement(
              context: context, path: "/BottomNavigation");
        } else if (state is SignInFailureState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signInFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
                child: Text(S.of(context).userName),
              ),
              CustomTextFormFeild(
                validator: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).userNameError;
                  } else if (value.length < 3) {
                    return S.of(context).userNameErrorLength;
                  }
                  return null;
                },
                onChanged: (userName) {
                  authCubit.signInUserName = userName;
                },
                // controller: authCubit.signInEmail,
                hintText: S.of(context).userName,
                textInputType: TextInputType.name,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
                child: Text(S.of(context).password),
              ),
              CustomTextFormFeild(
                validator: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).passwordError;
                  } else if (value.length < 6) {
                    return S.of(context).passwordErrorLength;
                  }
                  return null;
                },
                // controller: authCubit.signInPassword,
                onChanged: (password) {
                  authCubit.signInPassword = password;
                },
                hintText: S.of(context).password,
                textInputType: TextInputType.emailAddress,
                obscureText: true,
                suffixIcon: true,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, top: 40, right: 10, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).signIn,
                      style:
                          AppTextStyle.kaushan400Style64.copyWith(fontSize: 30),
                    ),
                    state is SignInLoadingState
                        ? CustomBotton(
                            height: 50,
                            onPressed: () {},
                            color: AppColor.primary,
                            child: CircularProgressIndicator(
                                color: AppColor.white),
                          )
                        : CustomBotton(
                            height: 50,
                            onPressed: () {
                              if (authCubit.signInFormKey.currentState!
                                  .validate()) {
                                authCubit.signInWithUserNameAndPassword();
                              }
                            },
                            color: AppColor.primary,
                            child: Icon(
                              Icons.arrow_forward,
                              color: AppColor.white,
                              size: 30,
                            ))
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
