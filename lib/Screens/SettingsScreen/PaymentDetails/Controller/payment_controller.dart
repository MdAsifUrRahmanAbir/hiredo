import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Services/api_services_by_limon.dart';
import 'package:homelyknock/Services/stripe_service.dart';
import 'package:homelyknock/widgets/data_controller.dart';

import '../../../../Services/api_services.dart';
import '../../MyCredits/Model/user_credit_model.dart';
import '../Model/card_model.dart';
import '../Model/payment_complete_details_model.dart';

class PaymentController extends GetxController {
  final _dataController = Get.put(DataController());

  @override
  void onInit() {
    getPaymentCard(false);
  
    super.onInit();
  }

  TextEditingController nameTextController = TextEditingController();
  TextEditingController cardTextController = TextEditingController();
  TextEditingController expiryDataTextController = TextEditingController();
  TextEditingController cvvTextController = TextEditingController();

  var isLoading = false.obs;
  var isCardAddLoading = false.obs;
  var selectedCard = 0.obs;
  var totalCredit = 0.obs;
  var isPayNowLoading = false.obs;
  var isDeleteCardLoading=false.obs;

  RxList<Datum> cardList = List<Datum>.empty(growable: true).obs;

  createTokenStripe() async {
    try {
      isCardAddLoading(true);
      Map<String, String> body = {
        'card[exp_month]': expiryDataTextController.text.substring(0, 2),
        'card[exp_year]': expiryDataTextController.text.substring(3, 5),
        'card[number]': cardTextController.text.replaceAll("  ", ""),
        'card[cvc]': cvvTextController.text,
        'card[name]': nameTextController.text
      };

      var result = await StripeService.createToken(body: body);
      if (result.runtimeType != int) {
        debugPrint("Token create successful . id :${result["id"]}");
        await createCardStripe(result["id"]);
      }
    } on Exception catch (e) {
      debugPrint("Error resion :$e");
    } finally {
      isCardAddLoading(false);
    }
  }

  createCardStripe(String token) async {
    try {
      var result = await StripeService.createCard(
          token: token, customerId: _dataController.stripeCustomerId.value);
      if (result.runtimeType != int) {
        nameTextController.clear();
        expiryDataTextController.clear();
        cardTextController.clear();
        cvvTextController.clear();
        getPaymentCard(true);
        Fluttertoast.showToast(
            msg: "Card create successful", toastLength: Toast.LENGTH_LONG);
        Get.back();
      }
    } on Exception catch (e) {
      debugPrint("Error resion :$e");
    }
  }

  getPaymentCard(bool isAddCard) async {
    if (!isAddCard) {
      isLoading(true);
    }

    try {
      var result = await StripeService.fetchCard(
          customerId: _dataController.stripeCustomerId.value);
      if (result.runtimeType != int) {
        CardModel cardData = cardModelFromJson(result);
        cardList.value = cardData.data;
       await getCredit();
        update();

        debugPrint("Card fetch all successful");
      } else {
        debugPrint("Get payment card error ");
      }
    } on Exception catch (e) {
      debugPrint("Error resion :$e");
    } finally {
      if (!isAddCard) {
        isLoading(false);
      }
    }
  }

  deleteCard(String cardId) async {
    try {
      isDeleteCardLoading(true);
      var result = await StripeService.deleteCard(
          customerId: _dataController.stripeCustomerId.value, cardId: cardId);
      if (result.runtimeType != int) {
        Fluttertoast.showToast(msg: "Card delete successfull");
        getPaymentCard(true);

        debugPrint("Card delete all successful");
      } else {
        debugPrint("Get payment card error ");
      }
    } on Exception catch (e) {
      debugPrint("Error resion :$e");
    }finally{
      isDeleteCardLoading(false);
    }
  }

  getCredit() async {
    try {
      var result = await ApiServicesByLimon.fetchCredit();

      if (result.runtimeType == int) {
        debugPrint("Error credit data  :$result");
      } else {
        totalCredit.value = result["total_credit"];
      }
    } on Exception catch (e) {
      debugPrint('Fetch Error :$e');
    }
  }



  payNow(
      {required UserCreaditModel creaditData, required String cardId}) async {
        isPayNowLoading(true);
        var amount = creaditData.priceAmount
                                            .toInt();
   var totalAmount=  calculate(amount.toString());
    
    try {
      Map<String, String> body = {
        'amount': totalAmount,
        'currency': 'USD',
        'customer': _dataController.stripeCustomerId.value,
        'source': cardId,
      };
      var result = await StripeService.chargePayment(body);
      if (result.runtimeType != int) {
      PaymentCompleteDetailsModel  paymentCompleteData = paymentCompleteDetailsModelFromJson(result);
        creaditPurchase(creaditData.priceAmount.toString(), creaditData.creditAmount.toString(), paymentCompleteData.balanceTransaction, paymentCompleteData.id);
      } else {
        debugPrint("Opps payment uncomplete");
      }
    } on Exception catch (e) {
      debugPrint("payment uncomplete error resion :$e");
    }finally{
      isPayNowLoading(false);
    }
  }

   calculate(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

  creaditPurchase(String amount, cradit,transactionId,paymentId) async {
    Map<String, dynamic> body = {
      "user": _dataController.id.value,
      "credit_amount": amount,
      "credit_price": cradit,
      "transaction_id":transactionId,
      "payment_id": paymentId
    };

    try {
      var result = await ApiServices.paymentUserCreditPurchase(body);
      if (result) {
        Get.snackbar('Payment Successful', "Payment Successful Done");
        getCredit();
      }
    } on Exception catch (e) {
      debugPrint("Cradit purchese error $e");
    }
  }

  @override
  void dispose() {
    nameTextController.dispose();
    expiryDataTextController.dispose();
    cardTextController.dispose();
    cvvTextController.dispose();
    super.dispose();
  }
}
