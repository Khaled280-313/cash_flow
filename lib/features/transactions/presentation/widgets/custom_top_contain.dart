import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../generated/l10n.dart';
import 'custom_cntain_togle.dart';

class CustomTopContain extends StatefulWidget {
  final List<bool> isSelected;
  final void Function(int)? onPressed;

  const CustomTopContain({
    super.key,
    required this.isSelected,
    this.onPressed,
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
                  onPressed: ((index) {
                    setState(() {
                      isSelected = !isSelected;
                      widget.onPressed?.call(index);
                    });
                  }),
                  isSelected: widget.isSelected,
                  children: [
                    CustomCntainTogle(
                      text: S.of(context).income,
                      isSelected: isSelected,
                    ),
                    CustomCntainTogle(
                      text: S.of(context).expenses,
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
