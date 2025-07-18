import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import 'custom_cntain_togle.dart';

class CustomTopContain extends StatefulWidget {
  final String type;
  const CustomTopContain({
    super.key,
    required this.type,
  });

  @override
  State<CustomTopContain> createState() => _CustomTopContainState();
}

class _CustomTopContainState extends State<CustomTopContain> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 280,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? AppColor.success : Color(0xFFFF3E4C),
        ),
        child: Column(
          spacing: 15,
          children: [
            Container(
              width: 342,
              height: 56,
              margin: const EdgeInsets.only(top: 50, bottom: 16),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleButtons(
                  borderColor: AppColor.white,
                  borderRadius: BorderRadius.circular(30),
                  selectedBorderColor: AppColor.white,
                  splashColor: AppColor.white,
                  constraints: const BoxConstraints(
                    minWidth: 167,
                    minHeight: 48,
                  ),
                  fillColor: AppColor.white,
                  borderWidth: 3,
                  onPressed: (index) {
                    setState(() {
                      if (isSelected == true) {
                        isSelected = index == 0;
                        widget.type != "income";
                      } else {
                        isSelected = index == 0;
                        widget.type != "expenses";
                      }
                    });
                  },
                  isSelected: [isSelected, !isSelected],
                  children: [
                    CustomCntainTogle(
                      text: AppStrings.income,
                      isSelected: isSelected,
                    ),
                    CustomCntainTogle(
                      text: AppStrings.expenses,
                      isSelected: !isSelected,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Add Transaction',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
