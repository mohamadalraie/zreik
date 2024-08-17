import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zreiq/business_logic/cubit/trip_details/trip_details_cubit.dart';
import 'package:zreiq/data/apis/booking/trip_details_api.dart';
import 'package:zreiq/data/models/book_a_trip_model.dart';
import 'package:zreiq/data/models/trips_by_date_model.dart';
import 'package:zreiq/data/repository/trip_detail_repo.dart';
import 'package:zreiq/presentation/screens/auth/AccountConfirmation_screen.dart';
import 'package:zreiq/presentation/screens/auth/login_screen.dart';
import 'package:zreiq/presentation/screens/auth/register_screen.dart';
import 'package:zreiq/presentation/screens/home/home_screen.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/home_tap_content/booking_screen.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/home_tap_content/pay_for_booking_screen.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/more_tap/more_tap_offical.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/more_tap/profile.dart';
import 'package:zreiq/presentation/screens/on_board_screen.dart';
import 'package:zreiq/presentation/screens/splash_screen.dart';
import 'business_logic/cubit/book_a_trip/book_a_trip_cubit.dart';
import 'constants/strings.dart';
import 'data/apis/booking/book_a_trip_api.dart';
import 'data/repository/book_a_trip_repo.dart';

class AppRouter {
  late TripDetailsRepo tripDetailsRepo;
  late TripDetailsCubit tripDetailsCubit;

  late BookATripCubit bookATripCubit;
  late BookATripRepo bookATripRepo;

  AppRouter() {
    tripDetailsRepo = TripDetailsRepo(TripDetailsApi());
    tripDetailsCubit = TripDetailsCubit(tripDetailsRepo);

    bookATripRepo = BookATripRepo(BookATripApi());
    bookATripCubit = BookATripCubit(bookATripRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case onBoardScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardScreen());

      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case accountConfirmScreen:
        return MaterialPageRoute(builder: (_) => AccountConfirmationScreen());

      case bookingScreen:
        final Trip trip = settings.arguments as Trip;

        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: tripDetailsCubit,
                  child: BookingScreen(
                    trip: trip,
                  ),
                ));

      case payForBookScreen:
        final BookingArguments bookingArguments =
            settings.arguments as BookingArguments;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: bookATripCubit,
            // create: (context) => bookATripCubit,
            child: PayForBookingScreen(
              ticketCost: bookingArguments.ticketCost,
              tripId: bookingArguments.tripId,
              passengers: bookingArguments.passengers,
            ),
          ),
        );

      case moreTabOffical:
        return MaterialPageRoute(builder: (_) => MoreTapOffical());

      case profile:
        return MaterialPageRoute(builder: (_) => Profile());
    }
    return null;
  }
}

class BookingArguments {
  final List<Passengers> passengers;
  final int tripId;
  final int ticketCost;

  BookingArguments(this.passengers, this.tripId, this.ticketCost);
}
