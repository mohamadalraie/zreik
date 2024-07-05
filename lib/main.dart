import 'package:flutter/material.dart';
import 'package:zreiq/app_router.dart';
import 'package:zreiq/constants/strings.dart';

void main() {
  runApp( ZreiqApp(appRouter: AppRouter(),));
}

class ZreiqApp extends StatelessWidget {
  const ZreiqApp({super.key, required this.appRouter});
  
  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: splashScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
