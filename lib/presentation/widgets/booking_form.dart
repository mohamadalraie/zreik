import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zreiq/app_router.dart';
import 'package:zreiq/business_logic/cubit/book_a_trip/book_a_trip_cubit.dart';
import 'package:zreiq/constants/my_colors.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/constants/validate_funcs.dart';
import 'package:zreiq/data/apis/booking/book_a_trip_api.dart';
import 'package:zreiq/data/models/book_a_trip_model.dart';
import 'package:zreiq/data/models/trip_details_model.dart';
import 'package:zreiq/data/repository/book_a_trip_repo.dart';
import 'package:zreiq/presentation/widgets/bus.dart';
import 'package:zreiq/presentation/widgets/toast.dart';
import 'book_confirm_dialog.dart';

class BookingForm extends StatefulWidget {
  BookingForm(
      {super.key,
      required this.trip,
      required this.passengers,
      required this.tripId});

  final TripDetailsModel trip;
  List<Passengers> passengers;
  final int tripId;

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  late Buses bus;

  var formKey = GlobalKey<FormState>();

  TextEditingController fNameController = TextEditingController();

  TextEditingController mNameController = TextEditingController();

  TextEditingController lNameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController chairController = TextEditingController();
  bool isAdded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bus = Buses(
        busChairsCount: widget.trip.data!.tripDetails![0].bus!.chairCount!,
        unavailableChairs: widget.trip.data!.unavailableChair!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        color: MyColors.myGrey,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: MyColors.myYellow,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 4.0),
                    child: Text(
                      "الراكب رقم ${widget.passengers.length + 1}",
                      style: const TextStyle(
                        fontFamily: "cairo",
                        fontWeight: FontWeight.bold,
                        color: MyColors.myGrey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        "معلومات الحجز:",
                        style: TextStyle(
                          fontFamily: "cairo",
                          fontWeight: FontWeight.bold,
                          color: MyColors.myLightGrey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0, top: 8, bottom: 4),
                  child: Text(
                    "الاسم الأول",
                    style: TextStyle(fontFamily: "cairo", color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: fNameController,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        hoverColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 5)),
                    validator: emptyValidator,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0, top: 8, bottom: 4),
                  child: Text(
                    "اسم الأب",
                    style: TextStyle(fontFamily: "cairo", color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: mNameController,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        hoverColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 5)),
                    validator: emptyValidator,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0, top: 8, bottom: 4),
                  child: Text(
                    "اسم العائلة",
                    style: TextStyle(fontFamily: "cairo", color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: lNameController,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        hoverColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 5)),
                    validator: emptyValidator,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0, top: 8, bottom: 4),
                  child: Text(
                    "العمر",
                    style: TextStyle(fontFamily: "cairo", color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: SizedBox(
                    width: myScreenWidth,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: ageController,
                              maxLength: 2,
                              textDirection: TextDirection.rtl,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hoverColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 5)),
                              validator: emptyValidator),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0, top: 8, bottom: 4),
                  child: Text(
                    "اختر مقعداً",
                    style: TextStyle(fontFamily: "cairo", color: Colors.white),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: Text(
                                      "مقعد محجوز",
                                      style: TextStyle(
                                          fontFamily: "cairo",
                                          color: Colors.white),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 4.0),
                                    child: Container(
                                      width: 26,
                                      height: 34,
                                      color: Colors.transparent,
                                      child: const Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Icon(CupertinoIcons.rectangle,
                                                size: 26, color: Colors.black),
                                            Icon(CupertinoIcons.app_fill,
                                                size: 30, color: Colors.red),
                                            Positioned(
                                              top: 19,
                                              child: Icon(
                                                CupertinoIcons.capsule_fill,
                                                color: Colors.red,
                                                size: 16,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: Text(
                                      "مقعد متاح",
                                      style: TextStyle(
                                          fontFamily: "cairo",
                                          color: Colors.white),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 4.0),
                                    child: Container(
                                      width: 26,
                                      height: 34,
                                      color: Colors.transparent,
                                      child: const Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Icon(CupertinoIcons.rectangle,
                                                size: 26,
                                                color: MyColors.myYellow),
                                            Icon(CupertinoIcons.app_fill,
                                                size: 30,
                                                color: MyColors.myLightGrey),
                                            Positioned(
                                              top: 19,
                                              child: Icon(
                                                CupertinoIcons.capsule_fill,
                                                color: MyColors.myYellow,
                                                size: 16,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: Text(
                                      "المقعد المختار",
                                      style: TextStyle(
                                          fontFamily: "cairo",
                                          color: Colors.white),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 4.0),
                                    child: Container(
                                      width: 26,
                                      height: 34,
                                      color: Colors.transparent,
                                      child: const Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Icon(CupertinoIcons.rectangle,
                                                size: 26,
                                                color: MyColors.myYellow),
                                            Icon(CupertinoIcons.app_fill,
                                                size: 30, color: Colors.green),
                                            Positioned(
                                              top: 19,
                                              child: Icon(
                                                CupertinoIcons.capsule_fill,
                                                color: MyColors.myYellow,
                                                size: 16,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(padding: const EdgeInsets.all(8), child: bus),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                            color: MyColors.myYellow,
                            onPressed: () {
                              if (bus.selectedChair == 0) {
                                flutterToast(msg: "عليك اختيار مقعدك");
                                chairController.text =
                                    bus.selectedChair.toString();
                              } else if (formKey.currentState!.validate()) {
                                Passengers p = Passengers(
                                    firstName: fNameController.text,
                                    midName: mNameController.text,
                                    lastName: lNameController.text,
                                    age: ageController.text,
                                    chairNum: chairController.text);

                                if (!isAdded) {
                                  isAdded = !isAdded;
                                  widget.passengers.add(p);
                                }

                                widget.trip.data!.unavailableChair!
                                    .add(bus.selectedChair);
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                    create: (context) => BookATripCubit(
                                        BookATripRepo(BookATripApi())),
                                    child: BookingForm(
                                      tripId: widget.tripId,
                                      passengers: widget.passengers,
                                      trip: widget.trip,
                                    ),
                                  ),
                                ));
                              }
                            },
                            child: const Text("إضافة مرافق",
                                style: TextStyle(
                                    fontFamily: "cairo", fontSize: 12))),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                            color: MyColors.myYellow,
                            onPressed: () {
                              if (bus.selectedChair == 0) {
                                flutterToast(msg: "عليك اختيار مقعدك");
                              } else if (formKey.currentState!.validate()) {
                                chairController.text =
                                    bus.selectedChair.toString();

                                Passengers p = Passengers(
                                    firstName: fNameController.text,
                                    midName: mNameController.text,
                                    lastName: lNameController.text,
                                    age: ageController.text,
                                    chairNum: chairController.text);

                                if (!isAdded) {
                                  isAdded = !isAdded;
                                  widget.passengers.add(p);
                                }

                                widget.passengers.last = p;

                                showDialog(
                                    context: context,
                                    builder: (context) => bookConfirmDialog(
                                        passengers: widget.passengers,
                                        tripId: widget.tripId,
                                        context: context));
                              }
                            },
                            child: const Text(
                              "حجز",
                              style:
                                  TextStyle(fontFamily: "cairo", fontSize: 12),
                            )),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "إلغاء",
                              style: TextStyle(
                                  fontFamily: "cairo",
                                  color: MyColors.myYellow,
                                  fontSize: 12),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
