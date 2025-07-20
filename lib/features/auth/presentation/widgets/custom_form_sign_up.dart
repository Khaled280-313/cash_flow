import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_state.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_row.dart';
import 'package:cash_flow/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFormSignUp extends StatelessWidget {
  const CustomFormSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signUpFormKey,
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
                // controller: authCubit.signUpName,
                onChanged: (name) {
                  authCubit.signUpName = name;
                },
                hintText: AppStrings.userName,
                textInputType: TextInputType.name,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
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
                // controller: authCubit.signUpPassword,
                onChanged: (password) {
                  authCubit.signUpPassword = password;
                },
                hintText: AppStrings.password,
                textInputType: TextInputType.emailAddress,
                obscureText: true,
                suffixIcon: true,
              ),
              CustomRow(
                text: AppStrings.signUp,
                onPressed: () {
                  if (authCubit.signUpFormKey.currentState!.validate()) {
                    authCubit.SignUpWithNameEmailAndPassword();
                    customNavigatPushReplacement(
                        context: context, path: "/SignIn");
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
