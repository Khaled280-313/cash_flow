import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../data/budgets_data.dart';

class CustomCategoryTile extends StatelessWidget {
  final BudgetsData data;
  const CustomCategoryTile({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 1),
        CircleAvatar(
          backgroundColor: data.color,
          child: Icon(
            data.icon,
            color: AppColor.white,
            size: 30,
          ),
        ),
        Expanded(
            child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              style: AppTextStyle.montserrat500Style16,
            ),
            LinearProgressIndicator(
              value: double.parse((2000 / data.value).toStringAsFixed(2)),
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation(data.color),
              minHeight: 10,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ],
        )),
        SizedBox(width: 10)
      ],
    );
  }
}
