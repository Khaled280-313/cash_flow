import 'package:cash_flow/core/database/cache/cache_helper.dart';

import 'package:get_it/get_it.dart';

import '../../features/transactions/presentation/cubit/transactions_cubit.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  // Register your services and repositories here

  getIt.registerSingleton<CacheHelper>(CacheHelper());
  // getIt.registerSingleton<AuthCubit>(AuthCubit(DioConsumer(dio: Dio())));
  getIt.registerSingleton<TransactionsCubit>(TransactionsCubit());

  // getIt.registerSingleton<SizeConfig>(SizeConfig());
  // getIt.registerLazySingleton(() => DatabaseHelper());
  // getIt.registerFactory(() => UserRepository(dbHelper: getIt<DatabaseHelper>()));
}
