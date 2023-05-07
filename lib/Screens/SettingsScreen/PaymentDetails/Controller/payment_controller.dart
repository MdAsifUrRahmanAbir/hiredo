import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Services/stripe_service.dart';
import 'package:homelyknock/widgets/data_controller.dart';

import '../Model/card_model.dart';

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
  var selectedCard=0.obs;

  RxList<Datum> cardList=List<Datum>.empty(growable: true).obs;
 


  

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
          token: token, customerId: "cus_NqP1hHKLffsHmu");
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

  getPaymentCard(bool isAddCard ) async {
    if(!isAddCard){
      isLoading(true);
    }
    
    try {
      var result =
          await StripeService.fetchCard(customerId: "cus_NqP1hHKLffsHmu");
      if (result.runtimeType != int) {
      
      CardModel  cardData = cardModelFromJson(result);
      cardList.value=cardData.data;
      update();
      
        debugPrint("Card fetch all successful");
      }else{
        debugPrint("Get payment card error ");
      }
    } on Exception catch (e) {
      debugPrint("Error resion :$e");
    } finally {
       if(!isAddCard){
      isLoading(false);
    }
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
