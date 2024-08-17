import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:zreiq/data/stripe_payment/stripe_keys.dart';

abstract class StripePayments {
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
      "payment_method": "pm_card_visa",
    };

    Dio dio = Dio();

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

    print('client secret: ${response.data['client_secret']}');
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

  //
  //
  // static Future<void> generateToken() async {
  //   var userStripeKey = StripeKeys.secretKey;
  //   var dio = Dio();
  //   var url =
  //       'https://api.stripe.com/v1/tokens'; //https://api.stripe.com/v1/tokens
  //   var data = {
  //     "card[number]": "4242424242424242",
  //     "card[exp_month]": "5",
  //     "card[exp_year]": "2026",
  //     "card[cvc]": "000",
  //     // "card[name]": cardHolderName.value,
  //   };
  //   final headers = {
  //     'accept': '*/*',
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer ${StripeKeys.secretKey}',
  //   };
  //
  //   var response;
  //   try {
  //     response = await dio.request(
  //       url,
  //       options: Options(
  //         method: 'POST',
  //         headers: headers,
  //       ),
  //       // headers: headers,
  //       // encoding: Encoding.getByName('utf-8'),
  //       data: data,
  //     );
  //     print('GenerateTokenResponse : ${response.body}');
  //     var cardResponse = json.decode(response.body);
  //     if (response.body.contains('error')) {
  //       //handle errors
  //     } else {
  //       print('GenerateCustomerToken : ${cardResponse['id']}');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
