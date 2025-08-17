import 'package:cash_flow/core/database/api/api_consumer.dart';
import 'package:cash_flow/core/database/api/endpoint.dart';

import '../../../model/entities/catecory/category_add_message.dart';
import '../../model/category/category_model.dart';

class CategoryRemoteDataSource {
  final ApiConsumer api;

  CategoryRemoteDataSource({required this.api});

  Future<List<CategoryModel>> getCategories() async {
    final response =
        await api.get(endpoint: Endpoint.getAllUserCategoriesEndpoint);

    final dynamic payload = response;

    List<dynamic> jsonList;
    if (payload is List) {
      jsonList = payload;
    } else if (payload is Map && payload['data'] is List) {
      jsonList = payload['data'] as List<dynamic>;
    } else {
      throw FormatException(
          'Unexpected JSON format for categories: ${payload.runtimeType}');
    }

    return jsonList
        .map((e) => CategoryModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<CategoryAddMessage> addCategory(CategoryModel category) async {
    final response = await api.post(
        endpoint: Endpoint.createUserCategoryEndpoint, data: category.toJson());

    return CategoryAddMessage(message: response.data.toString());
  }
}
