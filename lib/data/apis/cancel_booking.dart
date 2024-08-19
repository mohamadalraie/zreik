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
        method: 'POST',
        headers: headers,
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
