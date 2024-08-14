import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:zreiq/constants/strings.dart';

import '../../constants/shared_preferences.dart';

class AddAlertApi {
  Future<dynamic> addAlertApi({required String date}) async {
    print(date);
    var headers = {
      'Authorization': 'Bearer ${Prefs.getToken()}',
    };

    var data = {'fav_date': date};
    var dio = Dio();

    String url = '${baseUrl}addNotify';

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
    } else {
      print(response.statusMessage);
    }
  }
}
