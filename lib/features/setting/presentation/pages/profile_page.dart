import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingState>(
      listener: (context, state) {
        if (state is GetUserFailuer) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errrMessage)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.background,
          appBar: AppBar(
            title: Text('Profile'),
            backgroundColor: AppColor.background,
          ),
          body: state is GetUserLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColor.primary,
                ))
              : state is GetUserSucess
                  ? Container(
                      height: 500,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        border: Border.all(color: AppColor.white, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColor.background,
                              child: SizedBox(
                                child: state.user.image != null
                                    ? Image.network(state.user.image!)
                                    : Icon(Icons.person,
                                        size: 50, color: Colors.grey),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsetsGeometry.all(10)),
                          Text('First Name: ${state.user.firstName}',
                              style: TextStyle(fontSize: 20)),
                          Text('Last Name: ${state.user.lastName}',
                              style: TextStyle(fontSize: 20)),
                          Text('Username: ${state.user.username}',
                              style: TextStyle(fontSize: 20)),
                          Text('Bio: ${state.user.bio}',
                              style: TextStyle(fontSize: 20)),
                          Text('Job: ${state.user.job}',
                              style: TextStyle(fontSize: 20)),
                          Text('Birthdate: ${state.user.birthdate}',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    )
                  : Center(child: Text('No user data available')),
        );
      },
    );
  }
}
