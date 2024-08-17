import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/data/apis/booking/book_a_trip_api.dart';
import 'package:zreiq/data/apis/booking/booking_cost_api.dart';
import 'package:zreiq/data/models/book_a_trip_model.dart';
import 'package:zreiq/data/stripe_payment/stripe_payment.dart';

import '../../../../../business_logic/cubit/book_a_trip/book_a_trip_cubit.dart';
import '../../../../../constants/my_colors.dart';
import '../../../../../constants/validate_funcs.dart';
import '../../../../../data/stripe_payment/stripe_mazen.dart';

class PayForBookingScreen extends StatefulWidget {
  PayForBookingScreen(
      {super.key,
      required this.passengers,
      required this.tripId,
      required this.ticketCost});

  final List<Passengers> passengers;
  final int tripId;
  final int ticketCost;

  @override
  State<PayForBookingScreen> createState() => _PayForBookingScreenState();
}

class _PayForBookingScreenState extends State<PayForBookingScreen> {
  int cost = 0;
  bool loading = true;
  TextEditingController numberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  var formKey = GlobalKey<FormState>();

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
      // resizeToAvoidBottomInset: false,
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
          : DoubleBackToCloseApp(
              snackBar: const SnackBar(
                content: Text('ارجع للخلف مرة أخرى للعودة إلى الصفحة الرئيسية'),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Table(
                      border: TableBorder.all(color: MyColors.myLightGrey),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        const TableRow(
                          decoration: BoxDecoration(color: MyColors.myYellow),
                          children: [
                            TableCell(
                              child: Center(
                                child: Text('سعر التذكرة الواحدة'),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text('عدد الركاب'),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text('السعر الإجمالي'),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Center(
                                child: Text(
                                  '${widget.ticketCost}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                  '${widget.passengers.length}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                  '$cost',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Table(
                      border: TableBorder.all(color: MyColors.myLightGrey),
                      children: [
                        TableRow(
                          children: [
                            const TableCell(
                              child: Center(
                                child: Text(
                                  'السعر بعد الخصومات:',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                  '$cost',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 8),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "معلومات بطاقة الدفع:",
                                  style: TextStyle(
                                      fontFamily: "cairo",
                                      color: MyColors.myLightGrey),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: MyColors.myLightGrey),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "رقم البطاقة:",
                                    style: TextStyle(
                                        fontFamily: "cairo",
                                        color: MyColors.myLightGrey),
                                  ),
                                  TextFormField(
                                    autovalidateMode: AutovalidateMode.always,
                                    controller: numberController,
                                    textDirection: TextDirection.rtl,
                                    maxLength: 16,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                    validator: (value) {
                                      if (value!.length != 16 ||
                                          value.isEmpty) {
                                        return "رقم بطاقة غير صالح";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "تاريخ انتهاء صلاحية البطاقة:",
                                    style: TextStyle(
                                        fontFamily: "cairo",
                                        color: MyColors.myLightGrey),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  right: 4, bottom: 2),
                                              child: Text(
                                                "الشهر",
                                                style: TextStyle(
                                                    fontFamily: "cairo",
                                                    color:
                                                        MyColors.myLightGrey),
                                              ),
                                            ),
                                            TextFormField(
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              controller: monthController,
                                              textDirection: TextDirection.rtl,
                                              maxLength: 2,
                                              keyboardType:
                                                  TextInputType.number,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "can't be empty";
                                                } else if (int.tryParse(
                                                            value)! >
                                                        12 ||
                                                    int.tryParse(value)! == 0) {
                                                  return "invalid year";
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  right: 4, bottom: 2),
                                              child: Text(
                                                "السنة",
                                                style: TextStyle(
                                                    fontFamily: "cairo",
                                                    color:
                                                        MyColors.myLightGrey),
                                              ),
                                            ),
                                            TextFormField(
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              controller: yearController,
                                              textDirection: TextDirection.rtl,
                                              maxLength: 4,
                                              keyboardType:
                                                  TextInputType.number,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "can't be empty";
                                                } else if (!value
                                                    .startsWith('20')) {
                                                  return "invalid year";
                                                } else if (int.tryParse(
                                                        value)! <
                                                    2024) {
                                                  return "invalid year";
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  right: 4, bottom: 2),
                                              child: Text(
                                                "cvv",
                                                style: TextStyle(
                                                    fontFamily: "cairo",
                                                    color:
                                                        MyColors.myLightGrey),
                                              ),
                                            ),
                                            TextFormField(
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              controller: cvvController,
                                              textDirection: TextDirection.rtl,
                                              maxLength: 3,
                                              keyboardType:
                                                  TextInputType.number,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'can\'t be empty';
                                                } else if (value.length != 3) {
                                                  return "invalid number";
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                              color: MyColors.myYellow,
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  print(cost);
                                  String? stripeToken = await PayWithStripe()
                                      .generateStripeToken(
                                          cvv: cvvController.text,
                                          number: numberController.text,
                                          month: monthController.text,
                                          year: yearController.text);
                                  if (stripeToken != null) {
                                    var isBooked = await BookATripApi()
                                        .bookATrip(
                                            model: BookATripRequestModel(
                                                passengers: widget.passengers,
                                                stripeToken: stripeToken),
                                            tripId: widget.tripId);
                                    if (isBooked == true) {
                                      Navigator.of(context)
                                          .pushReplacementNamed(homePage);
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const AlertDialog(
                                                title: Text(
                                                  'تمت عملية الحجز بنجاح',
                                                  style: TextStyle(
                                                      fontFamily: "cairo",
                                                      color: Colors.white),
                                                ),
                                                actions: [
                                                  Text(
                                                    '- تمت إضافة الحجز إلى قائمة حجوزاتي',
                                                    style: TextStyle(
                                                        fontFamily: "cairo",
                                                        color: MyColors
                                                            .myLightGrey,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ));
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: const Text(
                                                  'حدث خطأ ما',
                                                  style: TextStyle(
                                                      fontFamily: "cairo",
                                                      color: Colors.white),
                                                ),
                                                actions: [
                                                  Text(
                                                    '${isBooked.toString()}',
                                                    style: const TextStyle(
                                                        fontFamily: "cairo",
                                                        color: MyColors
                                                            .myLightGrey,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ));
                                    }
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => const AlertDialog(
                                        title: Text(
                                          'حدث خطأ ما',
                                          style: TextStyle(
                                              fontFamily: "cairo",
                                              color: Colors.white),
                                        ),
                                        actions: [
                                          Text(
                                            '- تأكد من اتصالك بالانترنت',
                                            style: TextStyle(
                                                fontFamily: "cairo",
                                                color: MyColors.myLightGrey,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '- تأكد من صحة رقم بطاقتك',
                                            style: TextStyle(
                                                fontFamily: "cairo",
                                                color: MyColors.myLightGrey,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '- تأكد من ادخال تاريخ الانتهاء بشكل صحيح',
                                            style: TextStyle(
                                                fontFamily: "cairo",
                                                color: MyColors.myLightGrey,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  // StripePayments.makePayment(amount: cost, currency: 'USD');

                                  setState(() {});
                                }
                              },
                              child: const Text(
                                'دفع',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: "cairo",
                                ),
                              ),
                            ),
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
