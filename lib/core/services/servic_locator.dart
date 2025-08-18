import 'package:cash_flow/core/database/cache/cache_helper.dart';
import 'package:cash_flow/features/transactions/data/datasources/transactions_data_local_source.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

// import '../../features/home/data/datasources/category/category_remot_data_source.dart';
// import '../../features/home/data/datasources/category/categoty_local_data_source.dart';
import '../connection/network_info.dart';
import '../database/api/dio_consumer.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());

  getIt.registerLazySingleton(() => DioConsumer(dio: Dio()));

  getIt.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());

  getIt.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImpl(dataConnectionChecker: getIt<DataConnectionChecker>()));

  getIt.registerLazySingleton<TransactionsDataLocalSource>(
      () => TransactionsDataLocalSource());

  // getIt.registerLazySingleton<CategoryRemoteDataSource>(
  //     () => CategoryRemoteDataSource(api: getIt<DioConsumer>()));
}
