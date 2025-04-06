import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/function/on_boarding_visited.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_state.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_row.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFormSignIn extends StatelessWidget {
  const CustomFormSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signInFormKey,
          child: Column(
            children: [
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
                controller: authCubit.signInEmail,
                text: AppStrings.email,
                hintText: AppStrings.email,
                textInputType: TextInputType.emailAddress,
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
                controller: authCubit.signInPassword,
                text: AppStrings.password,
                hintText: AppStrings.password,
                textInputType: TextInputType.emailAddress,
                obscureText: true,
                suffixIcon: true,
              ),
              CustomRow(
                text: AppStrings.signIn,
                onPressed: () {
                  if (authCubit.signUpFormKey.currentState!.validate()) {
                    authCubit.SignUpWithNameEmailAndPassword();
                    customNavigatPushReplacement(
                        context: context, path: "/Home");
                    isAuthVisited();
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
