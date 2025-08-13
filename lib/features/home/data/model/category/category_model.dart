import 'package:cash_flow/core/database/api/endpoint.dart';
import 'package:cash_flow/features/home/model/entities/catecory/category_entities.dart';

class CategoryModel extends CategoryEntities {
  CategoryModel({required super.name, required super.type});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json[ApiKey.categoryName],
      type: json[ApiKey.type],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.categoryName: name,
      ApiKey.type: type,
    };
  }
}
