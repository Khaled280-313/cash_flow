import 'package:cash_flow/features/onboarding/presentation/page/onboarding_page.dart';
import 'package:cash_flow/features/splash_view/pages/splash_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: "/onboarding",
    builder: (context, state) =>  OnboardingPage(),
  )
]);
