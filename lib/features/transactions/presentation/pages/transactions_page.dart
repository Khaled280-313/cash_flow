import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:cash_flow/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/function/custom_navigat.dart';
import '../widgets/custom_search_field.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primary,
          onPressed: () {
            customNavigatPush(context: context, path: "/addtransaction");
          },
          child: const Icon(Icons.add, size: 25, color: AppColor.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        backgroundColor: const Color.fromRGBO(235, 243, 246, 0.796),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  leading: CustomSearchField(),
                  leadingWidth: double.infinity,
                  pinned: true,
                  primary: true,
                ),

                SliverToBoxAdapter(child: SizedBox(height: 10)),
                // Here you can add your custom widgets for expenses
                SliverToBoxAdapter(
                  child: CustomText(
                    text: AppStrings.expenses,
                  ),
                ),

                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        width: 333,
                        height: 60,
                        child: ListTile(
                          onTap: () {},
                          trailing: Text(
                            "0\$",
                            style: AppTextStyle.montserratStyle14
                                .copyWith(color: AppColor.error),
                          ),
                          title: Text(
                            'Expense Item $index',
                          ),
                          subtitle: Text(
                            AppStrings.cash,
                            style: AppTextStyle.montserratBoldStyle12
                                .copyWith(color: AppColor.success),
                          ),
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(Icons.add_ic_call,
                                color: AppColor.white, size: 35),
                          ),
                        ),
                      );
                    },
                    childCount: 10, // Example count
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 20)),
                SliverToBoxAdapter(
                  child: CustomText(
                    text: AppStrings.income,
                  ),
                ),
                // Here you can add your custom widgets for income
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      width: 333,
                      height: 60,
                      child: ListTile(
                        onTap: () {},
                        trailing: Text(
                          "0\$",
                          style: AppTextStyle.montserratStyle14
                              .copyWith(color: AppColor.success),
                        ),
                        title: Text(
                          'Income Item $index',
                        ),
                        subtitle: Text(
                          AppStrings.cash,
                          style: AppTextStyle.montserratBoldStyle12
                              .copyWith(color: AppColor.success),
                        ),
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.add_ic_call,
                              color: AppColor.white, size: 35),
                        ),
                      ),
                    );
                  },
                  childCount: 10,
                ))
              ],
            ),
          ),
        ));
  }
}

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        style: AppTextStyle.montserratBoldStyle12.copyWith(fontSize: 20),
      ),
    );
  }
}
