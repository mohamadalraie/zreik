import 'package:flutter/material.dart';
import 'package:zreiq/presentation/screens/auth/AccountConfirmation_screen.dart';
import 'package:zreiq/presentation/screens/auth/login_screen.dart';
import 'package:zreiq/presentation/screens/auth/register_screen.dart';
import 'package:zreiq/presentation/screens/home_screen.dart';
import 'package:zreiq/presentation/screens/on_board_screen.dart';
import 'package:zreiq/presentation/screens/splash_screen.dart';

import 'constants/strings.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case onBoardScreen:
        return MaterialPageRoute(builder: (_) => OnBoardScreen());

      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case splashScreen:
        return MaterialPageRoute(builder: (_)=> SplashScreen());

      case registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case accountConfirmScreen:
        return MaterialPageRoute(builder: (_) => AccountconfirmationScreen());
    }
    return null;
  }
}
