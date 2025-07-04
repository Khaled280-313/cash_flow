import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cash_flow/features/auth/presentation/pages/sign_in_page.dart';
import 'package:cash_flow/features/auth/presentation/pages/sign_up_page.dart';
import 'package:cash_flow/features/home/presentation/widgets/bottom_Navigation_Bar.dart';
import 'package:cash_flow/features/onboarding/presentation/page/onboarding_page.dart';
import 'package:cash_flow/features/splash_view/pages/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/budgets/presentation/pages/add_budgets.dart';
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
      create: (context) => getIt<AuthCubit>(),
      child: SignUpPage(),
    ),
  ),
  GoRoute(
    path: "/SignIn",
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: SignInPage(),
    ),
  ),
  GoRoute(
    path: "/BottomNavigatin",
    builder: (context, state) => BottomNavigationBarHome(),
  ),
  GoRoute(
    path: "/Addtransaction",
    builder: (context, state) => BlocProvider(
        create: (context) => getIt<TransactionsCubit>(),
        child: AddTransactions()),
  ),
  GoRoute(
    path: "/AddBudgets",
    builder: (context, state) => AddBudgets(),
  ),
]);
