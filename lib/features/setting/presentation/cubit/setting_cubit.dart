import 'package:cash_flow/core/database/api/dio_consumer.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:cash_flow/features/setting/data/datasourecs/user_data_local_source.dart';
import 'package:cash_flow/features/setting/data/datasourecs/usre_data_remote_source.dart';
import 'package:cash_flow/features/setting/data/repo/user_repo_imp.dart';
import 'package:cash_flow/features/setting/domain/entities/user_entities.dart';
import 'package:cash_flow/features/setting/domain/usecases/get_user.dart';
import 'package:cash_flow/features/setting/domain/usecases/logout_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  getUser() async {
    emit(GetUserLoading());
    final user = await GetUser(
        user: UserRepoImp(
      localData: UserDataLocalSource(),
      remoteData: UsreDataRemoteSource(api: getIt<DioConsumer>()),
    )).call();

    user.fold(
      (failure) => emit(GetUserFailuer(errrMessage: failure.message)),
      (user) => emit(GetUserSucess(user: user)),
    );
  }

  logoutUser() async {
    emit(LogoutUserLoading());
    final logged = await LogoutUser(
        userRepo: UserRepoImp(
      remoteData: UsreDataRemoteSource(api: getIt<DioConsumer>()),
      localData: null,
    )).call();
    logged.fold(
      (failure) => emit(LogoutUserFailure(errorMessage: failure.message)),
      (success) => emit(LogoutUserSuccess(message: success.message)),
    );
  }
}
