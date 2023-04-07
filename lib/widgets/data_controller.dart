import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common_data.dart';

class DataController extends GetxController {
  var id = 0.obs;
  var fullName = "".obs;
  var email = "".obs;
  var dateOfBirth = "".obs;
  var phoneNumber = "".obs;
  var corporationName = "".obs;
  var corporationNumber = "".obs;
  var isProfessional = false.obs;
  var isUser = false.obs;
  var password = "".obs;

  late SharedPreferences preferences;

  getData() async {
    preferences = await SharedPreferences.getInstance();
    id.value = preferences.getInt(CommonData.id) ?? 0;
    email.value = preferences.getString(CommonData.email) ?? "";
    password.value = preferences.getString(CommonData.password) ?? "";
    phoneNumber.value = preferences.getString(CommonData.phoneNumber) ?? "";
    fullName.value = preferences.getString(CommonData.fullName) ?? "";
    dateOfBirth.value = preferences.getString(CommonData.dateOfBirth) ?? "";
    corporationName.value =
        preferences.getString(CommonData.corporationName) ?? "";
    corporationNumber.value =
        preferences.getString(CommonData.corporationNumber) ?? "";
    isProfessional.value =
        preferences.getBool(CommonData.isProfessional) ?? false;
    isUser.value = preferences.getBool(CommonData.isUser) ?? false;
  }

  setData({
    required int idD,
    required String emailD,
    required String passwordD,
    required String phoneD,
    required String fullNameD,
    required String dateOfBirthD,
    required String corporationNameD,
    required String corporationNumberD,
    required bool isProfessionalD,
    required bool isUserD,
  }) async {
    id.value = idD;
    email.value = emailD;
    password.value = passwordD;
    phoneNumber.value = phoneD;
    dateOfBirth.value = dateOfBirthD;
    corporationName.value = corporationNameD;
    isProfessional.value = isProfessionalD;
    isUser.value = isUserD;
    fullName.value = fullNameD;
    corporationNumber.value = corporationNumberD;

    preferences = await SharedPreferences.getInstance();
    preferences.setInt(CommonData.id, idD);
    preferences.setString(CommonData.email, emailD);
    preferences.setString(CommonData.password, passwordD);
    preferences.setString(CommonData.phoneNumber, phoneD);
    preferences.setString(CommonData.fullName, fullNameD);
    preferences.setString(CommonData.dateOfBirth, dateOfBirthD);
    preferences.setString(CommonData.corporationName, corporationNameD);
    preferences.setString(CommonData.corporationNumber, corporationNumberD);
    preferences.setBool(CommonData.isProfessional, isProfessionalD);
    preferences.setBool(CommonData.isUser, isUserD);
  }

  updateUserMode({
    required bool isProfessionalD,
    required bool isUserD,
  }) async {
    isProfessional.value = isProfessionalD;
    isUser.value = isUserD;
    preferences = await SharedPreferences.getInstance();
    preferences.setBool(CommonData.isProfessional, isProfessionalD);
    preferences.setBool(CommonData.isUser, isUserD);
  }



}
