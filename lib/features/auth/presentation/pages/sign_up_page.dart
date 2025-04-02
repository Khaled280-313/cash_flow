import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/utils/app_text_style.dart';
import 'package:cash_flow/core/utils/colors_app.dart';
import 'package:cash_flow/core/utils/string_app.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_Welcom_text.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_row.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_text_feild.dart';
import 'package:cash_flow/features/onboarding/presentation/widgets/custom_botton.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 100)),
              SliverToBoxAdapter(
                child: CustomWelcomText(
                    text1: StringsApp.lets, text2: StringsApp.start),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 50)),
              SliverToBoxAdapter(
                child: CustomTextFeild(
                  text: StringsApp.userName,
                  hintText: StringsApp.userName,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomTextFeild(
                  text: StringsApp.email,
                  hintText: StringsApp.email,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomTextFeild(
                  text: StringsApp.password,
                  hintText: StringsApp.password,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomRow(
                  text: StringsApp.signUp,
                  onPressed: () {
                    customNavigatPushReplacement(
                        context: context, path: "/SignIn");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
