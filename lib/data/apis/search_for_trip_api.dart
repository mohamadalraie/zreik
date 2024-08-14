import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:zreiq/constants/strings.dart';

import '../models/trips_by_date_model.dart';

class SearchForTripApi {
  Future<dynamic> searchWithoutDate(
      {required String source, required String destination}) async {
    var headers = {'Accept': 'application/json'};
    var data = FormData.fromMap({'source': source, 'destination': destination});

    var dio = Dio();
    const String url = '${baseUrl}searchAboutTrip';
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
      return TripsByDateModel.fromJson(response.data);
    } else {
      print(response.statusMessage);
    }
  }

  Future<dynamic> searchWithDate(
      {required String source,
      required String destination,
      required String date}) async {
    var headers = {'Accept': 'application/json'};
    var data = FormData.fromMap(
        {'source': source, 'destination': destination, 'date': date});

    var dio = Dio();
    const String url = '${baseUrl}searchAboutTrip';
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
      return TripsByDateModel.fromJson(response.data);
    } else {
      print(response.statusMessage);
    }
  }
}
