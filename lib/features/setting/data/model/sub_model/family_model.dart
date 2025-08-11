import 'package:cash_flow/core/database/api/endpoint.dart';

class Families {
  final int id;
  final String familyName;
  final String role;

  Families({required this.id, required this.familyName, required this.role});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ApiKey.id: id,
      ApiKey.familyName: familyName,
      ApiKey.role: role,
    };
  }

  factory Families.fromMap(Map<String, dynamic> map) {
    return Families(
      id: map[ApiKey.id] as int,
      familyName: map[ApiKey.familyName] as String,
      role: map[ApiKey.role] as String,
    );
  }
}
