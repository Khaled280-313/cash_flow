import 'package:cash_flow/core/database/cache/cache_helper.dart';
import 'package:cash_flow/core/services/servic_locator.dart';

void isOnBoardingVisited() {
  getIt<CacheHelper>().saveData(key: "isOnBoardingVisited", value: true);
}
void isAuthVisited() {
  getIt<CacheHelper>().saveData(key: "isAuthVisited", value: true);
}
