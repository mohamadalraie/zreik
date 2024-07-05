import 'package:flutter/material.dart';
import 'package:zreiq/presentation/screens/auth/login_screen.dart';
import 'package:zreiq/presentation/screens/home_screen.dart';
import 'package:zreiq/presentation/screens/on_board_screen.dart';

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
    }
    return null;
  }
}
