import 'package:cash_flow/core/database/api/api_consumer.dart';
import 'package:cash_flow/core/database/api/endpoint.dart';
import 'package:cash_flow/features/setting/data/model/logout_usar_model.dart';
import 'package:cash_flow/features/setting/data/model/user_model.dart';

class UsreDataRemoteSource {
  final ApiConsumer api;

  UsreDataRemoteSource({required this.api});
  Future<UserModel> getUser() async {
    final response = await api.get(endpoint: Endpoint.getMyProfileEndpoint);
    return UserModel.fromJson(response);
  }

  Future<LogoutUserModel> logoutUser() async {
    final response = await api.post(endpoint: Endpoint.logoutEndpoint);
    return LogoutUserModel.fromJson(response.data);
  }
}
