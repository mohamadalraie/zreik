import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/data/apis/booking/booking_cost_api.dart';
import 'package:zreiq/data/models/book_a_trip_model.dart';
import 'package:zreiq/data/stripe_payment/stripe_payment.dart';

import '../../../../../business_logic/cubit/book_a_trip/book_a_trip_cubit.dart';
import '../../../../../constants/my_colors.dart';

class PayForBookingScreen extends StatefulWidget {
  PayForBookingScreen(
      {super.key, required this.passengers, required this.tripId});

  final List<Passengers> passengers;
  final int tripId;

  @override
  State<PayForBookingScreen> createState() => _PayForBookingScreenState();
}

class _PayForBookingScreenState extends State<PayForBookingScreen> {
  int cost = 0;
  bool loading = true;

  Future<dynamic> getCost() async {
    cost = await BookingCostApi().bookingCostApi(
        bookATripRequestModel:
            BookATripRequestModel(passengers: widget.passengers),
        tripId: widget.tripId);

    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: const Text(
          "الدفع للحجز",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, fontFamily: "cairo"),
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                children: [
                  MaterialButton(
                    color: MyColors.myYellow,
                    onPressed: () {
                      print(cost);
                      StripePayment.makePayment(amount: 20, currency: 'USD');
                      print(cost + cost);
                      setState(() {});
                    },
                    child: const Text(
                      'pay',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: "cairo",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      '$cost',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
