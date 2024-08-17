import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';
import 'package:zreiq/data/apis/show_my_reservation.dart';
import 'package:zreiq/presentation/widgets/show_trip.dart';
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
    trip11 = await ShowMyReservationApi().showMyReservationapi();
    for (var trip in trip11.data!) {
      if (trip.trip!.status!.toLowerCase() == 'wait' ||
          trip.trip!.status!.toLowerCase() == 'progress') {
        waitandprogress.add(trip);
      } else if (trip.trip!.status == 'done') {
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                : trip11.data == null || trip11.data!.isEmpty
                    ? Center(
                        child: Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyColors.myYellow),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: Center(
                              child: Text(
                                'لا يوجد لديك رحلات حالية',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: "cairo"),
                              ),
                            ),
                          ),
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
                ? Center(child: CircularProgressIndicator())
                : trip11.data == null || trip11.data!.isEmpty
                    ? Center(
                        child: Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyColors.myYellow),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: Center(
                              child: Text(
                                'لا يوجد لديك رحلات سابقة',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: "cairo"),
                              ),
                            ),
                          ),
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
      ),
    );
  }
}
