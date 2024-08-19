import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/presentation/widgets/toast.dart';

import '../../constants/shared_preferences.dart';

class CancelBooking {
  Future<dynamic> cancelBooking({required int bookId}) async {
    var headers = {
      'Authorization': 'Bearer ${Prefs.getToken()}',
    };

    var dio = Dio();

    String url = '${baseUrl}cancelMyBookings/$bookId';

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
      flutterToast(msg: 'تم الغاء الحجز بنجاح');
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }
}
