import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_state.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_row.dart';
import 'package:cash_flow/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CustomFormSignUp extends StatefulWidget {
  const CustomFormSignUp({super.key});

  @override
  State<CustomFormSignUp> createState() => _CustomFormSignUpState();
}

class _CustomFormSignUpState extends State<CustomFormSignUp> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSaccessState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(AppStrings.signUpSaccess)));
          customNavigatPushReplacement(context: context, path: "/SignIn");
        } else if (state is SignUpFailureState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signUpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
                child: Text(AppStrings.name),
              ),
              CustomTextFormFeild(
                hintText: AppStrings.name,
                textInputType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.nameError;
                  } else if (value.length < 2) {
                    return AppStrings.nameErrorLength;
                  }
                  return null;
                },
                onChanged: (name) {
                  authCubit.signUpName = name;
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
                child: Text(AppStrings.lastName),
              ),
              CustomTextFormFeild(
                hintText: AppStrings.lastName,
                textInputType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.lastNameError;
                  } else if (value.length < 2) {
                    return AppStrings.lastNameErrorLength;
                  }
                  return null;
                },
                onChanged: (lastName) {
                  authCubit.signUpLastName = lastName;
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
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
                // controller: authCubit.signUpName,
                onChanged: (userName) {
                  authCubit.signUpUserName = userName;
                },
                hintText: AppStrings.userName,
                textInputType: TextInputType.name,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
                child: Text(AppStrings.email),
              ),
              CustomTextFormFeild(
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.emailError;
                  } else if (!value.contains("@gmail.com")) {
                    return AppStrings.emailErrorFormat;
                  } else if (value.length < 3) {
                    return AppStrings.emailErrorLength;
                  }
                  return null;
                },
                // controller: authCubit.signUpEmail,
                onChanged: (email) {
                  authCubit.signUpEmail = email;
                },
                hintText: AppStrings.email,
                textInputType: TextInputType.emailAddress,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
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
                // controller: authCubit.signUpPassword,
                onChanged: (password) {
                  authCubit.signUpPassword = password;
                },
                hintText: AppStrings.password,
                textInputType: TextInputType.emailAddress,
                obscureText: true,
                suffixIcon: true,
              ),
              state is SignUpLoadingState
                  ? CircularProgressIndicator()
                  : CustomRow(
                      text: AppStrings.signUp,
                      onPressed: () {
                        if (authCubit.signUpFormKey.currentState!.validate()) {
                          authCubit.signUpWithNameEmailAndPassword();
                          // customNavigatPushReplacement(
                          //     context: context, path: "/SignIn");
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
