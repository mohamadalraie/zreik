// import 'package:dio/dio.dart';
// import 'package:zreiq/constants/strings.dart';
// import 'package:zreiq/presentation/widgets/toast.dart';
//
// class LoginAPI {
//   Future<bool> login(String email, String password) async {
//     print('mango');
//     var headers = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/x-www-form-urlencoded'
//     };
//     var data = {'email': email, 'password': password};
//     var dio = Dio();
//     print(
//       '${baseUrl}login',
//     );
//
//     var response = await dio.request(
//       '${baseUrl}login',
//       options: Options(
//         method: 'POST',
//         headers: headers,
//         validateStatus: (statusCode) {
//           if (statusCode == null) {
//             return false;
//           }
//           if (statusCode == 422) {
//             return true;
//           } else {
//             return statusCode >= 200 && statusCode < 300;
//           }
//         },
//       ),
//       data: data,
//     );
//
//     if (response.statusCode == 201) {
//       return true;
//     } else {
//       if (response.data['message'] != null) {
//         flutterToast(msg: response.data['message'].toString());
//       } else {
//         flutterToast(msg: response.data['errors'].toString());
//       }
//       return false;
//     }
//   }
// }
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:zreiq/data/models/login_model.dart';

import '../../../constants/shared_preferences.dart';

class LoginApi {

  Future<bool> login({required LoginRequestModel loginRequestModel}) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var data = loginRequestModel.toJson();
    var dio = Dio();
    var response = await dio.request(
      'http://192.168.1.106:8000/user/login',
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
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(response.data);

      var aa = loginResponseModel.data!.token;
      Prefs.setToken(aa);
      return true;
    }
    else {
      print(response.statusMessage);
      return false;
    }
  }

}