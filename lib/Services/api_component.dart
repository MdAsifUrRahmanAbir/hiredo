String baseUrl = "http://ringknock.pythonanywhere.com/";
String signupApi = "${baseUrl}register/";
String signInApi = "${baseUrl}login/";
String leadcategory = "${baseUrl}lead/category/";
String serviceApi = "${baseUrl}services/";
String fetchService = "${baseUrl}services/";
String addLocation = "${baseUrl}locations/";
String fetchLocation = "${baseUrl}locations/";
String sliderApi = "${baseUrl}slider/";
String fetchBedgeApi = "${baseUrl}profile/badge/";
String jobPostApi = "$baseUrl/lead/JobPostCreate/";

String fetchAllLocationApi = "${baseUrl}lead/PostLocation/";
String textApi = "${baseUrl}lead/category/";
String locationsApi = "${baseUrl}lead/category/";
String forgotPasswordApi = "${baseUrl}reset-password-otp/";

String changePasswordApi = "${baseUrl}change-password/";
String emailTemplateApi = "${baseUrl}email_templates/";
String smsTemplateApi = "${baseUrl}sms_templates/";
String realTimeServiceApi = "${baseUrl}lead/RealTimeService/";
String pendingPostApi = "${baseUrl}lead/PendingPost/";
String profilePicPostApi = "${baseUrl}profile_pic_add/";
String profilePicUpdateApi = "${baseUrl}profile_picture_update/";
String helpGetApi = "${baseUrl}profile/help/";
String getLocationApi = "${baseUrl}locations/";
String getReviewApi = "${baseUrl}profile/UserFilter/";

String getCreditApi = "${baseUrl}payment/UserCreditAmount/";
String paymentSetCreditApi = "${baseUrl}payment/SetCreditRetrive/";
String paymentUserCreditPurchasedApi = "${baseUrl}payment/UserCreditPurchased/";

const String stripeUrl = "https://api.stripe.com/v1/payment_intents";
const String stripeSecretKey =
    "sk_test_51MvmB4BjAkDiQKQNL5Jdp2HS8bbG4rDruFf43JGh03rX2PxoMHYul0kbUh7hRCi2T5ux8AFkfvmbWllvFqDaF2n000bKD76MjZ";

const String stripePublishKey =
    "pk_test_51MvmB4BjAkDiQKQNWHzjwWU9Pmmv3WtHEwXa3TzUqzAV83v3T0tzB2F8yPdV7CiDvdWvwwR4oaNzLhBex6wploqs0052FpuPxX";

String changeUserModeApi = "${baseUrl}profile/change-user-type/";
String logoutUserApi = "${baseUrl}logout/";
String leadsCountApi = "${baseUrl}ServiceWiseLeadCount/";

String needHelpsApi = "${baseUrl}profile/still-need-help/";
String profileApi = "${baseUrl}profile/profile-update/";
String deleteServiceApi = "${baseUrl}services/";
String leadsApi = "${baseUrl}ServiceWiseLead/?page=";
String pandingPostDeleteApi = "${baseUrl}lead/JobPostListDelete/";
String leadSearchApi = "${baseUrl}ServiceWiseLead/?q=";

String leadContactApi = "${baseUrl}lead/contact-with-buyer/";
String panddingResquestListApi = "${baseUrl}lead/post-request-detail/";
String pendingPostAcceptApi = "${baseUrl}lead/request-accept-reject/";
String completePostApi = "${baseUrl}lead/complete-post-list/";
String myResponseApi = "${baseUrl}lead/my-reponse/?page=";
String myResponseCountApi = "${baseUrl}lead/my-reponse-count/";

String wishListCompanyApi = "${baseUrl}lead/WishlistServiceViewSet/";
String wishListServiceApi = "${baseUrl}lead/WishlistFeatureViewSet/";
String addWishListPostApi = "${baseUrl}lead/WishlistServiceViewSet/";


// String changeUserModeApi = "${baseUrl}profile/change-user-type/";
// String logoutUserApi = "${baseUrl}logout/";
// String leadsApi = "${baseUrl}ServiceWiseLead/";

// String needHelpsApi = "${baseUrl}profile/still-need-help/";
// String profileApi = "${baseUrl}profile/profile-update/";





String sendCustomEmailApi="${baseUrl}lead/SendEmailTemplate/";
String reviewAddApi="${baseUrl}profile/create_review/";



