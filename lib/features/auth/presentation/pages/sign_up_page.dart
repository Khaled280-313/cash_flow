import 'package:cash_flow/core/utils/app_text_style.dart';
import 'package:cash_flow/core/utils/colors_app.dart';
import 'package:cash_flow/core/utils/string_app.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_Welcom_text.dart';
import 'package:cash_flow/features/auth/presentation/widgets/custom_text_feild.dart';
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
                child: CustomRowSignUp(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRowSignUp extends StatelessWidget {
  const CustomRowSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 40, right: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringsApp.signUp,
            style: AppTextStyle.kaushan400Style64.copyWith(fontSize: 30),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ColorsApp.primary),
              child: Icon(
                Icons.arrow_forward,
                color: ColorsApp.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
