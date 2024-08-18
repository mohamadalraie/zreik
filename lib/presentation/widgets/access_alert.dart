import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
import '../../constants/strings.dart';

void accessAlert(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('عذرا عليك تسجيل الدخول أولاً',
                style: TextStyle(color: Colors.white)),
            actions: [
              const SizedBox(
                height: 5,
              ),
              MaterialButton(
                color: MyColors.myYellow,
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(loginScreen);
                },
                child: const Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    fontFamily: "cairo",
                    fontWeight: FontWeight.bold,
                    color: MyColors.myLightGrey,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ));
}
