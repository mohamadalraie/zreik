import 'package:dio/dio.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/data/models/notification.dart';
import 'package:zreiq/presentation/widgets/toast.dart';

import '../../../constants/shared_preferences.dart';

class OldNotificationApi {
  Future<dynamic> oldNotificationApi() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Prefs.getToken()}',
    };
    var dio = Dio();
    String url = '${baseUrl}show_old_notification';

    var response = await dio.request(
      url,
      options: Options(
        method: 'GET',
        headers: headers,
        validateStatus: (statusCode) {
          if (statusCode == null) {
            return false;
          }
          if (statusCode == 405) {
            return true;
          } else {
            return statusCode >= 200 && statusCode < 300;
          }
        },
      ),
    );

    if (response.statusCode == 200) {
      print("user old notification");
      print(response.data);
      List<OldNotification> o = [];
      for (var no in response.data) {
        o.add(OldNotification.fromJson(no));
      }
      return o;
    } else {
      if (response.data['message'] != null) {
        flutterToast(msg: response.data['message'].toString());
        return OldNotification.fromJson(response.data);
      }
    }
  }
}

class UnReadNotificationApi {
  Future<dynamic> unReadNotificationApi() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Prefs.getToken()}',
    };
    var dio = Dio();
    String url = '${baseUrl}show_unread_notification';

    var response = await dio.request(
      url,
      options: Options(
        method: 'GET',
        headers: headers,
        validateStatus: (statusCode) {
          if (statusCode == null) {
            return false;
          }
          if (statusCode == 405) {
            return true;
          } else {
            return statusCode >= 200 && statusCode < 300;
          }
        },
      ),
    );

    if (response.statusCode == 200) {
      print("user notification *_*");
      return UnReadNotification.fromJson(response.data);
    } else {
      if (response.data['message'] != null) {
        flutterToast(msg: response.data['message'].toString());
      }
    }
  }
}
