import 'package:flutter/material.dart';

import '../../../../core/function/get_time.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomShowTimePicker extends StatefulWidget {
  const CustomShowTimePicker({
    super.key,
  });

  @override
  State<CustomShowTimePicker> createState() => _CustomShowTimePickerState();
}

class _CustomShowTimePickerState extends State<CustomShowTimePicker> {
  TimeOfDay selectTime = TimeOfDay.now();

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
                  getTime(context, selectTime).then((value) {
                    if (value != null) {
                      selectTime = value;
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
            selectTime.format(context),
            style: AppTextStyle.montserrat300Style16.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
