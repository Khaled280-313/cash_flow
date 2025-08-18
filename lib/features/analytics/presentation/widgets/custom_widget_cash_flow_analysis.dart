import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../generated/l10n.dart';

class CustomWidgetCashFlowAnalysis extends StatelessWidget {
  const CustomWidgetCashFlowAnalysis({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        height: 260,
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 5,
        ),
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(
                  top: 1,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(S.of(context).appName),
                        subtitle: Text("All Time"),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined),
                    ),
                  ],
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(S.of(context).income,
                        style: AppTextStyle.montserrat500Style16),
                    horizontalTitleGap: 1,
                    leading: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: AppColor.success,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.arrow_upward_outlined,
                        color: AppColor.white,
                        size: 14,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 15),
                  child: Text(
                    "0\$",
                    style: TextStyle(color: AppColor.success),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(S.of(context).expenses,
                        style: AppTextStyle.montserrat500Style16),
                    horizontalTitleGap: 1,
                    leading: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: AppColor.error,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.arrow_downward_outlined,
                        color: AppColor.white,
                        size: 14,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 15),
                  child: Text(
                    "0\$",
                    style: TextStyle(color: AppColor.error),
                  ),
                )
              ],
            ),
            Divider(
              color: AppColor.textSecondary.withOpacity(0.5),
              thickness: 1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("${S.of(context).totalBalance} :",
                        style: AppTextStyle.montserrat500Style16),
                    horizontalTitleGap: 1,
                    leading: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.account_balance_wallet_outlined,
                        color: AppColor.white,
                        size: 14,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 15),
                  child: Text(
                    "0\$",
                    style: TextStyle(color: AppColor.primary, fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
