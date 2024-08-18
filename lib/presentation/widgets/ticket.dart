import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';
import 'package:zreiq/data/models/trips_by_date_model.dart';
import '../../constants/strings.dart';
import '../../data/models/show_tickets.dart';

Widget ticket({required Data trip,required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      decoration: BoxDecoration(
          color: MyColors.myLightGrey, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [

          Text(
            trip.ticketsNum.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 16,
              fontFamily: "cairo",
              color: Colors.white,
            ),
          ),
          Column(
            children: [
              const Icon(
                Icons.person,
                color: MyColors.myGrey,
                size: 10,
              ),

          const Text(
            "الإسم ",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 14,
              fontFamily: "cairo",
              color: Colors.black,
            ),
          ),
          Text(
            trip.firstName.toString()+" "+ trip.midName.toString()+" "+trip.lastName.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 16,
              fontFamily: "cairo",
              color: Colors.white,
            ),
          ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.calendar_month,
                color: MyColors.myGrey,
              ),
              const Text(
                "العمر",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  fontFamily: "cairo",
                  color: Colors.black,
                ),
              ),
              Text(
                trip.age.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                  fontFamily: "cairo",
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.calendar_month,
                color: MyColors.myGrey,
              ),
              const Text(
                "رقم الكرسي",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  fontFamily: "cairo",
                  color: Colors.black,
                ),
              ),
              Text(
                trip.chairNum.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                  fontFamily: "cairo",
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.calendar_month,
                color: MyColors.myGrey,
              ),
              const Text(
                "حالة التذكرة",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  fontFamily: "cairo",
                  color: Colors.black,
                ),
              ),
              Text(
                trip.isUsed.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                  fontFamily: "cairo",
                  color: Colors.white,
                ),
              ),
            ],
          ),

        ],
      ),
    ),
  );
}
