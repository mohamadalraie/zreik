import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';
import 'package:zreiq/data/apis/show_my_reservation.dart';
import 'package:zreiq/presentation/widgets/show_trip.dart';
import '../../../../../constants/shared_preferences.dart';
import '../../../../../constants/strings.dart';
import '../../../../../data/models/my_trip_model.dart';

class MyReservationsTab extends StatefulWidget {
  const MyReservationsTab({super.key});

  @override
  State<MyReservationsTab> createState() => _MyReservationsTabState();
}

class _MyReservationsTabState extends State<MyReservationsTab> {
  List<Data> done = [];
  List<Data> waitandprogress = [];

  MyTripModel trip11 = MyTripModel();
  bool loading = true;

  Future<void> gettrip() async {
    done.clear();
    waitandprogress.clear();

    trip11 = await ShowMyReservationApi().showMyReservationapi();
    for (var trip in trip11.data!) {
      if (trip.trip!.status!.toLowerCase() == 'wait' ||
          trip.trip!.status!.toLowerCase() == 'progress') {
        waitandprogress.add(trip);
      } else if (trip.trip!.status!.toLowerCase() == 'done') {
        done.add(trip);
      }
    }
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettrip();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: r());
  }

  Widget r() {
    if (Prefs.getToken() == null || Prefs.getToken() == '') {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'عذرا عليك تسجيل الدخول أولا',
                style: TextStyle(
                  fontFamily: "cairo",
                  fontWeight: FontWeight.bold,
                  color: MyColors.myLightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              MaterialButton(
                color: MyColors.myYellow,
                onPressed: () {
                  Navigator.of(context).pushNamed(loginScreen);
                },
                child: const Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    fontFamily: "cairo",
                    fontWeight: FontWeight.bold,
                    color: MyColors.myLightGrey,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.myYellow,
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          toolbarHeight: 0,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "الحالية",
                icon: Icon(Icons.directions_bus),
              ),
              Tab(
                text: "السابقة",
                icon: Icon(Icons.update),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            loading
                ? Center(child: CircularProgressIndicator())
                : waitandprogress.isEmpty
                    ? const Center(
                        child: Text(
                          'لا يوجد لديك رحلات حالية',
                          style: TextStyle(
                              color: MyColors.myLightGrey,
                              fontSize: 14,
                              fontFamily: "cairo"),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: gettrip,
                        child: ListView.builder(
                            itemCount: waitandprogress.length,
                            itemBuilder: (context, i) {
                              return travel11(
                                  data: waitandprogress[i], context: context);
                            }),
                      ),
            loading
                ? const Center(child: CircularProgressIndicator())
                : done.isEmpty
                    ? const Center(
                        child: Text(
                          'لا يوجد لديك رحلات سابقة',
                          style: TextStyle(
                              color: MyColors.myLightGrey,
                              fontSize: 14,
                              fontFamily: "cairo"),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: gettrip,
                        child: ListView.builder(
                          itemCount: done.length,
                          itemBuilder: (context, i) {
                            return travel11(data: done[i], context: context);
                          },
                        ),
                      ),
          ],
        ),
      );
    }
  }
}
