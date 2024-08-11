import 'package:zreiq/data/apis/trips_by_date_api.dart';
import 'package:zreiq/data/models/trips_by_date_model.dart';

class TripsByDateRepository {
  final TripsByDateApi tripsByDateApi;

  TripsByDateRepository(this.tripsByDateApi);

  Future<TripsByDateModel> getTripsByDate({required String date}) async {
    final trips = await tripsByDateApi.getTripsByDate(date);
    return trips;
  }
}
