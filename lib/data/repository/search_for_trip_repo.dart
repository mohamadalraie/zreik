import 'package:zreiq/data/apis/search_for_trip_api.dart';

import '../models/trips_by_date_model.dart';

class SearchForTripRepo {
  final SearchForTripApi searchForTripApi;

  SearchForTripRepo(this.searchForTripApi);

  Future<TripsByDateModel> search(
      {String? date, required String from, required String to}) async {
    TripsByDateModel trips;
    date == null
        ? trips = await searchForTripApi.searchWithoutDate(
            source: from, destination: to)
        : trips = await searchForTripApi.searchWithDate(
            source: from, destination: to, date: date);
    return trips;
  }
}
