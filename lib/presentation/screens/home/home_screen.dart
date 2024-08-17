import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zreiq/business_logic/cubit/trips_by_date/trips_by_date_cubit.dart';
import 'package:zreiq/constants/my_colors.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/home_tap_content/home_tab.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/more_tap/more_tap_offical.dart';
import 'package:zreiq/presentation/screens/home/home_screen_tabs/my_reservation_tab/my_reservations_tab.dart';
import '../../../constants/shared_preferences.dart';
import '../../../data/apis/trips_by_date_api.dart';
import '../../../data/repository/trips_by_date_repo.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late TripsByDateRepository tripsByDateRepository;
  late TripsByDateCubit tripsByDateCubit;

  late List<Widget> tabs;

  @override
  void initState() {
    super.initState();

    tripsByDateRepository = TripsByDateRepository(TripsByDateApi());
    tripsByDateCubit = TripsByDateCubit(tripsByDateRepository);

    tabs = [
      BlocProvider(
        create: (BuildContext context) => tripsByDateCubit,
        child: const HomeTab(),
      ),
      const MyReservationsTab(),
           const MoreTapOffical()
    ];
  }

  @override
  Widget build(BuildContext context) {
    print(Prefs.getToken());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: MyColors.myYellow,
          selectedFontSize: 14,
          unselectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house),
              label: "الرئيسية",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bookmark_fill),
              label: "حجوزاتي",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.ellipsis),
              label: "أخرى",
            ),
          ],
          onTap: (index) {
            // TODO: convert setState to bloc

            setState(() {});
            _currentIndex = index;
          },
        ),
      ),
    );
  }
}
