import 'package:cash_flow/features/setting/data/model/sub_model/family_model.dart';
import 'package:cash_flow/features/setting/domain/entities/user_entities.dart';

import '../../../../core/database/api/endpoint.dart';

class UserModel extends UserEntities {
  final String joinDate;
  final List<dynamic> families;

  UserModel({
    required this.joinDate,
    required this.families,
    required super.username,
    required super.image,
    required super.firstName,
    required super.lastName,
    required super.bio,
    required super.job,
    required super.birthdate,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ApiKey.joinDate: joinDate,
      ApiKey.families: families.map((family) => family.toJson()).toList(),
      ApiKey.username: username,
      ApiKey.image: image,
      ApiKey.firstName: firstName,
      ApiKey.lastName: lastName,
      ApiKey.bio: bio,
      ApiKey.job: job,
      ApiKey.birthDate: birthdate,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      joinDate: json[ApiKey.joinDate] as String,
      families: (json[ApiKey.families] as List<dynamic>)
          .map((family) => Families.fromMap(family as Map<String, dynamic>))
          .toList(),
      username: json[ApiKey.username],
      image: json[ApiKey.image],
      firstName: json[ApiKey.firstName],
      lastName: json[ApiKey.lastName],
      bio: json[ApiKey.bio],
      job: json[ApiKey.job],
      birthdate: json[ApiKey.birthDate] as String,
    );
  }
}
