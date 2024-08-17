import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';
import 'package:zreiq/data/models/trips_by_date_model.dart';
import '../../constants/strings.dart';
import '../../data/models/my_trip_model.dart';

Widget travel11({required Data data, required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      decoration: BoxDecoration(
          color: MyColors.myLightGrey, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            data.trip!.date!.substring(0, 10),
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
                        data.trip!.startTrip!.substring(11, 16),
                        style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                          fontFamily: "cairo",
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
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
                        data.trip!.fromTo!.source!,
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
                        data.trip!.tripType!.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                          fontFamily: "cairo",
                          color: MyColors.myYellow,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                        "${data.chargeId} ل.س",
                        style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                          fontFamily: "cairo",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      const Text(
                        "حالة الرحلة",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                          fontFamily: "cairo",
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 80,
                        color: MyColors.myYellow,
                        child: Center(
                          child: Text(
                            "${data.trip!.status}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 16,
                              fontFamily: "cairo",
                              color: Colors.white,
                            ),
                          ),
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
                        data.trip!.endTrip!.substring(11, 16),
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
                        data.trip!.fromTo!.destination!,
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

        ],
      ),
    ),
  );
}
