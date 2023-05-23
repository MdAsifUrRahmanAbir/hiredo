class CommonData{

static var id="id";
static String fullName="fullName";
static String email="email";
static String dateOfBirth="dateOfBirth";
static String phoneNumber="phoneNumber";
static String corporationName="corporationName";
static String corporationNumber="corporationNumber";
static String isProfessional="isProfessional";
static String isUser="isUser";
static String password="password";
static String bearerToken="bearerToken";
static String profileImage="profileImage";
static String stripeCustomerId="stripeCustomerId";




// password validator
 static RegExp passValidator =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
// email validator
 static RegExp emailValidator = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");





}