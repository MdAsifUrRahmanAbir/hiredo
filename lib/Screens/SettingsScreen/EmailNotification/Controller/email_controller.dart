import 'package:get/get.dart';
import 'package:myapp/Screens/SettingsScreen/EmailNotification/Model/email_model.dart';

class EmailController extends GetxController {
  List<EmailModel> items = [
    EmailModel(title: 'New leads I receive'),
    EmailModel(title: "Customers closing leads I've responded to"),
    EmailModel(title: 'Customers dismissing my response'),
    EmailModel(title: 'Customers hiring me'),
    EmailModel(title: 'Customers reading a message I sent'),
    EmailModel(title: 'Customers requesting a call from me'),
    EmailModel(title: 'Customers dismissing my response'),
    EmailModel(title: 'Customers requesting me to contact them'),
    EmailModel(title: 'Customers viewing my profile'),
    EmailModel(title: 'Customers viewing my website'),
    EmailModel(title: 'Customers viewing contact details on my profile'),
    EmailModel(title: "A summary of leads I'm matched to each day"),
    EmailModel(title: 'Customers sending me a message'),
    EmailModel(title: 'New reviews on my profile'),
    EmailModel(title: 'New reviews from other sources'),
    EmailModel(title: 'Services similar to mine I can get more leads from'),
    EmailModel(title: 'Promotional emails'),
  ];

  List isSwitched = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ].obs;
}
