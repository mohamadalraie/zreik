import 'package:flutter_stripe/flutter_stripe.dart';

class PayWithStripe {
  Future<String?> generateStripeToken(
      {required String cvv,
      required String number,
      required String month,
      required String year}) async {
// This is used to separate month and year

    // var prAge = expiryDate.value.split("/");
    // var month = prAge[0].trim();
    // var year = prAge[1].trim();

    CardTokenParams cardParams = CardTokenParams(
      type: TokenType.Card,
      name: 'mohamad',
    );
    // print(int.tryParse(month));
    await Stripe.instance.dangerouslyUpdateCardDetails(CardDetails(
      number: number,
      cvc: cvv,
      expirationMonth: int.tryParse(month),
      expirationYear: int.tryParse(year),
    ));

    try {
      TokenData token = await Stripe.instance.createToken(
        CreateTokenParams.card(params: cardParams),
      );
      print("Flutter Stripe token  ${token.toJson()}");
      return token.id;
    } on StripeException catch (e) {
      print("Flutter Stripe error ${e.error.message}");
    }
    return null;
  }
}

//
// Future<String?> generateStripeToken({required String cvv}) async{
//
// // This is used to separate month and year
//
//   var prAge = expiryDate.value.split("/");
//   var month = prAge[0].trim();
//   var year = prAge[1].trim();
//
//   CardTokenParams cardParams = CardTokenParams(type: TokenType.Card, name:nameController.text,);
//
//   await Stripe.instance.dangerouslyUpdateCardDetails(CardDetails(
//     number: cardNumber.value,
//     cvc: cvv,
//     expirationMonth: int.tryParse(month),
//     expirationYear: int.tryParse("20$year"),
//   ));
//
//   try {
//     TokenData token = await Stripe.instance.createToken(CreateTokenParams.card(params: cardParams),);
//     print("Flutter Stripe token  ${token.toJson()}");
//     return token.id;
//   } on StripeException catch (e)  {
//     Utils.errorSnackBar(e.error.message);
//     print("Flutter Stripe error ${e.error.message}");
//   }
//   return null;}
