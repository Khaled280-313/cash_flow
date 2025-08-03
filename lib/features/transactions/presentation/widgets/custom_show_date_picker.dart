import 'package:cash_flow/core/utils/app_color.dart';
import 'package:cash_flow/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateChanged;

  const CustomDatePicker({
    super.key,
    required this.initialDate,
    required this.onDateChanged,
  });

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
      widget.onDateChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Format date as yyyy-MM-dd
    final formatted = DateFormat('yyyy-MM-dd').format(_selectedDate);
    return Row(
      spacing: 50,
      children: [
        ElevatedButton.icon(
          onPressed: _pickDate,
          icon: const Icon(Icons.calendar_today, color: AppColor.white),
          label: const Text(
            'Select Date',
            style: TextStyle(color: AppColor.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        const SizedBox(width: 16),
        Text(formatted,
            style: AppTextStyle.montserrat500Style16.copyWith(fontSize: 18)),
      ],
    );
  }
}
