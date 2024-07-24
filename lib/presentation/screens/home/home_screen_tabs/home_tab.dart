import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/presentation/widgets/drop_down_button.dart';

import '../../../../constants/my_colors.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<String> items = ["دمشق", "حلب", "اللاذقية"];

  String? fromSelectedValue, toSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.myYellow,
        title: const Text(
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
              icon: const Icon(
                CupertinoIcons.bell_fill,
                size: 26,
              ))
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: MyColors.myYellow,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "من :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "cairo"),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          MyDropButton(
                              items: items,
                              selectedValue: fromSelectedValue,
                              onChange: (String? value) {
                                // TODO change setState to bloc
                                setState(() {
                                  fromSelectedValue = value;
                                });
                              })
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            "إلى :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "cairo"),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          MyDropButton(
                              items: items,
                              selectedValue: toSelectedValue,
                              onChange: (String? value) {
                                // TODO change setState to bloc
                                setState(() {
                                  toSelectedValue = value;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
