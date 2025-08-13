import 'package:cash_flow/core/database/api/api_consumer.dart';
import 'package:cash_flow/core/database/api/endpoint.dart';

import '../../model/category/category_model.dart';

class CategoryRemoteDataSource {
  final ApiConsumer api;

  CategoryRemoteDataSource({required this.api});

  Future<List<CategoryModel>> getCategories() async {
    final response =
        await api.get(endpoint: Endpoint.getAllUserCategoriesEndpoint);
    return (response.data as List)
        .map((category) => CategoryModel.fromJson(category))
        .toList();
  }

  Future<void> addCategory(CategoryModel category) async {
    await api.post(
        endpoint: Endpoint.createUserCategoryEndpoint, data: category.toJson());
  }
}
