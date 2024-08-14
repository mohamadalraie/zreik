import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/presentation/widgets/toast.dart';

import '../../../constants/shared_preferences.dart';

class LoginAPI {
  Future<bool> login(String email, String password) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var data = {'email': email, 'password': password};

    var dio = Dio();
    var response = await dio.request(
      'http://192.168.1.105:8000/user/login',
      options: Options(
        method: 'POST',
        headers: headers,
        validateStatus: (statusCode) {
          if (statusCode == null) {
            return false;
          }
          if (statusCode == 422) {
            return true;
          } else {
            return statusCode >= 200 && statusCode < 300;
          }
        },
      ),
      data: data,
    );

    if (response.statusCode == 201) {
      print(json.encode(response.data));

      String token = response.data['data']['token'].toString();
      Prefs.setToken(token);
      print(response.data['data']['token'].toString());
      return true;
    } else {
      print(response.statusMessage);
      return false;
    }
  }
}
