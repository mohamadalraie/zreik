import 'package:flutter/material.dart';
import '../../app_router.dart';
import '../../constants/my_colors.dart';
import '../../constants/strings.dart';
import '../../data/models/book_a_trip_model.dart';

class BookConfirmDialog {
  bool isConfirmed = false;

  Widget bookConfirmDialog({
    required int ticketCost,
    required List<Passengers> passengers,
    required int tripId,
    required BuildContext context,
  }) {
    return AlertDialog(
      scrollable: true,
      title: const Text(
        "تأكيد عملية الحجز",
        style: TextStyle(fontFamily: "cairo", color: Colors.white),
      ),
      content: SingleChildScrollView(
        child: Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                passengersInfo(passengers[index], index),
            itemCount: passengers.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: MyColors.myYellow,
              onPressed: () {
                isConfirmed = true;
                Navigator.of(context).pop();
              },
              child: const Text(
                "تأكيد",
                style: TextStyle(fontFamily: "cairo", fontSize: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget passengersInfo(Passengers p, int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          child: Text(
            "الراكب رقم ${index + 1}",
            style: const TextStyle(
              fontFamily: "cairo",
              fontWeight: FontWeight.bold,
              color: MyColors.myYellow,
              fontSize: 14,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  "الاسم الأول: ",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    fontFamily: "cairo",
                    color: MyColors.myYellow,
                  ),
                ),
                Text(
                  p.firstName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    fontFamily: "cairo",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  "الاسم الثاني: ",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    fontFamily: "cairo",
                    color: MyColors.myYellow,
                  ),
                ),
                Text(
                  p.midName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    fontFamily: "cairo",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  "اسم العائلة: ",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    fontFamily: "cairo",
                    color: MyColors.myYellow,
                  ),
                ),
                Text(
                  p.lastName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    fontFamily: "cairo",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  "العمر: ",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    fontFamily: "cairo",
                    color: MyColors.myYellow,
                  ),
                ),
                Text(
                  p.age!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    fontFamily: "cairo",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  "رقم المقعد: ",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    fontFamily: "cairo",
                    color: MyColors.myYellow,
                  ),
                ),
                Text(
                  p.chairNum!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    fontFamily: "cairo",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 4),
          child: Container(
            width: double.infinity,
            height: 1,
            color: MyColors.myYellow,
          ),
        ),
      ],
    );
  }
}
