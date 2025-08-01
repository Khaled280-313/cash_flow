import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_state.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_row.dart';
import 'package:cash_flow/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(AppStrings.signUpSaccess)));
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
                child: Text(AppStrings.userName),
              ),

              CustomTextFormFeild(
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.userNameError;
                  } else if (value.length < 3) {
                    return AppStrings.userNameErrorLength;
                  }
                  return null;
                },
                onChanged: (userName) {
                  authCubit.signInUserName = userName;
                },
                // controller: authCubit.signInEmail,
                hintText: AppStrings.userName,
                textInputType: TextInputType.name,
              ),

              // CustomTextFormFeild(
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return AppStrings.emailError;
              //     } else if (!value.contains("@gmail.com")) {
              //       return AppStrings.emailErrorFormat;
              //     } else if (value.length < 3) {
              //       return AppStrings.emailErrorLength;
              //     }
              //     return null;
              //   },
              //   onChanged: (email) {
              //     authCubit.signInEmail = email;
              //   },
              //   // controller: authCubit.signInEmail,
              //   hintText: AppStrings.email,
              //   textInputType: TextInputType.emailAddress,
              // ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
                child: Text(AppStrings.password),
              ),
              CustomTextFormFeild(
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.passwordError;
                  } else if (value.length < 6) {
                    return AppStrings.passwordErrorLength;
                  }
                  return null;
                },
                // controller: authCubit.signInPassword,
                onChanged: (password) {
                  authCubit.signInPassword = password;
                },
                hintText: AppStrings.password,
                textInputType: TextInputType.emailAddress,
                obscureText: true,
                suffixIcon: true,
              ),
              state is SignInLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : CustomRow(
                      text: AppStrings.signIn,
                      onPressed: () {
                        if (authCubit.signInFormKey.currentState!.validate()) {
                          authCubit.signInWithEmailAndPassword();

                          // isAuthVisited();
                        }
                      },
                    )
            ],
          ),
        );
      },
    );
  }
}
