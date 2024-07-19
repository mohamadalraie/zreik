import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: MyColors.myYellow,
          title: Text(
            "الرئيسية",
            style: TextStyle(
              fontFamily: "cairo",
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bell_fill,
                  size: 26,
                ))
          ],
        ),
        body: Column(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
              CupertinoIcons.house,
            )),
            BottomNavigationBarItem(
                icon: Icon(
              CupertinoIcons.bookmark_fill,
              semanticLabel: "home",
            )),
          ],
        ),
      ),
    );
  }
}
