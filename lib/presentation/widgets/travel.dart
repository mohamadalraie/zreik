import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';
import 'package:zreiq/data/models/trips_by_date_model.dart';

import '../../constants/strings.dart';

Widget travel(Trip trip, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      decoration: BoxDecoration(
          color: MyColors.myLightGrey, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            trip.date!.substring(0, 10),
            style: const TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 16,
              fontFamily: "cairo",
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  const Icon(
                    Icons.directions_bus_rounded,
                    color: MyColors.myGrey,
                  ),
                  const Text(
                    "الانطلاق",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                      fontFamily: "cairo",
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    trip.startTrip!.substring(11, 16),
                    style: const TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                      fontFamily: "cairo",
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  const Text(
                    "من مدينة",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                      fontFamily: "cairo",
                      color: MyColors.myYellow,
                    ),
                  ),
                  Text(
                    trip.fromTo!.source!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                      fontFamily: "cairo",
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                children: [
                  Text(
                    trip.bus!.type!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                      fontFamily: "cairo",
                      color: MyColors.myYellow,
                    ),
                  ),
                  const Text(
                    "سعر التذكرة",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                      fontFamily: "cairo",
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "${trip.id} ل.س",
                    style: const TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                      fontFamily: "cairo",
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                children: [
                  const Icon(
                    Icons.directions_bus_rounded,
                    color: MyColors.myGrey,
                  ),
                  const Text(
                    "الوصول",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                      fontFamily: "cairo",
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    trip.endTrip!.substring(11, 16),
                    style: const TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                      fontFamily: "cairo",
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "إلى مدينة",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                      fontFamily: "cairo",
                      color: MyColors.myYellow,
                    ),
                  ),
                  Text(
                    trip.fromTo!.destination!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                      fontFamily: "cairo",
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(bookingScreen, arguments: trip);
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                    // color: MyColors.myGrey,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: MyColors.myYellow, width: 1),
                  ),
                  child: const Text(
                    "احجز الآن",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyColors.myYellow,
                        fontSize: 16,
                        fontFamily: "cairo"),
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}
