import 'dart:convert';

import 'package:cash_flow/core/database/cache/cache_helper.dart';
import 'package:cash_flow/core/errors/exception.dart';
import 'package:cash_flow/core/services/servic_locator.dart';
import 'package:cash_flow/features/setting/data/model/user_model.dart';

class UserDataLocalSource {
  // احفظ المستخدم في الكاش كـ JSON string (آمن)
  Future<void> cacheUser(UserModel? user) async {
    if (user == null) {
      throw CacheException(errorMessage: "No user to cache");
    }
    final jsonString = jsonEncode(user.toJson());
    await getIt<CacheHelper>().saveData(key: "UserCache", value: jsonString);
  }

  // اقرأ المستخدم من الكاش وأعد UserModel; إن لم يكن موجود أو تالف -> رمي CacheException
  Future<UserModel> getUserFromCache() async {
    final jsonString = await getIt<CacheHelper>().getData(key: "UserCache");
    if (jsonString == null || (jsonString is String && jsonString.isEmpty)) {
      throw CacheException(errorMessage: "No Cached User");
    }

    try {
      final decoded = jsonDecode(jsonString);
      if (decoded is Map<String, dynamic>) {
        // Important: fromJson يجب أن تكون مرنة كما ناقشنا سابقاً
        return UserModel.fromJson(decoded);
      } else {
        // أحيانًا يُخزن كـ List أو String خاطئ
        throw CacheException(errorMessage: "Cached user has invalid format");
      }
    } catch (e) {
      // المسار هنا يعني أن الكاش تالف أو toJson/fromJson غير متوافقين
      throw CacheException(errorMessage: "Failed to parse cached user: $e");
    }
  }

  // (اختياري) مسح الكاش
  Future<void> clearUserCache() async {
    await getIt<CacheHelper>().removeData(key: "UserCache");
  }
}
