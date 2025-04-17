import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_Welcom_text.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_form_sign_up.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_row_text.dart';
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
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 100)),
              SliverToBoxAdapter(
                child: CustomWelcomText(
                    text1: AppStrings.lets, text2: AppStrings.start),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 50)),
              SliverToBoxAdapter(
                child: CustomFormSignUp(),
              ),
              SliverToBoxAdapter(
                child: CustomRowText(
                  onTap: () {
                    customNavigatPushReplacement(
                        context: context, path: '/SignIn');
                  },
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
