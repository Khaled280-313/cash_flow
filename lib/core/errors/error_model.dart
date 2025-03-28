
//هذا الكلاس يحتوي على الايرور الذي يتم ارجاعه من السيرفر
import '../api/endpoint.dart';

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
