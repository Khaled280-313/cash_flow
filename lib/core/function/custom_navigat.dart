import 'package:go_router/go_router.dart';

void customNavigatPushReplacement({required context, required String path}) {
  GoRouter.of(context).pushReplacement(path);
}
void customNavigatPush({required context, required String path}) {
  GoRouter.of(context).push(path);
}

void delayedNavigator(context, String path) {
  Future.delayed(Duration(seconds: 2),
      () => customNavigatPushReplacement(context: context, path: path));
}
