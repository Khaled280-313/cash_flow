import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomWidgetAvarge extends StatelessWidget {
  const CustomWidgetAvarge({
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
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(26),
              blurRadius: 10,
              offset: const Offset(5, 5),
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 1,
              ),
              child: Expanded(
                  child: ListTile(
                title: Text("Average"),
                subtitle: Text(
                  "All Time",
                ),
              )),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title:
                        Text("Day", style: AppTextStyle.montserrat500Style16),
                    horizontalTitleGap: 1,
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
                    title:
                        Text("week", style: AppTextStyle.montserrat500Style16),
                    horizontalTitleGap: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 15),
                  child: Text(
                    "0\$",
                    style: TextStyle(color: AppColor.green),
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
                    title: Text("All Time",
                        style: AppTextStyle.montserrat500Style16),
                    horizontalTitleGap: 1,
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
