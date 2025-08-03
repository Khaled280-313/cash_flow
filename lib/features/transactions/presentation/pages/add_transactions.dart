import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_text_feild.dart';
import '../cubit/transactions_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_show_date_picker.dart';
import '../widgets/custom_category_field.dart';
import '../widgets/custom_top_contain.dart';

class AddTransactions extends StatelessWidget {
  const AddTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionsCubit, TransactionsState>(
      listener: (context, state) {
        // You can handle state changes here if needed
      },
      builder: (context, state) {
        TransactionsCubit transactionsCubit =
            BlocProvider.of<TransactionsCubit>(context);
        return Scaffold(
            backgroundColor: AppColor.white,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  CustomTopContain(type: transactionsCubit.type),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 10, right: 20, left: 20),
                    margin: const EdgeInsets.only(top: 250),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Form(
                      key: transactionsCubit.addTransactionFormKey,
                      child: Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          // MenuItemButton(),
                          CustomCategoryField(hintText: AppStrings.category),
                          CustomTextFormFeild(
                              hintText: AppStrings.amount,
                              textInputType: TextInputType.number,
                              // controller: transactionsCubit.amountController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppStrings.requiredField;
                                }
                                return null;
                              }),
                          CustomTextFormFeild(
                              hintText: AppStrings.title,
                              textInputType: TextInputType.emailAddress,
                              // controller: transactionsCubit.titleController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppStrings.requiredField;
                                }
                                return null;
                              }),
                          CustomTextFormFeild(
                              hintText: AppStrings.description,
                              textInputType: TextInputType.multiline,
                              // controller:
                              //     transactionsCubit.descriptionController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppStrings.requiredField;
                                }
                                return null;
                              }),
                          CustomDatePicker(
                            initialDate: transactionsCubit.selectedDate,
                            onDateChanged: (date) {
                              transactionsCubit.selectedDate = date;
                            },
                          ),
                          // CustomShowTimePicker(
                          //   selectTime: transactionsCubit.selectedTime,
                          // ),
                          const SizedBox(height: 10),
                          Divider(
                            color: AppColor.textSecondary,
                            height: 1,
                            thickness: 1.5,
                            endIndent: 15,
                            indent: 15,
                          ),
                          const SizedBox(height: 10),
                          CustomButton()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
