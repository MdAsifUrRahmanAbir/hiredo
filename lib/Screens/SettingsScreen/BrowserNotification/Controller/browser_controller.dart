import 'package:get/get.dart';

class BrowserController extends GetxController {
  List<String> items = [
    "New leads I receive"
        " Customers closing leads I've responded to",
    "Customers dismissing my response",
    "Customers hiring me",
  ];

  List selected = [
    false,
    false,
    false,
    false,
  ].obs;
}
