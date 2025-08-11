import 'package:cash_flow/core/database/api/api_consumer.dart';
import 'package:cash_flow/core/database/api/endpoint.dart';
import 'package:cash_flow/features/setting/data/model/user_model.dart';

class UsreDataRemoteSource {
  final ApiConsumer api;

  UsreDataRemoteSource({required this.api});
  Future<UserModel> getUser() async {
    final response = await api.get(endpoint: Endpoint.getMyProfileEndpoint);
    return UserModel.fromJson(response);
  }
}
