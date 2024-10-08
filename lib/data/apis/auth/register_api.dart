import 'package:dio/dio.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/data/models/register_model.dart';
import 'package:zreiq/presentation/widgets/toast.dart';
import '../../../constants/shared_preferences.dart';

class RegisterApi {
  Future<bool> register(RegisterModel registerModel) async {
    var headers = {'Accept': 'application/json'};

    var data = {
      'Fname': registerModel.firstName,
      'Mname': registerModel.fatherName,
      'Lname': registerModel.lastName,
      'email': registerModel.email,
      'password': registerModel.password,
      'phone_number': registerModel.phoneNumber,
      'address': registerModel.address,
      'National_Number': registerModel.nationalNumber,
      'birthday': registerModel.birthDate
    };
    String url = "${baseUrl}register";

    var dio = Dio();
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
      String? token = response.data['data']['token'].toString();
      Prefs.setToken(token);
      print(response.data['data']['token'].toString());
      return true;
    } else {
      if (response.data['message'] != null) {
        flutterToast(msg: response.data['message']);
      } else {
        flutterToast(msg: response.data['errors'].toString());
      }
      return false;
    }
  }
}
