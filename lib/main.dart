import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:zreiq/app_router.dart';
import 'package:zreiq/constants/strings.dart';

import 'constants/my_colors.dart';
import 'constants/shared_preferences.dart';
import 'data/stripe_payment/stripe_keys.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = StripeKeys.publishableKey;
  Stripe.merchantIdentifier = 'mohamad';
  await Firebase.initializeApp();
  await Stripe.instance.applySettings();

  await Prefs.init();

  runApp(ZreiqApp(
    appRouter: AppRouter(),
  ));
}

class ZreiqApp extends StatelessWidget {
  const ZreiqApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''), // arabic, no country code
      ],
      title: 'Flutter Demo ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: MyColors.myYellow,
            onSecondary: MyColors.myGrey,
            onSurface: MyColors.myGrey,
            background: MyColors.myGrey),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: onBoardScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
