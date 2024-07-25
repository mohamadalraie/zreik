import 'package:flutter/material.dart';

Future<String> selectDate({
  required BuildContext context,
}) async {
  DateTime? selected = await showDatePicker(
      locale: const Locale("ar", "AR"),
      currentDate: DateTime.now(),
      textDirection: TextDirection.rtl,
      initialDate: DateTime.now(),
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(
        DateTime.now().year + 1,
      ));

  return selected == null
      ? DateTime.now().toString().split(" ")[0]
      : selected.toString().split(" ")[0];
}
