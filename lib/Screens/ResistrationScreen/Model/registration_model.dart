class RegistrationModel {
  String userName;
  String email;
  String password;
  String confirmPassword;
  String dateOfBirth;
  String phoneNumber;
  String corporateName;
  String corporateNumber;

  RegistrationModel(
      {required this.userName,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.dateOfBirth,
      required this.phoneNumber,
      required this.corporateName,
      required this.corporateNumber});
}
