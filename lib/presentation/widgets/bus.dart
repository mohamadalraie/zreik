import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';

Widget busChair(bool isReserved, int chairNumber) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
    child: InkWell(
      child: Container(
        width: 26,
        height: 34,
        child: Stack(alignment: Alignment.center, children: [
          Icon(CupertinoIcons.rectangle,
              size: 26, color: isReserved ? Colors.black : MyColors.myYellow),
          Icon(CupertinoIcons.app_fill,
              size: 30, color: isReserved ? Colors.red : Colors.grey),
          Positioned(
            top: 19,
            child: Icon(
              CupertinoIcons.capsule_fill,
              color: isReserved ? Colors.red : MyColors.myYellow,
              size: 16,
            ),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              "$chairNumber",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ]),
      ),
      onTap: () {},
    ),
  );
}

Widget bus1(
  List<int> reservedChairs,
) {
  return Container(
      decoration: BoxDecoration(
          color: MyColors.myLightGrey,
          borderRadius: BorderRadius.circular(5),
          border: BorderDirectional()),
      height: 450,
      width: 136,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 4.0),
                    child: Icon(CupertinoIcons.smallcircle_fill_circle),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 4.0, bottom: 6.0),
                    child: SizedBox(
                      width: 26,
                      height: 34,
                      child: Stack(alignment: Alignment.center, children: [
                        Icon(CupertinoIcons.rectangle,
                            size: 26, color: Colors.black),
                        Icon(CupertinoIcons.app_fill,
                            size: 30, color: Colors.black),
                        Positioned(
                          top: 22,
                          child: Icon(
                            CupertinoIcons.rectangle_fill,
                            color: Colors.grey,
                            size: 14,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                color: Colors.black,
                height: 28,
                width: 4,
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  busChair(reservedChairs.contains(1), 1),
                  busChair(reservedChairs.contains(2), 2),
                  busChair(reservedChairs.contains(3), 3),
                  busChair(reservedChairs.contains(4), 4),
                  busChair(reservedChairs.contains(5), 5),
                  busChair(reservedChairs.contains(6), 6),
                  busChair(reservedChairs.contains(7), 7),
                  busChair(reservedChairs.contains(8), 8),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  busChair(reservedChairs.contains(27), 27),
                  busChair(reservedChairs.contains(25), 25),
                  busChair(reservedChairs.contains(23), 23),
                  busChair(reservedChairs.contains(21), 21),
                  busChair(reservedChairs.contains(19), 19),
                  busChair(reservedChairs.contains(17), 17),
                  busChair(reservedChairs.contains(15), 15),
                  busChair(reservedChairs.contains(13), 13),
                ],
              ),
              Column(
                children: [
                  busChair(reservedChairs.contains(28), 28),
                  busChair(reservedChairs.contains(26), 26),
                  busChair(reservedChairs.contains(24), 24),
                  busChair(reservedChairs.contains(22), 22),
                  busChair(reservedChairs.contains(20), 20),
                  busChair(reservedChairs.contains(18), 18),
                  busChair(reservedChairs.contains(16), 16),
                  busChair(reservedChairs.contains(14), 14),
                ],
              ),
            ],
          ),
          Row(
            children: [
              busChair(reservedChairs.contains(9), 9),
              busChair(reservedChairs.contains(10), 10),
              busChair(reservedChairs.contains(11), 11),
              busChair(reservedChairs.contains(12), 12),
            ],
          ),
        ],
      ));
}
