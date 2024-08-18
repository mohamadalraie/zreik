import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:zreiq/constants/strings.dart';

import '../../../constants/shared_preferences.dart';
import '../../models/book_a_trip_model.dart';

class BookATripApi {
  Future<dynamic> bookATrip(
      {required BookATripRequestModel model, required int tripId}) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${Prefs.getToken()}'
    };
    var data = model.toJson();
    var dio = Dio();
    String url = '${baseUrl}bookingTrip/$tripId';
    print("booking ${model.toJson()}");
    var response = await dio.request(
      url,
      options: Options(
        method: 'POST',
        headers: headers,
        validateStatus: (statusCode) {
          if (statusCode == null) {
            return false;
          }
          if (statusCode == 409 || statusCode == 500) {
            return true;
          } else {
            return statusCode >= 200 && statusCode < 300;
          }
        },
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      return true;
    } else {
      print(response.statusMessage);
      return (response.data['msg']);
    }
  }
}
