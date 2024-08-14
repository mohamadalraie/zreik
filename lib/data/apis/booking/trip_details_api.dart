import 'package:dio/dio.dart';
import 'package:zreiq/data/models/trip_details_model.dart';
import 'package:zreiq/data/models/trips_by_date_model.dart';

import '../../../constants/shared_preferences.dart';
import '../../../constants/strings.dart';

class TripDetailsApi {
  Future<dynamic> getTripDetails(Trip trip) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Prefs.getToken()}'
    };
    var dio = Dio();
    String url = '${baseUrl}showDetailsTrip/${trip.id}';

    var response = await dio.request(
      url,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print(response.data.toString());
      return TripDetailsModel.fromJson(response.data);
    } else {
      print(response.data.toString());
      print(response.statusMessage);
    }
  }
}
