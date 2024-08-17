import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:zreiq/data/models/my_trip_model.dart';
import 'package:zreiq/data/models/profile_model.dart';

import '../../constants/shared_preferences.dart';
import '../../constants/strings.dart';


class ShowProfileApi {
  Future<dynamic> showProfileApi() async {
    var headers = {
      'Accept': 'application/json',

      'Authorization': 'Bearer ${Prefs.getToken()}',
    };
    var dio = Dio();
    String url = '${baseUrl}showProfile';
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
      return ProfileModel.fromJson(response.data);
    } else {
      print(response.statusMessage);
    }
  }
}
