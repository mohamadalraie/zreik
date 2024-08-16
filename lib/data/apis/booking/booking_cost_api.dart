import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/data/models/book_a_trip_model.dart';

class BookingCostApi {
  Future<int> bookingCostApi(
      {required BookATripRequestModel bookATripRequestModel,
      required int tripId}) async {
    var headers = {'Accept': 'application/json'};

    var data = {"passengers": bookATripRequestModel.toJson()['passengers']};

    print(bookATripRequestModel.toJson()['passengers']);

    var dio = Dio();

    final String url = '${baseUrl}calcBookingCost/$tripId';

    var response = await dio.request(
      url,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      return response.data['data'];
    } else {
      print(response.statusMessage);
      return 0;
    }
  }
}
