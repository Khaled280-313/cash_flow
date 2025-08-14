import 'package:cash_flow/core/database/api/endpoint.dart';
import 'package:cash_flow/core/database/cache/cache_helper.dart';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import '../../features/home/data/datasources/category/category_remot_data_source.dart';
import '../../features/home/data/datasources/category/categoty_local_data_source.dart';
import '../../features/transactions/presentation/cubit/transactions_cubit.dart';
import '../connection/network_info.dart';
import '../database/api/dio_consumer.dart';

final getIt = GetIt.instance;
void setupServiceLocator() async {
  getIt.registerSingleton<CacheHelper>(CacheHelper());

  getIt.registerLazySingleton(() => DioConsumer(dio: Dio()));

  final dio = Dio(BaseOptions(baseUrl: Endpoint.baseUrl));
  getIt.registerLazySingleton<Dio>(() => dio);

  getIt
      .registerLazySingleton<DioConsumer>(() => DioConsumer(dio: getIt<Dio>()));

  getIt.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());

  getIt.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImpl(dataConnectionChecker: getIt<DataConnectionChecker>()));

  getIt.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImpl(dataConnectionChecker: getIt<DataConnectionChecker>()));

  getIt.registerLazySingleton<CategoryLocalDataSource>(
      () => CategoryLocalDataSource());

  getIt.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSource(api: getIt<DioConsumer>()));

  // --- Repositories / Usecases (example) ---
  // getIt.registerLazySingleton<CategoryRepository>(() =>
  //   CategoryRepositoryImpl(remoteDataSource: getIt(), localDataSource: getIt(), networkInfo: getIt()));
  // getIt.registerLazySingleton(() => GetCategories(getIt()));

  // --- Cubits / Blocs ---
  // For Cubits/Blocs prefer registerFactory (new instance per injection)
  getIt.registerFactory<TransactionsCubit>(() => TransactionsCubit());
  // e.g. getIt.registerFactory(() => CategoriesCubit(getCategories: getIt()));

  // done
}
