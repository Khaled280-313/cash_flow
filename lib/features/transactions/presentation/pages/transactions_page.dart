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

                SliverToBoxAdapter(child: SizedBox(height: 20)),
                // Here you can add your custom widgets for expenses
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ListTile(
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
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.add_ic_call, color: AppColor.white),
                        ),
                      );
                    },
                    childCount: 10, // Example count
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 20)),
                SliverToBoxAdapter(
                  child: Divider(
                    color: AppColor.textSecondary,
                    height: 0.5,
                  ),
                ),
                // Here you can add your custom widgets for income
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
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
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.add_ic_call, color: AppColor.white),
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
