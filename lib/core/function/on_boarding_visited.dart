import 'package:cash_flow/core/cache/cache_helper.dart';
import 'package:cash_flow/core/services/servic_locator.dart';

void isOnBoardingVisited() {
  getIt<CacheHelper>().saveData(key: "isOnBoardingVisited", value: true);
}
