import 'package:dio/dio.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/presentation/widgets/toast.dart';

import '../../../constants/shared_preferences.dart';

class LogoutApi {
  Future logout() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Prefs.getToken()}'
    };
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
      print("mango");
      return true;
    } else {
      if (response.data['message'] != null) {
        flutterToast(msg: response.data['message'].toString());
      }
    }
  }
}
