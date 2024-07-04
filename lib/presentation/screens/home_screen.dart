import 'package:flutter/cupertino.dart';
import 'package:zreiq/constants/my_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'mohamad el malek',
      style: TextStyle(color: MyColors.myYellow),
    );
  }
}
