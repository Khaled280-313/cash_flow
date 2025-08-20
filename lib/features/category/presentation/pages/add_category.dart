import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widgets/custom_text_feild.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../../../transactions/presentation/widgets/custom_button.dart';
import '../../../transactions/presentation/widgets/custom_cntain_togle.dart';

class AddBudgets extends StatelessWidget {
  const AddBudgets({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit home = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is CategoryAdded) {
          home.getCategories();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.category.message)),
          );
        } else if (state is CategoryError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: AppColor.background,
            appBar: AppBar(
              backgroundColor: AppColor.background,
              title: const Text('Add Category'),
            ),
            body: Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomTogleButton(
                      isSelected: [
                        home.type == 'INCOME',
                        home.type == 'EXPENSE'
                      ],
                      onPressed: (index) {
                        home.type = index == 0 ? 'INCOME' : 'EXPENSE';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: CustomTextFormFeild(
                      hintText: 'Enter Category Name',
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        home.name = value;
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsetsGeometry.all(20)),
                  state is CategoryLoading
                      ? const CustomButton(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : SizedBox(
                          width: 200,
                          child: CustomButton(
                            child: Text("Submit"),
                            onPressed: () {
                              home.addCategory();
                            },
                          ),
                        ),
                ],
              ),
            ));
      },
    );
  }
}

class CustomTogleButton extends StatefulWidget {
  const CustomTogleButton({
    super.key,
    required this.isSelected,
    this.onPressed,
  });
  final List<bool> isSelected;
  final void Function(int)? onPressed;

  @override
  State<CustomTogleButton> createState() => _CustomTogleButtonState();
}

class _CustomTogleButtonState extends State<CustomTogleButton> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 10,
            offset: Offset(5, 5),
            spreadRadius: 5)
      ]),
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
    );
  }
}
