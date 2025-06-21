import 'package:flutter/material.dart';

Future<DateTime?> getDate(BuildContext context, DateTime selectedDate) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    // إعدادات إضافية (اختيارية)
    initialEntryMode: DatePickerEntryMode.input, // الوضع الابتدائي
    initialDatePickerMode: DatePickerMode.day, // وضع اختيار التاريخ

    cancelText: 'إلغاء', // نص الزر الملغي
    confirmText: 'تأكيد',
    // نص الزر المؤكد
  );

  if (picked != null && picked != selectedDate) {
    // إذا تم اختيار تاريخ جديد، قم بتحديث الحالة
    selectedDate = picked;
  }

  return selectedDate;
}
