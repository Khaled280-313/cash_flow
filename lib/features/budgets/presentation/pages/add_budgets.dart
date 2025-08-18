import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
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
            appBar: AppBar(
              title: const Text('Add Budgets'),
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
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      onChanged: (value) {
                        home.name = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Category Name',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  state is CategoryLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () {
                            home.addCategory();
                          },
                          child: const Text('Submit'),
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
    return ToggleButtons(
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
    );
  }
}
