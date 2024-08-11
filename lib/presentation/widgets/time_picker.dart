import 'package:flutter/material.dart';

Future<DateTime> selectDate(
    {required BuildContext context,
    DateTime? first,
    DateTime? last,
    DateTime? inital}) async {
  DateTime? selected = await showDatePicker(
      locale: const Locale("ar", "AR"),
      currentDate: DateTime.now(),
      textDirection: TextDirection.rtl,
      initialDate: inital??DateTime.now(),
      context: context,
      firstDate: first ?? DateTime.now(),
      lastDate: last ??
          DateTime(
            DateTime.now().year + 1,
          ));

  return selected ?? DateTime.now();
}
