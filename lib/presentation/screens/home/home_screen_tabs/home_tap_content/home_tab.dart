import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zreiq/business_logic/cubit/trips_by_date/trips_by_date_cubit.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/presentation/widgets/drop_down_button.dart';
import 'package:zreiq/presentation/widgets/travel.dart';
import '../../../../../constants/my_colors.dart';
import '../../../../widgets/time_picker.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<String> items = ["حمص", "دمشق", "حلب", "اللاذقية"];

  String? fromSelectedValue, toSelectedValue;
  DateTime selectedDate = DateTime.now();
  DateTime travelsListDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<TripsByDateCubit>();
      cubit.getTrips(date: travelsListDate.toString().split(" ")[0]);
    });
  }

  Widget tripsBlocBuilder() {
    return BlocBuilder<TripsByDateCubit, TripsByDateState>(
        builder: (context, state) {
      if (state is TripsLoading ||
          state is TripsByDateInitial ||
          state is TripsError) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: CircularProgressIndicator()),
        );
      } else if (state is TripsLoaded) {
        final trips = state.tripsState;
        if (trips.data == null) {
          return const Center(
            child: Text(
              "there is no tomorrow",
              style: TextStyle(
                fontFamily: "cairo",
                fontWeight: FontWeight.bold,
                color: MyColors.myLightGrey,
                fontSize: 22,
              ),
            ),
          );
        }
        return ListView.builder(
            shrinkWrap: true,
            itemCount: trips.data!.length,
            itemBuilder: (context, index) {
              final trip = trips.data![index];
              return travel(trip, context);
            });
      }
      return Center(
        child: Text(state.toString()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const SizedBox(),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.myYellow,
        title: const Text(
          "الرئيسية",
          style: TextStyle(
            fontFamily: "cairo",
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.bell_fill,
                size: 26,
              ))
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: MyColors.myGrey,
              automaticallyImplyLeading: false,
              floating: true,
              expandedHeight: myScreenHeight * 0.25 + 118,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          color: MyColors.myYellow,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "ابحث الآن عن رحلتك :",
                                    style: TextStyle(
                                        shadows:
                                            CupertinoContextMenu.kEndBoxShadow,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontFamily: "cairo"),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "من :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: "cairo"),
                                    ),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    myDropButton(
                                        items: items,
                                        selectedValue: fromSelectedValue,
                                        onChange: (String? value) {
                                          // TODO change setState to bloc
                                          setState(() {
                                            fromSelectedValue = value;
                                          });
                                        }),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 28,
                                      color: MyColors.myGrey,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Text(
                                      "إلى :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: "cairo"),
                                    ),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    myDropButton(
                                        items: items,
                                        selectedValue: toSelectedValue,
                                        onChange: (String? value) {
                                          // TODO change setState to bloc
                                          setState(() {
                                            toSelectedValue = value;
                                          });
                                        }),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    const Icon(
                                      Icons.location_on,
                                      size: 28,
                                      color: MyColors.myGrey,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "التاريخ :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: "cairo"),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: InkWell(
                                          onTap: () async {
                                            // TODO change to bloc
                                            selectedDate = await selectDate(
                                                context: context);
                                            setState(() {});
                                          },
                                          child: Container(
                                              alignment: Alignment.centerRight,
                                              height: myScreenHeight * 0.05,
                                              decoration: BoxDecoration(
                                                color: MyColors.myGrey,
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                border: Border.all(
                                                  color: Colors.black26,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 14.0),
                                                child: Text(
                                                  selectedDate
                                                      .toString()
                                                      .split(" ")[0],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: MyColors.myYellow,
                                                      fontSize: 16,
                                                      fontFamily: "cairo"),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    const Icon(
                                      Icons.date_range,
                                      size: 28,
                                      color: MyColors.myGrey,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 28, right: 62),
                                  child: InkWell(
                                    onTap: () async {
                                      // TODO change to bloc
                                      selectedDate =
                                          await selectDate(context: context);
                                      setState(() {});
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: myScreenHeight * 0.05,
                                        decoration: BoxDecoration(
                                          // color: MyColors.myGrey,
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          border: Border.all(
                                              color: Colors.black26, width: 2),
                                        ),
                                        child: const Text(
                                          "بحث",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: MyColors.myBlack,
                                              fontSize: 16,
                                              fontFamily: "cairo"),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            left: 10,
                            top: myScreenHeight * 0.092,
                            child: const Icon(CupertinoIcons.arrow_down,
                                color: MyColors.myGrey)),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 2.0),
                      child: Text(
                        "الرحلات المتاحة",
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                            fontFamily: "cairo",
                            color: Colors.white,
                            shadows: CupertinoContextMenu.kEndBoxShadow),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: MyColors.myLightGrey,
                            borderRadius: BorderRadius.circular(14)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(CupertinoIcons.left_chevron),
                                  onPressed: () {
                                    // todo bloc instead of setState

                                    if (travelsListDate.day >
                                        DateTime.now().day) {
                                      setState(() {});
                                      travelsListDate = travelsListDate
                                          .subtract(const Duration(days: 1));
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((timeStamp) {
                                        final cubit =
                                            context.read<TripsByDateCubit>();
                                        cubit.getTrips(
                                            date: travelsListDate
                                                .toString()
                                                .split(" ")[0]);
                                      });
                                    }
                                  },
                                ),
                                Expanded(
                                    child: TextButton(
                                  child: Text(
                                    travelsListDate.toString().split(" ")[0],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontFamily: "cairo",
                                        color: Colors.white),
                                  ),
                                  onPressed: () async {
// TODO change to bloc
                                    travelsListDate =
                                        await selectDate(context: context);
                                    setState(() {});
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((timeStamp) {
                                      final cubit =
                                          context.read<TripsByDateCubit>();
                                      cubit.getTrips(
                                          date: travelsListDate
                                              .toString()
                                              .split(" ")[0]);
                                    });
                                  },
                                )),
                                IconButton(
                                  icon:
                                      const Icon(CupertinoIcons.right_chevron),
                                  onPressed: () {
                                    // todo bloc instead of setState
                                    setState(() {});
                                    travelsListDate = travelsListDate
                                        .add(const Duration(days: 1));
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((timeStamp) {
                                      final cubit =
                                          context.read<TripsByDateCubit>();
                                      cubit.getTrips(
                                          date: travelsListDate
                                              .toString()
                                              .split(" ")[0]);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => tripsBlocBuilder(),
                  childCount: 1),
            )
          ],
        ),
      ),
    );
  }
}
