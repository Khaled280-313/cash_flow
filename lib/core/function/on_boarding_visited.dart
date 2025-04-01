  import 'package:cash_flow/core/cache/cache_helper.dart';

void isOnBoardingVisited() {
     CacheHelper().saveData(key: "isOnBoardingVisited", value: true);
  }