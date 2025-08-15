import 'package:cash_flow/core/database/api/dio_consumer.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cash_flow/features/auth/presentation/pages/sign_in_page.dart';
import 'package:cash_flow/features/auth/presentation/pages/sign_up_page.dart';
import 'package:cash_flow/features/onboarding/presentation/page/onboarding_page.dart';
import 'package:cash_flow/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:cash_flow/features/splash_view/pages/splash_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/budgets/presentation/pages/add_budgets.dart';
import '../../features/home/presentation/widgets/bottom_navigation_bar.dart';
import '../../features/setting/presentation/pages/profile_page.dart';
import '../../features/setting/presentation/pages/setting_page.dart';
import '../../features/transactions/presentation/cubit/transactions_cubit.dart';
import '../../features/transactions/presentation/pages/add_transactions.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: "/onboarding",
    builder: (context, state) => OnboardingPage(),
  ),
  GoRoute(
    path: "/SignUp",
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(DioConsumer(dio: Dio())),
      child: SignUpPage(),
    ),
  ),
  GoRoute(
    path: "/SignIn",
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(DioConsumer(dio: Dio())),
      child: SignInPage(),
    ),
  ),
  GoRoute(
    path: "/BottomNavigation",
    builder: (context, state) => BottomNavigationBarHome(),
  ),
  GoRoute(
    path: "/Addtransaction",
    builder: (context, state) => BlocProvider(
        create: (context) => TransactionsCubit(), child: AddTransactions()),
  ),
  GoRoute(
    path: "/AddBudgets",
    builder: (context, state) => AddBudgets(),
  ),
  GoRoute(
    path: "/SettingPage",
    builder: (context, state) => SettingPage(),
  ),
  GoRoute(
    path: "/ProfilePage",
    builder: (context, state) => BlocProvider(
      create: (context) => SettingCubit()..getUser(),
      child: ProfilePage(),
    ),
  ),
]);
