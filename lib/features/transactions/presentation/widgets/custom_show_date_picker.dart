import 'package:cash_flow/core/function/get_Date.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomShowDatePicker extends StatefulWidget {
  final DateTime selectedDate;
  const CustomShowDatePicker({
    super.key,
    required this.selectedDate,
  });

  @override
  State<CustomShowDatePicker> createState() => _CustomShowDatePickerState();
}

class _CustomShowDatePickerState extends State<CustomShowDatePicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
              color: AppColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minWidth: 164,
              height: 43,
              onPressed: () {
                setState(() {
                  getDate(context, widget.selectedDate).then((value) {
                    if (value != null) {
                      widget.selectedDate!= value;
                    }
                  });
                });
              },
              child: Row(
                spacing: 10,
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: AppColor.white,
                  ),
                  Text(
                    AppStrings.selectDate,
                    style: AppTextStyle.montserrat500Style16.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ],
              )),
          Text(
            widget.selectedDate.toString().split(' ')[0],
            style: AppTextStyle.montserrat300Style16.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
