import 'dart:convert';

import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/features/transactions/presentation/cubit/transactions_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text_feild.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_category_field.dart';
import '../widgets/custom_show_date_picker.dart';
import '../widgets/custom_top_contain.dart';

class AddTransactions extends StatefulWidget {
  const AddTransactions({super.key});
  // static List<dynamic> cachedList =
  //     jsonDecode(getIt<CacheHelper>().getData(key: "cached_categories"));

  // static final List<String> category =
  //     cachedList.map((item) => item['categoryName'] as String).toList();

  // static List<String> categories = [...category, "Add Category"];

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  List<String> categories = ['Add Category']; // default
  bool loadingCategories = true;
  Future<void> _loadCategories() async {
    try {
      final raw = getIt<CacheHelper>().getData(key: "cached_categories");
      if (raw == null) {
        setState(() {
          categories = ['Add Category'];
          loadingCategories = false;
        });
        return;
      }
      final List<dynamic> cachedList = jsonDecode(raw) as List<dynamic>;
      final list = cachedList.map((e) => e['categoryName'] as String).toList();
      setState(() {
        categories = [...list, 'Add Category'];
        loadingCategories = false;
      });
    } catch (e) {
      // handle parse error
      setState(() {
        categories = ['Add Category'];
        loadingCategories = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

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
                  CustomTopContain(
                    onPressed: (transactionsTypeIndex) {
                      transactionsCubit
                          .changeTransactionType(transactionsTypeIndex);
                    },
                    isSelected: [
                      transactionsCubit.type == "income",
                      transactionsCubit.type == "expenses"
                    ],
                  ),
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
                          if (loadingCategories)
                            const CircularProgressIndicator(),
                          if (!loadingCategories)
                            CustomCategoryField(
                                hintText: AppStrings.category,
                                categories: categories,
                                onChanged: (value)  async{
                                  if (value == "Add Category") {
                                    customNavigatPushReplacement(
                                        context: context, path: "/AddBudgets");
                                         await _loadCategories();
                                  } else {
                                    transactionsCubit.selectedCategory = value!;
                                  }
                                }),
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
