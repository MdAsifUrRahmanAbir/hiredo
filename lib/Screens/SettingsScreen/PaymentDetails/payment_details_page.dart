import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/SettingsScreen/PaymentDetails/Model/payment_model.dart';
import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:homelyknock/utils/colors.dart';

import '../../../Services/stripe_service.dart';
import 'Controller/payment_controller.dart';
import 'input_formetters.dart';

class PaymentDetailsPage extends StatefulWidget {
  const PaymentDetailsPage({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  List<PaymentModel> paymentmedium = [
    PaymentModel(
      imgUrl: 'images/mastercard_img.png',
      name: 'Pay with Mastercard',
    ),
    PaymentModel(
      imgUrl: 'images/paypal_img.png',
      name: 'Pay with Paypal',
    ),
    PaymentModel(
      imgUrl: 'images/american_img.png',
      name: 'Pay with American Ex',
    ),
    PaymentModel(
      imgUrl: 'images/visa_img.png',
      name: 'Pay with Visa Card',
    ),
    PaymentModel(
      imgUrl: 'images/gpay_img.png',
      name: 'Pay with GPay',
    ),
  ];

  final _paymentController = Get.put(PaymentController());
   final _formKey = GlobalKey<FormState>();

  int buttonSelected = 0;
  var paymentController = StripeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldClr,
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(15.w),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: Image.asset('images/payment_img.png')),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          children: [
                            Text(
                              'Good afternoon',
                              style: myStyle(14.sp, FontWeight.w400, textClr),
                            ),
                            Text(
                              'Jacob Jones',
                              style: myStyle(18.sp, FontWeight.w500, textClr),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: scaffoldClr,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                )
                              ]),
                          child: const Icon(
                            Icons.search,
                            color: themeColorGreen,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15.h),
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                          color: scaffoldClr,
                          borderRadius: BorderRadius.circular(5.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 1,
                              spreadRadius: 1,
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Main Wallet',
                                style: myStyle(18.sp, FontWeight.w400, textClr),
                              ),
                              Text(
                                'My balance',
                                style: myStyle(14.sp, FontWeight.w400, offWhite),
                              ),
                              Text(
                                '\$150 00',
                                style:
                                    myStyle(14, FontWeight.w400, themeColorGreen),
                              )
                            ],
                          ),
                          Image.asset('images/card_img.png')
                        ],
                      ),
                    ),
                    Flexible(
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Container(
                                height: 62,
                                width: double.infinity,
                                decoration:
                                    BoxDecoration(color: scaffoldClr, boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                  )
                                ]),
                                child: Row(
                                  children: [
                                    Image.asset(paymentmedium[index].imgUrl),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      paymentmedium[index].name,
                                      style:
                                          myStyle(16.sp, FontWeight.w500, textClr),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          buttonSelected = index;
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 35,
                                        width: 75,
                                        decoration: BoxDecoration(
                                            color: buttonSelected == index
                                                ? backIconClr
                                                : null,
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            border: Border.all(
                                                width: 1, color: backIconClr)),
                                        child: Text(
                                          'Pay Now',
                                          style: myStyle(
                                              14.sp,
                                              FontWeight.w400,
                                              buttonSelected == index
                                                  ? scaffoldClr
                                                  : backIconClr),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10.h,
                              ),
                          itemCount: paymentmedium.length),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        _showBottomSheet();
                      },
                      child: Container(
                        height: 57.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.r),
                            border: Border.all(color: backIconClr, width: 1.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 18.sp,
                              color: backIconClr,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              'Add new card',
                              style: myStyle(14.sp, FontWeight.w400, backIconClr),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 51.h,
                          width: 51.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.r),
                              border: Border.all(color: backIconClr, width: 1.w)),
                          child: Icon(
                            Icons.calendar_month_outlined,
                            size: 16.sp,
                            color: backIconClr,
                          ),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        _payButtonWidget()
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }






   _showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft:Radius.circular(8.r),topRight: Radius.circular(8.r))
      ),
      builder: (context) => Wrap(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.w,vertical: 20.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Add New Card',
                      style: myStyle(20.sp, FontWeight.w500, textClr),
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    Text(
                      'Name on card',
                      style: myStyle(14.sp, FontWeight.w400, offWhite),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    TextFormField(
                      controller: _paymentController.nameTextController,
                      decoration: const InputDecoration(
                          hintText: "Roronoa Zoro",
                          contentPadding: EdgeInsets.zero,
                          isDense: true),
                          validator:(value) {
                            if(value == null || value.isEmpty){
                              return "Enter your name on card name";
                            }
                            return null;
                          },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Card number',
                      style: myStyle(14.sp, FontWeight.w400, offWhite),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    TextFormField(
                      controller: _paymentController.cardTextController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                        CardNumberInputFormatter(),
                      ],
                      onChanged: (value) {
                        print(value);
                        print(_paymentController.cardTextController.text);
                      },
                       validator:(value) {
                            if(value == null || value.isEmpty){
                              return "Enter your card number";
                            }else if(value.length<16){
                              return "Enter your valid card number";
                            }
                            return null;
                          },
                      decoration: const InputDecoration(
                          hintText: "1234  4567  7890  1234",
                          contentPadding: EdgeInsets.zero,
                          isDense: true),
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expiry date',
                                style: myStyle(14.sp, FontWeight.w400, offWhite),
                              ),
                              SizedBox(
                                height: 13.h,
                              ),
                              TextFormField(
                                controller: _paymentController.expiryDataTextController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                  CardMonthInputFormatter(),
                                ],
                                  validator:(value) {
                            if(value == null || value.isEmpty){
                              return "Enter your expiry date";
                            }else if(value.length<4){
                              return "Enter your valid expiry date";
                            }
                            return null;
                          },
                           onChanged: (value) {
                        print(value);
                        print(_paymentController.expiryDataTextController.text);
                      },
                                decoration: const InputDecoration(
                                    hintText: "02/24",
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CVV',
                                style: myStyle(14.sp, FontWeight.w400, offWhite),
                              ),
                              SizedBox(
                                height: 13.h,
                              ),
                              TextFormField(
                                controller: _paymentController.cvvTextController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                              
                                ],
                                obscureText: true,
                                  validator:(value) {
                            if(value == null || value.isEmpty){
                              return "Enter your  cvv";
                            }else if(value.length<4){
                              return "Enter your valid cvv ";
                            }
                            return null;
                          },
                           onChanged: (value) {
                        print(value);
                        print(_paymentController.cvvTextController.text);
                      },
                                decoration: const InputDecoration(
                                    hintText: "•••",
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    InkWell(
                      onTap: (){
                      if(_formKey.currentState!.validate()){
                        _paymentController.createTokenStripe();

                      }

                      },
                      child: Container(
                        height: 50.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r), color: backIconClr),
                        child: Text(
                          'Add Card',
                          style: myStyle(16.sp, FontWeight.w400, scaffoldClr),
                        ),
                      ),
                    ),
                      SizedBox(height:56.h,),
                   
                     
                     Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              
              
              
              ),
                ],
              ),
            ),
          ),
        


          
         
        
        
        ],
      ),
    );
  }



  _payButtonWidget() {
    return Expanded(
        child: InkWell(
      onTap: () {
        //  paymentController.makePayment(amount: '9', currency: 'USD');
      },
      child: Container(
        height: 51.h,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r), color: backIconClr),
        child: Text(
          'Next',
          style: myStyle(16.sp, FontWeight.w400, scaffoldClr),
        ),
      ),
    ));
  }
}
