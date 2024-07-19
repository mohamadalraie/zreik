import 'package:dio/dio.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/data/models/login.dart';

class LoginAPI {
  late Dio dio;

  LoginAPI() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );

    dio = Dio(options);
  }

  Future<void> loginRequest(Login loginModel) async {
    const String api = "$baseUrl     ";

    Response response = await dio.post(api, data: loginModel.toJson());

    if (response.statusCode == 200) {}
  }
}
