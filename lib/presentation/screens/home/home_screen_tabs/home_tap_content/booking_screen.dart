import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zreiq/data/models/book_a_trip_model.dart';
import 'package:zreiq/data/models/trips_by_date_model.dart';
import 'package:zreiq/presentation/widgets/booking_form.dart';
import '../../../../../business_logic/cubit/trip_details/trip_details_cubit.dart';
import '../../../../../constants/my_colors.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({super.key, required this.trip});

  final Trip trip;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  BookATripRequestModel bookATripRequestModel = BookATripRequestModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<TripDetailsCubit>();
      cubit.getDetails(trip: widget.trip);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripDetailsCubit, TripDetailsState>(
      builder: (context, state) {
        if (state is TripDetailsLoading ||
            state is TripDetailsInitial ||
            state is TripDetailsError) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is TripDetailsLoaded) {
          final tripDetails = state.tripDetailsModel;
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: MyColors.myYellow,
                centerTitle: true,
                title: const Text(
                  "حجز تذكرة",
                  style: TextStyle(
                    fontFamily: "cairo",
                    fontWeight: FontWeight.bold,
                    color: MyColors.myGrey,
                    fontSize: 20,
                  ),
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        // color: MyColors.myLightGrey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "معلومات الرحلة:",
                              style: TextStyle(
                                fontFamily: "cairo",
                                fontWeight: FontWeight.bold,
                                color: MyColors.myLightGrey,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.date_range,
                                  size: 18,
                                  color: MyColors.myYellow,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "تاريخ الرحلة: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: MyColors.myYellow,
                                  ),
                                ),
                                Text(
                                  widget.trip.date!.substring(0, 10),
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
                                  Icons.watch_later_outlined,
                                  size: 18,
                                  color: MyColors.myYellow,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "الانطلاق: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: MyColors.myYellow,
                                  ),
                                ),
                                Text(
                                  'الساعة ${widget.trip.startTrip!.substring(11, 16)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.watch_later_outlined,
                                  size: 18,
                                  color: MyColors.myYellow,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "الوصول: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: MyColors.myYellow,
                                  ),
                                ),
                                Text(
                                  'الساعة ${widget.trip.endTrip!.substring(11, 16)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 18,
                                  color: MyColors.myYellow,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "من مدينة: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: MyColors.myYellow,
                                  ),
                                ),
                                Text(
                                  widget.trip.fromTo!.source!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 18,
                                  color: MyColors.myYellow,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "إلى مدينة: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: MyColors.myYellow,
                                  ),
                                ),
                                Text(
                                  widget.trip.fromTo!.destination!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.eco_outlined,
                                  size: 18,
                                  color: MyColors.myYellow,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "نوع الرحلة: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: MyColors.myYellow,
                                  ),
                                ),
                                Text(
                                  widget.trip.bus!.type!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.directions_bus_outlined,
                                  size: 18,
                                  color: MyColors.myYellow,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "نوع الباص: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: MyColors.myYellow,
                                  ),
                                ),
                                Text(
                                  '${tripDetails.data!.tripDetails![0].bus!.busName} - ${tripDetails.data!.tripDetails![0].bus!.model}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.person_outline,
                                  size: 18,
                                  color: MyColors.myYellow,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "السائق: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: MyColors.myYellow,
                                  ),
                                ),
                                Text(
                                  'f',
                                  // '${tripDetails.data!.tripDetails![0].driver!.fname} ${tripDetails.data!.tripDetails![0].driver!.lname}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.attach_money_outlined,
                                  size: 18,
                                  color: MyColors.myYellow,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "سعر الرحلة: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: MyColors.myYellow,
                                  ),
                                ),
                                Text(
                                  "${widget.trip.id} ل.س",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.event_seat_outlined,
                                  size: 18,
                                  color: MyColors.myYellow,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "المقاعد المتاحة: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: MyColors.myYellow,
                                  ),
                                ),
                                Text(
                                  '${tripDetails.data!.tripDetails![0].availableChair} مقعد',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      BookingForm(
                        trip: tripDetails,
                        passengers: [],
                        tripId: widget.trip.id!,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Center(child: Text(state.toString()));
      },
    );
  }
}
