import 'package:zreiq/data/apis/booking/trip_details_api.dart';
import 'package:zreiq/data/models/trips_by_date_model.dart';

import '../models/trip_details_model.dart';

class TripDetailsRepo {
  final TripDetailsApi tripDetailsApi;

  TripDetailsRepo(this.tripDetailsApi);

  Future<TripDetailsModel> getTripDetails(Trip trip) async {
    final tripDetails = await tripDetailsApi.getTripDetails(trip);
    return tripDetails;
  }
}
