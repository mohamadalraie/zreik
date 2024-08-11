import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zreiq/constants/strings.dart';

import '../../constants/shared_preferences.dart';

class LogoutApi {
  Future logout() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': Prefs.getToken()
    };
    var dio = Dio();
    var url = '${baseUrl}logout';

    var response = await dio.request(
      url,
      options: Options(
        method: 'POST',
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
      Prefs.setToken(null);
      return true;
    } else {
      if (response.data['message'] != null) {
        Fluttertoast.showToast(
            msg: response.data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }
}
