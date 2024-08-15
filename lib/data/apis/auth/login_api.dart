import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:zreiq/data/models/login_model.dart';
import '../../../constants/shared_preferences.dart';
import '../../../constants/strings.dart';

class LoginApi {
  Future<bool> login({required LoginRequestModel loginRequestModel}) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var data = loginRequestModel.toJson();
    var dio = Dio();
    String url = '${baseUrl}logout';
    var response = await dio.request(
      url,
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
      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(response.data);

      var aa = loginResponseModel.data!.token;
      Prefs.setToken(aa);
      return true;
    } else {
      print(response.statusMessage);
      return false;
    }
  }
}
