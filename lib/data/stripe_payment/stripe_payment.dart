import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:zreiq/constants/strings.dart';
import 'package:zreiq/data/stripe_payment/stripe_keys.dart';

abstract class StripePayment {
  static Future<void> makePayment(
      {required int amount, required String currency}) async {
    try {
      String clientSecret = await _getClientSecret(
          amount: (amount * 100).toString(), currency: currency);
      await _initializePaymentSheet(clientSecret: clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<String> _getClientSecret(
      {required String amount, required String currency}) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${StripeKeys.secretKey}',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var data = {
      "amount": amount,
      "currency": currency,
    };

    Dio dio = Dio();

    print("before payment");

    var response =
        await dio.request('https://api.stripe.com/v1/payment_intents',
            options: Options(
              method: 'POST',
              headers: headers,
              validateStatus: (statusCode) {
                if (statusCode == null) {
                  return false;
                }
                if (statusCode == 403) {
                  return true;
                } else {
                  return statusCode >= 200 && statusCode < 300;
                }
              },
            ),
            data: data);
    print('200 USD');
    print(response.data);
    // return 'pi_3PoKs3C77cmF32GW1OORn2rk_secret_mCsoHN0TYyTP4BzGOWed487ro';
    return response.data['client_secret'];
  }

  static Future<void> _initializePaymentSheet(
      {required String clientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          allowsDelayedPaymentMethods: true,
          paymentIntentClientSecret: clientSecret,
          customFlow: false,
          merchantDisplayName: 'mohamad'),
    );
  }
}
