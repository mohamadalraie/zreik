import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zreiq/business_logic/cubit/trip_details/trip_details_cubit.dart';
import 'package:zreiq/business_logic/cubit/trips_by_date/trips_by_date_cubit.dart';
import 'package:zreiq/data/apis/trip_details_api.dart';
import 'package:zreiq/data/models/book_a_trip_model.dart';
import 'package:zreiq/data/models/trip_details_model.dart';
import 'package:zreiq/data/models/trips_by_date_model.dart';
import 'package:zreiq/data/repository/trip_detail_repo.dart';
import 'package:zreiq/data/repository/trips_by_date_repo.dart';
import 'package:zreiq/presentation/screens/auth/AccountConfirmation_screen.dart';
import 'package:zreiq/presentation/screens/auth/login_screen.dart';
import 'package:zreiq/presentation/screens/auth/register_screen.dart';
import 'package:zreiq/presentation/screens/home/home_screen.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/home_tap_content/booking_screen.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/more_tap/more_tap_offical.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/more_tap/profile.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/more_tap/profile_edit.dart';
import 'package:zreiq/presentation/screens/home/travel_search_result_screen.dart';
import 'package:zreiq/presentation/screens/on_board_screen.dart';
import 'package:zreiq/presentation/screens/splash_screen.dart';
import 'package:zreiq/presentation/widgets/booking_form.dart';

import 'constants/strings.dart';
import 'data/apis/trips_by_date_api.dart';

class AppRouter {
  late TripDetailsRepo tripDetailsRepo;
  late TripDetailsCubit tripDetailsCubit;

  AppRouter() {
    tripDetailsRepo = TripDetailsRepo(TripDetailsApi());
    tripDetailsCubit = TripDetailsCubit(tripDetailsRepo);
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
        return MaterialPageRoute(builder: (_) => AccountconfirmationScreen());

      case moreTabOffical:
        return MaterialPageRoute(builder: (_) => MoreTapOffical());

      case profile:
        return MaterialPageRoute(builder: (_) => Profile());




      case bookingScreen:
        final Trip trip = settings.arguments as Trip;

        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => tripDetailsCubit,
                  child: BookingScreen(
                    trip: trip,
                  ),
                ));

      case travelSearchResultsScreen:
        return MaterialPageRoute(builder: (_) => TravelSearchResultScreen());
    }
    return null;
  }
}
