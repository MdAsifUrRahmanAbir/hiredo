import 'package:get/get.dart';

class QuestionController extends GetxController {
  RxInt selectedItemIndex = 0.obs;

  List item = [
    {'title': 'Apartment/condo'},
    {'title': 'Commercial Property'},
    {'title': 'House'},
    {'title': 'Small House/cortage'},
    {'title': 'Other'},
  ];
}
