import 'package:cash_flow/core/database/cache/cache_helper.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import '../../features/transactions/presentation/cubit/transactions_cubit.dart';
import '../connection/network_info.dart';
import '../database/api/dio_consumer.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  // Register your services and repositories here

  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerLazySingleton(() => DioConsumer(dio: Dio()));

  getIt.registerSingleton<TransactionsCubit>(TransactionsCubit());
  getIt.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());

  getIt.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImpl(dataConnectionChecker: getIt<DataConnectionChecker>()));

  // getIt.registerSingleton<SizeConfig>(SizeConfig());
  // getIt.registerLazySingleton(() => DatabaseHelper());
  // getIt.registerFactory(() => UserRepository(dbHelper: getIt<DatabaseHelper>()));
}
