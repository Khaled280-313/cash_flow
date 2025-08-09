import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_state.dart';
import 'package:cash_flow/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../generated/l10n.dart';
import '../../../onboarding/presentation/widgets/custom_botton.dart';
import '../../../transactions/presentation/widgets/custom_show_date_picker.dart';

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
              .showSnackBar(SnackBar(content: Text(S.of(context).signUpSaccess)));
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
                child: Text(S.of(context).name),
              ),
              CustomTextFormFeild(
                hintText: S.of(context).name,
                textInputType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).nameError;
                  } else if (value.length < 2) {
                    return S.of(context).nameErrorLength;
                  }
                  return null;
                },
                onChanged: (name) {
                  authCubit.signUpName = name;
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 5),
                child: Text(S.of(context).lastName),
              ),
              CustomTextFormFeild(
                hintText: S.of(context).lastName,
                textInputType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).lastNameError;
                  } else if (value.length < 2) {
                    return S.of(context).lastNameErrorLength;
                  }
                  return null;
                },
                onChanged: (lastName) {
                  authCubit.signUpLastName = lastName;
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
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
                // controller: authCubit.signUpName,
                onChanged: (userName) {
                  authCubit.signUpUserName = userName;
                },
                hintText: S.of(context).userName,
                textInputType: TextInputType.name,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
                child: Text(S.of(context).email),
              ),
              CustomTextFormFeild(
                validator: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).emailError;
                  } else if (!value.contains("@gmail.com")) {
                    return S.of(context).emailErrorFormat;
                  } else if (value.length < 3) {
                    return S.of(context).emailErrorLength;
                  }
                  return null;
                },
                // controller: authCubit.signUpEmail,
                onChanged: (email) {
                  authCubit.signUpEmail = email;
                },
                hintText: S.of(context).email,
                textInputType: TextInputType.emailAddress,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
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
                // controller: authCubit.signUpPassword,
                onChanged: (password) {
                  authCubit.signUpPassword = password;
                },
                hintText: S.of(context).password,
                textInputType: TextInputType.emailAddress,
                obscureText: true,
                suffixIcon: true,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
              ),
              CustomDatePicker(
                initialDate: authCubit.selectedDate ?? DateTime.now(),
                onDateChanged: (date) {
                  authCubit.selectedDate = date;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, top: 40, right: 10, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).signUp,
                      style:
                          AppTextStyle.kaushan400Style64.copyWith(fontSize: 30),
                    ),
                    state is SignUpLoadingState
                        ? CustomBotton(
                            height: 50,
                            onPressed: () {},
                            color: AppColor.primary,
                            child: CircularProgressIndicator(color: AppColor.white),
                          )
                        : CustomBotton(
                            height: 50,
                            onPressed: () {
                              if (authCubit.signUpFormKey.currentState!
                                  .validate()) {
                                authCubit.signUpWithNameEmailAndPassword();
                                // customNavigatPushReplacement(
                                //     context: context, path: "/SignIn");
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
