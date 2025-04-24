import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../features/home/data/repositories/data.dart';
import '../utils/app_color.dart';

Widget getDateTitle(int index) {
  if (index >= dailyExpenses.length) return Text('');
  final date = dailyExpenses[index].date;

  // استخدم DateFormat من حزمة intl
  final formattedDate = DateFormat('MMM dd').format(date); // 17 Mar
  // أو:
  // final formattedDate = DateFormat('MMM dd').format(date); // Mar 17

  return Text(
    formattedDate,
    style: TextStyle(fontSize: 12, color: AppColor.primary),
  );
}