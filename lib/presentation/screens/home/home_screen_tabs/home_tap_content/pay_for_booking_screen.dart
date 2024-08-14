import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zreiq/data/models/book_a_trip_model.dart';

import '../../../../../business_logic/cubit/book_a_trip/book_a_trip_cubit.dart';

class PayForBookingScreen extends StatefulWidget {
  PayForBookingScreen(
      {super.key, required this.passengers, required this.tripId});

  final List<Passengers> passengers;
  final int tripId;

  @override
  State<PayForBookingScreen> createState() => _PayForBookingScreenState();
}

class _PayForBookingScreenState extends State<PayForBookingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final BookATripRequestModel bookATripRequestModel =
        BookATripRequestModel(passengers: widget.passengers);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<BookATripCubit>();
      cubit.book(bookATripRequestModel, widget.tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
