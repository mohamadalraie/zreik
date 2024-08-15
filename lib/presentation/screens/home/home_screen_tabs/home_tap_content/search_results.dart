import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zreiq/business_logic/cubit/search_for_trip/search_for_trip_cubit.dart';
import '../../../../../constants/my_colors.dart';
import '../../../../widgets/travel.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({
    super.key,
    required this.from,
    required this.to,
    this.date,
  });

  final String from;
  final String to;
  final String? date;

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.date == null
        ? WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            final cubit = context.read<SearchForTripCubit>();
            cubit.searchForTripsWithoutDate(from: widget.from, to: widget.to);
          })
        : WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            final cubit = context.read<SearchForTripCubit>();
            cubit.searchForTripsWithDate(
                from: widget.from, to: widget.to, date: widget.date);
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: const Text(
          'نتائج البحث',
          style: TextStyle(fontFamily: 'cairo'),
        ),
      ),
      body: tripsBlocBuilder(),
    );
  }

  Widget tripsBlocBuilder() {
    return BlocBuilder<SearchForTripCubit, SearchForTripState>(
        builder: (context, state) {
      if (state is SearchLoading ||
          state is SearchForTripInitial ||
          state is SearchError) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: CircularProgressIndicator()),
        );
      } else if (state is SearchLoaded) {
        final trips = state.tripsState;
        if (trips.data == null) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "لا توجد رحلات متاحة",
                  style: TextStyle(
                    fontFamily: "cairo",
                    fontWeight: FontWeight.bold,
                    color: MyColors.myLightGrey,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        }
        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
}
