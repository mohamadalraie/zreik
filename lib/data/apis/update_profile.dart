import 'package:dio/dio.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/presentation/widgets/toast.dart';
import '../../../constants/shared_preferences.dart';
import '../models/update_profile.dart';

class UpdateProfileApi {
  Future<bool> updateProfileApi(UpdateProfileModel updateProfileModel) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Prefs.getToken()}'
    };

    var data = {
      'Fname': updateProfileModel.data?.fname??"",
      'Mname': updateProfileModel.data?.mname??"",
      'Lname': updateProfileModel.data?.lname??"",
      // 'email': updateProfileModel.data?.email??"",
      // 'birthday': updateProfileModel.data?.birthday??"",
      'phone_number': updateProfileModel.data?.phoneNumber??"",
      'National_Number': updateProfileModel.data?.nationalNumber??"",
    };

    String url = "${baseUrl}updateProfile";

    var dio = Dio();
    try {
      var response = await dio.request(
        url,
        options: Options(
          method: 'PUT',
          headers: headers,
          validateStatus: (statusCode) {
            return statusCode != null &&
                (statusCode >= 200 && statusCode < 300 || statusCode == 422);
          },
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        String? token = response.data['data']['token'].toString();
        Prefs.setToken(token);
        print(response.data['data']['token'].toString());
        return true;
      } else {
        if (response.data != null && response.data is Map<String, dynamic>) {
          if (response.data['message'] != null) {
            flutterToast(msg: response.data['message']);
          } else if (response.data['errors'] != null) {
            flutterToast(msg: response.data['errors'].toString());
          } else {
            flutterToast(msg: "حدث خطأ غير متوقع");
          }
        } else {
          flutterToast(msg: "حدث خطأ غير متوقع");
        }
        return false;
      }
    } catch (e) {
      print('Error: $e');
      flutterToast(msg: "حدث خطأ أثناء إرسال الطلب");
      return false;
    }
  }
}
