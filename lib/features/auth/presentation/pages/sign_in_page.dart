import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_form_sign_in.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_row_text.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_welcom_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 100)),
            SliverToBoxAdapter(
                child: CustomWelcomText(
                    text1: AppStrings.welcome, text2: AppStrings.back)),
            SliverToBoxAdapter(child: SizedBox(height: 50)),
            SliverToBoxAdapter(
              child: CustomFormSignIn(),
            ),
            SliverToBoxAdapter(
              child: CustomRowText(
                onTap: () {
                  customNavigatPushReplacement(
                      context: context, path: '/SignUp');
                },
                text1: AppStrings.dontHaveAccount,
                text2: AppStrings.signUp,
              ),
            )
          ],
        ),
      )),
    );
  }
}
