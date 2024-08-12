import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zreiq/data/models/trips_by_date_model.dart';
import 'package:zreiq/presentation/widgets/bus.dart';
import 'package:zreiq/presentation/widgets/travel.dart';

import '../../../../../business_logic/cubit/trip_details/trip_details_cubit.dart';
import '../../../../../constants/my_colors.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({super.key, required this.trip});

  final Trip trip;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
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
        if (state is TripDetailsLoading || state is TripDetailsInitial) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is TripDetailsLoaded) {
          final tripDetails = state.tripDetailsModel;
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "تاريخ الرحلة: ",
                          style: const TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 16,
                            fontFamily: "cairo",
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          widget.trip.date!.substring(0, 9),
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
                          widget.trip.startTrip!.substring(10, 14),
                          style: const TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 16,
                            fontFamily: "cairo",
                            color: Colors.white,
                          ),
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
                          widget.trip.endTrip!.substring(10, 14),
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
                          widget.trip.fromTo!.source!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 16,
                            fontFamily: "cairo",
                            color: Colors.white,
                          ),
                        ),
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
                          widget.trip.fromTo!.destination!,
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
                        const Text(
                          "سعر الرحلة",
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                            fontFamily: "cairo",
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "${widget.trip.id} ل.س",
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
                        const Text(
                          "نوع الرحلة",
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
                            color: MyColors.myYellow,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                                child: Column(
                              children: [
                                Icon(
                                  Icons.directions_bus_rounded,
                                  color: MyColors.myGrey,
                                ),
                                SizedBox(height: 4),
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: [
                                const SizedBox(height: 4),
                                const Text(
                                  "المقاعد المتاحة",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '${tripDetails.data!.tripDetails![0].availableChair}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    fontFamily: "cairo",
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                            const Expanded(
                                child: Column(
                              children: [
                                Icon(
                                  Icons.directions_bus_rounded,
                                  color: MyColors.myGrey,
                                ),
                                SizedBox(height: 4),
                              ],
                            )),
                          ],
                        ),
                      ],
                    ),
                    Center(child: bus1([1, 22, 3])),
                  ],
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
