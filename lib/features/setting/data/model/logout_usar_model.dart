import 'package:cash_flow/core/database/api/endpoint.dart';

import '../../domain/entities/logout_user_entities.dart';

class LogoutUserModel extends LogoutUserEntities {
  LogoutUserModel({required super.message});

  factory LogoutUserModel.fromJson(Map<String, dynamic> json) {
    return LogoutUserModel(
      message: json[ApiKey.message],
    );
  }
}
