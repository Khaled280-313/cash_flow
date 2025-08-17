import 'dart:convert';

import 'package:cash_flow/core/database/cache/cache_helper.dart';
import 'package:cash_flow/core/services/servic_locator.dart';

import '../../../../../core/errors/exception.dart';
import '../../model/category/category_model.dart';

class CategoryLocalDataSource {
  Future categoryCache(List<CategoryModel>? categories) async {
    if (categories == null) {
      throw CacheException("No user to cache");
    }
    final jsonString = jsonEncode(categories.map((c) => c.toJson()).toList());
    getIt<CacheHelper>().saveData(key: "cached_categories", value: jsonString);
  }

  Future<List<CategoryModel>> getCachedCategories() async {
    final jsonString =
        await getIt<CacheHelper>().getData(key: "cached_categories");
    if (jsonString == null || (jsonString is String && jsonString.isEmpty)) {
      throw CacheException("No cached categories found");
    }
    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList.map((json) => CategoryModel.fromJson(json)).toList();
  }
}
