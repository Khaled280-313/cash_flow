import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_Welcom_text.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_row.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_row_text.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 100)),
              SliverToBoxAdapter(
                child: CustomWelcomText(
                    text1: AppStrings.lets, text2: AppStrings.start),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 50)),
              SliverToBoxAdapter(
                child: CustomTextFeild(
                  text: AppStrings.userName,
                  hintText: AppStrings.userName,
                  textInputType: TextInputType.name,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomTextFeild(
                  text: AppStrings.email,
                  hintText: AppStrings.email,
                  textInputType: TextInputType.emailAddress,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomTextFeild(
                  text: AppStrings.password,
                  hintText: AppStrings.password,
                  textInputType: TextInputType.emailAddress,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomRow(
                  text: AppStrings.signUp,
                  onPressed: () {
                    customNavigatPushReplacement(
                        context: context, path: "/SignIn");
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: CustomRowText(
                  text1: AppStrings.alreadyHaveAccount,
                  text2: AppStrings.signIn,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
