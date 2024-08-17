import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:zreiq/data/models/my_trip_model.dart';

import '../../constants/shared_preferences.dart';
import '../../constants/strings.dart';


class ShowMyReservationApi {
  Future<dynamic> showMyReservationapi() async {
    var headers = {
      'Accept': 'application/json',

      'Authorization': 'Bearer ${Prefs.getToken()}',
    };
    var dio = Dio();
    String url = '${baseUrl}showMyBookings';
    var response = await dio.request(
      url,
      options: Options(
        method: 'GET',
        headers: headers,
        validateStatus: (statusCode) {
          if (statusCode == null) {
            return false;
          }
          if (statusCode == 401) {
            return true;
          } else {
            return statusCode >= 200 && statusCode < 300;
          }
        },
      ),
    );
    if (response.statusCode == 200) {
      print(json.encode(response.data));
      return MyTripModel.fromJson(response.data);
    } else {
      print(response.statusMessage);
    }
  }
}
