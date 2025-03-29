import 'package:go_router/go_router.dart';

void customNavigat({required context, required String path}) {
  GoRouter.of(context).pushReplacement(path);
}
