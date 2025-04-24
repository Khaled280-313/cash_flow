import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../onboarding/presentation/widgets/custom_botton.dart';

class CustomButtonBottomSheet extends StatefulWidget {
  const CustomButtonBottomSheet({
    super.key,
  });

  @override
  State<CustomButtonBottomSheet> createState() =>
      _CustomButtonBottomSheetState();
}

class _CustomButtonBottomSheetState extends State<CustomButtonBottomSheet> {
  bool isChecked1 = false;

  bool isChecked2 = false;

  bool isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          showModalBottomSheet(
            isDismissible: true,
            isScrollControlled: true,
            backgroundColor: AppColor.white,
            useRootNavigator: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            elevation: 40,
            useSafeArea: true,
            enableDrag: true,
            showDragHandle: true,
            context: context,
            builder: (context) {
              return SizedBox(
                height: 350,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(AppStrings.totalBalanceFilter,
                          style: AppTextStyle.montserratBoldStyle20),
                    ),
                    ListTile(
                      title: Text(AppStrings.allAccounts),
                      trailing: Checkbox(
                          value: isChecked1,
                          onChanged: (value) {
                            // isChecked1 = value!;
                          }),
                      onTap: () {
                        isChecked1 = true;
                        isChecked2 = false;
                        isChecked3 = false;
                      },
                    ),
                    Divider(
                      color: AppColor.textSecondary,
                      height: 1,
                    ),
                    ListTile(
                      title: Text(AppStrings.cash),
                      subtitle: Text("1000 \$"),
                      trailing: Checkbox(
                          value: isChecked2,
                          onChanged: (value) {
                            isChecked2 = value!;
                          }),
                      onTap: () {
                        isChecked2 = true;
                        isChecked1 = false;
                        isChecked3 = false;
                      },
                    ),
                    ListTile(
                      title: Text(AppStrings.bankAccount),
                      subtitle: Text("1000 \$"),
                      trailing: Checkbox(
                          value: isChecked3,
                          onChanged: (value) {
                            isChecked3 = value!;
                          }),
                      onTap: () {
                        isChecked3 = true;
                        isChecked1 = false;
                        isChecked2 = false;
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      width: double.infinity,
                      child: CustomBotton(
                          height: 45,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: AppColor.primary,
                          child: Text(
                            AppStrings.done,
                            style: AppTextStyle.montserrat500Style24
                                .copyWith(color: AppColor.white, fontSize: 20),
                          )),
                    )
                  ],
                ),
              );
            },
          );
        });
      },
      icon: Icon(
        Icons.filter_list,
        color: AppColor.primary,
      ),
      iconSize: 30,
    );
  }
}
