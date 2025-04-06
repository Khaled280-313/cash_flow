//هذا الكلاس يحتوي على الايرور الذي يتم ارجاعه من السيرفر
import '../database/api/endpoint.dart';

class ErrorModel {
  final int status;
  final String errorMassage;
  ErrorModel({
    required this.status,
    required this.errorMassage,
  });

  factory ErrorModel.fromMap(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKey.status],
      errorMassage: jsonData[ApiKey.errorMessage],
    );
  }
}
