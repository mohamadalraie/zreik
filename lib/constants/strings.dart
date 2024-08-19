import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String baseUrl = 'http://192.168.1.2:8000/user/';

//routes
const String homePage = '/homepage';
const String onBoardScreen = '/';
const String loginScreen = '/login';
const String registerScreen = '/register';
const String splashScreen = '/splash';
const String accountConfirmScreen = '/register/confirmRegister';
const String travelSearchResultsScreen =
    '/homepage/homeTap/travelsSearchResults';
const String bookingScreen = '/homepage/booking';
const String bookingForm = '/homepage/bookingForm';
const String moreTabOffical = '/homepage/moreTabOffical';
const String profile = '/homepage/moreTabOffical/profile';
const String profileEdit = '/homepage/moreTabOffical/profile/profileEdit';
const String payForBookScreen = '/homepage/bookingForm/payForBooking';
const String reservationTab = '/homepage/my_reservation_tab';

//screen dimensions
final double physicalHeight =
    WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height;
final double physicalWidth =
    WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;

final double devicePixelRatio =
    WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

final double myScreenHeight = physicalHeight / devicePixelRatio;
final double myScreenWidth = physicalWidth / devicePixelRatio;
