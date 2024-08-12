import 'package:dio/dio.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/data/models/trips_by_date_model.dart';

class TripsByDateApi {
  Future<dynamic> getTripsByDate(String date) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var data = {'date': date};
    var dio = Dio();
    String url = "${baseUrl}showTrips";

    var response = await dio.request(
      url,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(response.data['data'].length);

      return TripsByDateModel.fromJson(response.data);
    } else {
      print(response.statusMessage);
    }
  }
}
