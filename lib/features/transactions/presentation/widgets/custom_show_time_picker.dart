import 'package:flutter/material.dart';

import '../../../../core/function/get_time.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomShowTimePicker extends StatefulWidget {
  final TimeOfDay selectTime;
  const CustomShowTimePicker({
    super.key,
    required this.selectTime,
  });

  @override
  State<CustomShowTimePicker> createState() => _CustomShowTimePickerState();
}

class _CustomShowTimePickerState extends State<CustomShowTimePicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
              color: AppColor.success,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minWidth: 164,
              height: 43,
              onPressed: () {
                setState(() {
                  getTime(context, widget.selectTime).then((value) {
                    if (value != null) {
                      widget.selectTime != value;
                    }
                  });
                });
              },
              child: Row(
                spacing: 10,
                children: [
                  Icon(
                    Icons.access_time,
                    color: AppColor.white,
                  ),
                  Text(
                    AppStrings.selectTime,
                    style: AppTextStyle.montserrat500Style16.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ],
              )),
          Text(
            widget.selectTime.format(context),
            style: AppTextStyle.montserrat300Style16.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
