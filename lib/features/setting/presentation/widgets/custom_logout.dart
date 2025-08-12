import 'package:cash_flow/core/database/cache/cache_helper.dart';
import 'package:cash_flow/core/function/custom_navigat.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import '../cubit/setting_cubit.dart';

class CustomLogout extends StatelessWidget {
  const CustomLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SettingCubit(),
        child: BlocConsumer<SettingCubit, SettingState>(
          listener: (context, state) {
            if (state is LogoutUserSuccess) {
              getIt<CacheHelper>().clearData(key: "isAuthVisited");
              customNavigatPushReplacement(context: context, path: '/SignIn');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(AppStrings.logout),
                  backgroundColor: AppColor.error,
                ),
              );
            } else if (state is LogoutUserFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
          builder: (context, state) {
            return Material(
              child: ListTile(
                tileColor: AppColor.white,
                trailing: Icon(Icons.logout, color: AppColor.error),
                title: state is LogoutUserLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColor.primary,
                      ))
                    : const Text(AppStrings.logout,
                        style: TextStyle(color: AppColor.error)),
                onTap: () {
                  context.read<SettingCubit>().logoutUser();
                },
              ),
            );
          },
        ));
  }
}
