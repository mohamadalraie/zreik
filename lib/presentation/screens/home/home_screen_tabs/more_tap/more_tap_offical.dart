import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/data/apis/auth/logout_api.dart';
import 'package:zreiq/presentation/screens/auth/login_screen.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/more_tap/profile.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/more_tap/who_we_are.dart';

import 'my_ticket.dart';

class MoreTapOffical extends StatefulWidget {
  const MoreTapOffical({super.key});

  @override
  State<MoreTapOffical> createState() => _MoreTapOfficalState();
}


class _MoreTapOfficalState extends State<MoreTapOffical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image(
              height: 300,
              fit: BoxFit.cover,
              image: AssetImage("assets/images/12.png"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 350),
            height: myScreenHeight - 300,
            width: myScreenWidth,
            decoration: const BoxDecoration(
              color: MyColors.myGrey,
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  },
                  child: Container(
                    height: 60,
                    width: myScreenWidth * 0.95,
                    decoration: BoxDecoration(
                      color: MyColors.myYellow,
                      borderRadius: BorderRadius.circular(33),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 40),
                        Icon(
                          Icons.person,
                          size: 50,
                          color: MyColors.myBlack,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "الملف الشخصي",
                          style: TextStyle(
                              color: MyColors.myBlack,
                              fontSize: 25,
                              fontFamily: "cairo"),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  WhoWeAre()));
                  },
                  child: Container(
                    height: 60,
                    width: myScreenWidth * 0.95,
                    decoration: BoxDecoration(
                      color: MyColors.myYellow,
                      borderRadius: BorderRadius.circular(33),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 47),
                        Icon(Icons.help_outline_outlined,
                            size: 40, color: MyColors.myBlack),
                        SizedBox(width: 20),
                        Text(
                          "من نحن",
                          style: TextStyle(
                              color: MyColors.myBlack,
                              fontSize: 25,
                              fontFamily: "cairo"),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    LogoutApi().logout();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  },
                  child: Container(
                    height: 60,
                    width: myScreenWidth * 0.95,
                    decoration: BoxDecoration(
                      color: MyColors.myYellow,
                      borderRadius: BorderRadius.circular(33),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 50),
                        Icon(Icons.logout,
                            size: 30, color: MyColors.myBlack),
                        SizedBox(width: 20),
                        Text(
                          "تسجيل الخروج",
                          style: TextStyle(
                              color: MyColors.myBlack,
                              fontSize: 25,
                              fontFamily: "cairo"),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
