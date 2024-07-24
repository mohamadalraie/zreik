import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';
import 'package:zreiq/presentation/screens/auth/register_screen.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/home_tab.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/my_reservations_tab.dart';

import '../auth/login_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> tabs = [HomeTab(), MyReservationsTab()];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: MyColors.myYellow,
          selectedFontSize: 14,
          unselectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house),
              label: "الرئيسية",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bookmark_fill),
              label: "حجوزاتي",
            ),
          ],
          onTap: (index) {
            // TODO: convert setState to bloc

            setState(() {});
            _currentIndex = index;
          },
        ),
      ),
    );
  }
}
