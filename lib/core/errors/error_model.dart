import 'package:happy_tech_mastering_api_with_flutter/core/api/endpoint.dart';
//هذا الكلاس يحتوي على الايرور الذي يتم ارجاعه من السيرفر
class ErrorModel {
  final int status; 
  final String errorMassage;
  ErrorModel({
    required this.status,
    required this.errorMassage,
  });

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      status: map[ApiKey.status] ,
      errorMassage: map[ApiKey.errorMessage],
    );
  }
}
