import 'package:cash_flow/core/database/cache/cache_helper.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:cash_flow/features/home/data/datasources/category/categoty_local_data_source.dart';
import 'package:cash_flow/features/home/data/repositories/category/category_repo_impl.dart';
import 'package:cash_flow/features/home/model/usecases/addCategory.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/api/dio_consumer.dart';
import '../../data/datasources/category/category_remot_data_source.dart';
import '../../model/entities/catecory/category_entities.dart';
import '../../model/usecases/cattegory/getCategories.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  String name = 'Personal';
  var type = 'income';
  void addCategory(CategoryEntities category) async {
    emit(CategoryLoading());
    final result = await AddCategory(
        categoryRepo: CategoryRepoImpl(
      localData: null,
      remoteData: getIt<CategoryRemoteDataSource>(),
    )).call(CategoryEntities(name: name, type: type));
    result.fold(
      (failure) => emit(CategoryError(message: failure.message)),
      (success) => emit(CategoryAdded()),
    );
  }

  Future<void> getCategories() async {
    emit(CategoryLoading());
    final result = await GetCategories(
        categoryRepo: CategoryRepoImpl(
      localData: CategoryLocalDataSource(),
      remoteData: CategoryRemoteDataSource(api: getIt<DioConsumer>()),
    )).call();
    result.fold(
      (failure) => emit(CategoryError(message: failure.message)),
      (categories) => emit(CategoryLoaded(categories: categories)),
    );
    print(getIt<CacheHelper>().getData(key: 'cached_categories'));
  }
}
