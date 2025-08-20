import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../generated/l10n.dart';
import '../../data/repositories/bank_acount_transaction.dart';
import '../../data/repositories/cash_transaction.dart';
import 'custum_row_acount.dart';

class CustumWidgetAcount extends StatelessWidget {
  const CustumWidgetAcount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: InkWell(
      onLongPress: () {},
      onTap: () {},
      child: Container(
        height: 110,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha(26),
                  blurRadius: 10,
                  offset: Offset(5, 5),
                  spreadRadius: 5)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(S.of(context).account,
                    style: AppTextStyle.montserratBoldStyle20),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColor.primary,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  CustumRowAcount(
                      data: cashTransaction,
                      color: Colors.green,
                      title: S.of(context).cash,
                      amount: "1000\$",
                      icon: Icons.payments),
                  CustumRowAcount(
                      data: bankAcountTransaction,
                      color: Colors.blue,
                      title: S.of(context).bankAccount,
                      amount: "5000\$",
                      icon: Icons.account_balance_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
