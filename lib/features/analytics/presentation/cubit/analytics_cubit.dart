import 'package:flutter_bloc/flutter_bloc.dart';
import 'analytics_state.dart';

class AnalyticsCubit extends Cubit<AnalyticsState> {
  AnalyticsCubit() : super(AnalyticsInitial());
}
