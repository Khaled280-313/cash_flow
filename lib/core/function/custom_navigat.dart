import 'package:go_router/go_router.dart';

void customNavigatPushReplacement({required context, required String path}) {
  GoRouter.of(context).pushReplacement(path);
}
void customNavigatPush({required context, required String path}) {
  GoRouter.of(context).push(path);
}
