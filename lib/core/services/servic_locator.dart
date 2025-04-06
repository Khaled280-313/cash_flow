import 'package:cash_flow/core/database/cache/cache_helper.dart';
import 'package:cash_flow/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  // Register your services and repositories here

  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
  // getIt.registerLazySingleton(() => DatabaseHelper());
  // getIt.registerFactory(() => UserRepository(dbHelper: getIt<DatabaseHelper>()));
}
