 String stripeBaseUrl="https://api.stripe.com/";

String createTokenApi="${stripeBaseUrl}v1/tokens";
String createCardApi="${stripeBaseUrl}v1/customers/";

 String fetchCardApi(String customerId){
    return "${stripeBaseUrl}v1/customers/$customerId/sources?object=card";
}

