import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';
import 'package:zreiq/data/models/trips_by_date_model.dart';
import '../../constants/strings.dart';
import '../../data/models/show_tickets.dart';

Widget ticket({required Data trip, required BuildContext context}) {
  return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: MyColors.myLightGrey,
              image: DecorationImage(
                image: AssetImage('assets/images/14.png'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.05),
                  BlendMode.dstATop,
                ),
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  const Icon(
                    Icons.person_pin,
                    color: Colors.yellow,
                    size: 40,
                  ),
                  const SizedBox(height: 1),
                  Text(
                    trip.firstName.toString() +
                        " " +
                        trip.midName.toString() +
                        " " +
                        trip.lastName.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: "cairo",
                      color: MyColors.myBlack,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    trip.ticketsNum.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "cairo",
                      color: MyColors.myBlack,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    ":رقم التذكرة",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "cairo",
                      color: MyColors.myYellow,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      trip.chairNum.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontFamily: "cairo",
                        color: MyColors.myBlack,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      ":رقم الكرسي ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: "cairo",
                        color: MyColors.myYellow,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.place,
                      color: Colors.white70,
                      size: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      trip.age.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontFamily: "cairo",
                        color: MyColors.myBlack,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      ":العمر ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: "cairo",
                        color: MyColors.myYellow,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white70,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          )));
}
