import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_show_date_picker.dart';
import '../widgets/custom_show_time_picker.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_top_contain.dart';

class AddTransactions extends StatelessWidget {
  const AddTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              CustomTopContain(),
              Container(
                padding: const EdgeInsets.only(top: 16),
                margin: const EdgeInsets.only(top: 200),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 200,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    // MenuItemButton(),
                    CustomTextField(hintText: AppStrings.category),
                    CustomTextField(hintText: AppStrings.amount),
                    CustomTextField(hintText: AppStrings.title),
                    CustomTextField(hintText: AppStrings.description),
                    CustomShowDatePicker(),
                    CustomShowTimePicker(),
                    ElevatedButton(
                      onPressed: () {
                        // Handle save transaction logic
                      },
                      child: const Text('Save Transaction'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
