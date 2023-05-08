// To parse this JSON data, do
//
//     final paymentCompleteDetailsModel = paymentCompleteDetailsModelFromJson(jsonString);

import 'dart:convert';

PaymentCompleteDetailsModel paymentCompleteDetailsModelFromJson(String str) => PaymentCompleteDetailsModel.fromJson(json.decode(str));

class PaymentCompleteDetailsModel {
    String id;
    int amount;
    String balanceTransaction;
  
    PaymentCompleteDetailsModel({
        required this.id,
      
        required this.amount,
      
        required this.balanceTransaction,
        
        
    });

    factory PaymentCompleteDetailsModel.fromJson(Map<String, dynamic> json) => PaymentCompleteDetailsModel(
        id: json["id"],
      
        amount: json["amount"],
       
        balanceTransaction: json["balance_transaction"],
        
        
    );



}

// class BillingDetails {
//     Address address;
//     dynamic email;
//     String name;
//     dynamic phone;

//     BillingDetails({
//         required this.address,
//         this.email,
//         required this.name,
//         this.phone,
//     });

//     factory BillingDetails.fromJson(Map<String, dynamic> json) => BillingDetails(
//         address: Address.fromJson(json["address"]),
//         email: json["email"]??"",
//         name: json["name"],
//         phone: json["phone"],
//     );

   
// }

// class Address {
//     String city;
//     String country;
//     dynamic line1;
//     dynamic line2;
//     dynamic postalCode;
//     dynamic state;

//     Address({
//         required this.city,
//         required this.country,
//         this.line1,
//         this.line2,
//         this.postalCode,
//         this.state,
//     });

//     factory Address.fromJson(Map<String, dynamic> json) => Address(
//         city: json["city"]??"",
//         country: json["country"],
//         line1: json["line1"],
//         line2: json["line2"],
//         postalCode: json["postal_code"],
//         state: json["state"],
//     );

// }

// class FraudDetails {
//     FraudDetails();

//     factory FraudDetails.fromJson(Map<String, dynamic> json) => FraudDetails(
//     );

//     Map<String, dynamic> toJson() => {
//     };
// }

// class Outcome {
//     String networkStatus;
//     dynamic reason;
//     String riskLevel;
//     int riskScore;
//     String sellerMessage;
//     String type;

//     Outcome({
//         required this.networkStatus,
//         this.reason,
//         required this.riskLevel,
//         required this.riskScore,
//         required this.sellerMessage,
//         required this.type,
//     });

//     factory Outcome.fromJson(Map<String, dynamic> json) => Outcome(
//         networkStatus: json["network_status"],
//         reason: json["reason"],
//         riskLevel: json["risk_level"],
//         riskScore: json["risk_score"],
//         sellerMessage: json["seller_message"],
//         type: json["type"],
//     );

   
// }

// class PaymentMethodDetails {
//     Card card;
//     String type;

//     PaymentMethodDetails({
//         required this.card,
//         required this.type,
//     });

//     factory PaymentMethodDetails.fromJson(Map<String, dynamic> json) => PaymentMethodDetails(
//         card: Card.fromJson(json["card"]),
//         type: json["type"],
//     );

  
// }

// class Card {
//     String brand;
//     Checks checks;
//     String country;
//     int expMonth;
//     int expYear;
//     String fingerprint;
//     String funding;
//     dynamic installments;
//     String last4;
//     dynamic mandate;
//     String network;
//     NetworkToken networkToken;
//     dynamic threeDSecure;
//     dynamic wallet;

//     Card({
//         required this.brand,
//         required this.checks,
//         required this.country,
//         required this.expMonth,
//         required this.expYear,
//         required this.fingerprint,
//         required this.funding,
//         this.installments,
//         required this.last4,
//         this.mandate,
//         required this.network,
//         required this.networkToken,
//         this.threeDSecure,
//         this.wallet,
//     });

//     factory Card.fromJson(Map<String, dynamic> json) => Card(
//         brand: json["brand"],
//         checks: Checks.fromJson(json["checks"]),
//         country: json["country"],
//         expMonth: json["exp_month"],
//         expYear: json["exp_year"],
//         fingerprint: json["fingerprint"],
//         funding: json["funding"],
//         installments: json["installments"],
//         last4: json["last4"],
//         mandate: json["mandate"],
//         network: json["network"],
//         networkToken: NetworkToken.fromJson(json["network_token"]),
//         threeDSecure: json["three_d_secure"],
//         wallet: json["wallet"],
//     );

    
// }

// class Checks {
//     dynamic addressLine1Check;
//     dynamic addressPostalCodeCheck;
//     dynamic cvcCheck;

//     Checks({
//         this.addressLine1Check,
//         this.addressPostalCodeCheck,
//         this.cvcCheck,
//     });

//     factory Checks.fromJson(Map<String, dynamic> json) => Checks(
//         addressLine1Check: json["address_line1_check"],
//         addressPostalCodeCheck: json["address_postal_code_check"],
//         cvcCheck: json["cvc_check"],
//     );

   
// }

// class NetworkToken {
//     bool used;

//     NetworkToken({
//         required this.used,
//     });

//     factory NetworkToken.fromJson(Map<String, dynamic> json) => NetworkToken(
//         used: json["used"],
//     );

   
// }

// class Source {
//     String id;
//     String object;
//     String addressCity;
//     String addressCountry;
//     dynamic addressLine1;
//     dynamic addressLine1Check;
//     dynamic addressLine2;
//     dynamic addressState;
//     dynamic addressZip;
//     dynamic addressZipCheck;
//     String brand;
//     String country;
//     String customer;
//     dynamic cvcCheck;
//     dynamic dynamicLast4;
//     int expMonth;
//     int expYear;
//     String fingerprint;
//     String funding;
//     String last4;
//     FraudDetails metadata;
//     String name;
//     dynamic tokenizationMethod;
//     dynamic wallet;

//     Source({
//         required this.id,
//         required this.object,
//         required this.addressCity,
//         required this.addressCountry,
//         this.addressLine1,
//         this.addressLine1Check,
//         this.addressLine2,
//         this.addressState,
//         this.addressZip,
//         this.addressZipCheck,
//         required this.brand,
//         required this.country,
//         required this.customer,
//         this.cvcCheck,
//         this.dynamicLast4,
//         required this.expMonth,
//         required this.expYear,
//         required this.fingerprint,
//         required this.funding,
//         required this.last4,
//         required this.metadata,
//         required this.name,
//         this.tokenizationMethod,
//         this.wallet,
//     });

//     factory Source.fromJson(Map<String, dynamic> json) => Source(
//         id: json["id"],
//         object: json["object"],
//         addressCity: json["address_city"],
//         addressCountry: json["address_country"],
//         addressLine1: json["address_line1"],
//         addressLine1Check: json["address_line1_check"],
//         addressLine2: json["address_line2"],
//         addressState: json["address_state"],
//         addressZip: json["address_zip"],
//         addressZipCheck: json["address_zip_check"],
//         brand: json["brand"],
//         country: json["country"],
//         customer: json["customer"],
//         cvcCheck: json["cvc_check"],
//         dynamicLast4: json["dynamic_last4"],
//         expMonth: json["exp_month"],
//         expYear: json["exp_year"],
//         fingerprint: json["fingerprint"],
//         funding: json["funding"],
//         last4: json["last4"],
//         metadata: FraudDetails.fromJson(json["metadata"]),
//         name: json["name"],
//         tokenizationMethod: json["tokenization_method"],
//         wallet: json["wallet"],
//     );

  
// }
