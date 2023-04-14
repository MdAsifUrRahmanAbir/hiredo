import 'package:get/get.dart';

class OnClickResponseController extends GetxController{
  var status = false.obs;


  List items = ['Bathroom', 'Kitchen', 'Renovation'];
  var selectedValue = 'Bathroom'.obs;
}