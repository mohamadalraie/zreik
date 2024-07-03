import 'package:flutter/material.dart';
import 'package:zreiq/presentation/screens/home_screen.dart';

import 'constants/strings.dart';

class AppRouter {
Route? generateRoute (RouteSettings settings){
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (_) => HomeScreen());
      
  }
  return null;

}
}