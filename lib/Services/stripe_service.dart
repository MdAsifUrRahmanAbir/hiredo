import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:homelyknock/Services/stripe_component.dart';
import 'package:http/http.dart' as http;


import 'api_component.dart';

class StripeService {
  static var client = http.Client();

  // Map<String, dynamic>? paymentIntentData;
  //
  // Future<void> makePayment(
  //     {required String amount,
  //     required String currency,
  //     required int id,
  //     required int cradit}) async {
  //   try {
  //     debugPrint("Start Payment");
  //     paymentIntentData = await createPaymentIntent(amount, currency);
  //
  //     debugPrint("After payment intent");
  //
  //     if (paymentIntentData != null) {
  //       // CardEditController cardEditController = CardEditController(
  //       //   initialDetails: CardFieldInputDetails(
  //       //     complete: true,
  //       //     number: '4312424253534242',
  //       //     cvc: '234',
  //       //     expiryMonth: 3,
  //       //     expiryYear: 2024,
  //       //   )
  //       // );
  //       // await Stripe.buildWebCard(
  //       //   controller: cardEditController,
  //       // );
  //
  //       debugPrint(" payment intent is not null .........");
  //       await Stripe.instance.initPaymentSheet(
  //           paymentSheetParameters: SetupPaymentSheetParameters(
  //         customFlow: true,
  //         merchantDisplayName: 'Prospects',
  //         customerId: paymentIntentData!['customer'],
  //         paymentIntentClientSecret: paymentIntentData!['client_secret'],
  //         // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92'),
  //         googlePay: const PaymentSheetGooglePay(
  //             merchantCountryCode: '+92', testEnv: true),
  //         style: ThemeMode.dark,
  //       ));
  //       debugPrint(" initPaymentSheet  .........");
  //       displayPaymentSheet(amount: int.parse(amount), id: id, cradit: cradit);
  //     }
  //   } catch (e, s) {
  //     debugPrint("After payment intent Error: ${e.toString()}");
  //     debugPrint("After payment intent s Error: ${s.toString()}");
  //   }
  // }
  //
  // displayPaymentSheet(
  //     {required int amount, required int id, required int cradit}) async {
  //   try {
  //     await Stripe.instance.presentPaymentSheet();
  //
  //     Map<String, dynamic> body = {
  //       "user": id,
  //       "credit_amount": amount,
  //       "credit_price": cradit,
  //       "transaction_id": "645646",
  //       "payment_id": "546654"
  //     };
  //
  //     try {
  //       var result = await ApiServices.paymentUserCreditPurchase(body);
  //       if (result) {
  //         updateUserPlan();
  //         Get.snackbar('Payment Successful', "Payment Successful Done");
  //       }
  //     } on Exception catch (e) {
  //       debugPrint("payment error : $e");
  //     }
  //   } on Exception catch (e) {
  //     if (e is StripeException) {
  //       debugPrint("Error from Stripe: ${e.error.localizedMessage}");
  //     } else {
  //       debugPrint("Unforcen Error: $e");
  //     }
  //   } catch (e) {
  //     debugPrint("Exception $e");
  //   }
  // }
  //
  // createPaymentIntent(String amount, String currency) async {
  //   try {
  //     Map<String, dynamic> body = {
  //       'amount': calculate(amount),
  //       'currency': currency,
  //       'payment_method_types[]': 'card',
  //     };
  //
  //     debugPrint("Start Payment Intent http rwq post method");
  //
  //     var response =
  //         await http.post(Uri.parse(stripeUrl), body: body, headers: {
  //       "Authorization": "Bearer $stripeSecretKey",
  //       "Content-Type": 'application/x-www-form-urlencoded'
  //     });
  //     debugPrint("End Payment Intent http rwq post method");
  //     debugPrint(response.body.toString());
  //
  //     return jsonDecode(response.body);
  //   } catch (e) {
  //     debugPrint('err charging user: ${e.toString()}');
  //   }
  // }
  //
  // calculate(String amount) {
  //   final a = (int.parse(amount)) * 100;
  //   return a.toString();
  // }
  //
  // updateUserPlan() async {
  //   Get.offNamedUntil(Routes.mainPage, (route) => false);
  // }
  //


// <---------------  stripe payment api  ----------->
// card create token





  static Future<dynamic> createStripeAccount({required Map<String, String> body}) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $stripeSecretKey',
    };

    try {
      var response = await client.post(Uri.parse(createStripeUserApi),
          body: body, headers: headers);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        debugPrint(response.reasonPhrase);
        debugPrint(response.statusCode.toString());
        
        return 1;
      }
    } on Exception catch (e) {
      debugPrint("Create user error resion: $e");
      return 1;
    }
  }




  static createToken({required Map<String, String> body}) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $stripeSecretKey',
    };

    try {
      var response = await client.post(Uri.parse(createTokenApi),
          body: body, headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        debugPrint(response.reasonPhrase);
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        Fluttertoast.showToast(
            msg: data["error"]["message"], toastLength: Toast.LENGTH_LONG);
        return 1;
      }
    } on Exception catch (e) {
      debugPrint("Create token error resion: $e");
      return 1;
    }
  }

  static createCard({required String token, required String customerId}) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $stripeSecretKey',
    };
    Map<String, dynamic> body = {'source': token};
    try {
      var response = await client.post(
          Uri.parse("$createCardApi$customerId/sources"),
          body: body,
          headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        debugPrint(response.reasonPhrase);
        debugPrint(response.body);
        return 1;
      }
    } on Exception catch (e) {
      debugPrint("Create card error resion: $e");
      return 1;
    }
  }


  static fetchCard({required String customerId}) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $stripeSecretKey',
    };
   
    try {
      var response = await client.get(
          Uri.parse(fetchCardApi(customerId)),
          headers: headers);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        debugPrint(response.reasonPhrase);
        debugPrint(response.body);
        return 1;
      }
    } on Exception catch (e) {
      debugPrint("Fetch card error resion: $e");
      return 1;
    }
  }

  
  static deleteCard({required String customerId,required String cardId}) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $stripeSecretKey',
    };
   
    try {
      var response = await client.delete(
          Uri.parse(deleteCardApi(customerId,cardId)),
          headers: headers);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        debugPrint(response.reasonPhrase);
        debugPrint(response.body);
        return 1;
      }
    } on Exception catch (e) {
      debugPrint("Delete card error resion: $e");
      return 1;
    }
  }


static Future<dynamic>  chargePayment( Map<String,String> body)async{


   try {
  var headers = {
     'Content-Type': 'application/x-www-form-urlencoded',
     'Authorization': 'Bearer $stripeSecretKey',
   };
  var response = await client.post(Uri.parse(chargePaymentApi),body:body,headers: headers);
  debugPrint(response.body);
  if (response.statusCode == 200) {
    return response.body;
  }
  else {
    debugPrint(response.body);
    debugPrint(response.reasonPhrase);
    var data=jsonDecode(response.body);
    Fluttertoast.showToast(msg: data["error"]["message"]);
    return 1;
  }
} on Exception catch (e) {
  debugPrint("Charge payment error : $e");

  return 1;
}

  }




}
