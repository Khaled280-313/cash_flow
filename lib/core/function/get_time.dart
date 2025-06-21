import 'package:flutter/material.dart';

Future<TimeOfDay?> getTime(BuildContext context, TimeOfDay selectedTime) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: selectedTime,
    // إعدادات إضافية (اختيارية)
    initialEntryMode: TimePickerEntryMode.input,
    // الوضع الابتدائي
    // وضع اختيار الوقت
    cancelText: 'إلغاء', // نص الزر الملغي
    confirmText: 'تأكيد',
    // نص الزر المؤكد
  );

  if (picked != null && picked != selectedTime) {
    // إذا تم اختيار وقت جديد، قم بتحديث الحالة
    selectedTime = picked;
  }
  print(selectedTime);
  return selectedTime;
}
