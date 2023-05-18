import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:homelyknock/utils/colors.dart';
import 'package:homelyknock/widgets/custom_loader.dart';

import '../../../Services/api_component.dart';
import '../../../widgets/data_controller.dart';
import 'Controller/payment_controller.dart';
import 'input_formetters.dart';

class PaymentDetailsPage extends StatelessWidget {
  PaymentDetailsPage({Key? key}) : super(key: key);

  final _paymentController = Get.put(PaymentController());
  final _dataController = Get.put(DataController());

  var carditData= Get.arguments;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldClr,
      body: Obx(
        () => _paymentController.isLoading.value
            ? const CustomLoader()
            : SafeArea(
                child: Builder(builder: (context) {
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
                                  child:_dataController.profileImage.value==""?CircleAvatar(
                                    backgroundColor: Colors.grey.shade300,
                                    radius: 25.r,
                                   
                                  ) :CircleAvatar(
                                    backgroundColor: Colors.grey.shade300,
                                    radius: 25.r,
                                    backgroundImage: NetworkImage(baseUrl+_dataController.profileImage.value),
                                  )
                                  // Image.asset('images/payment_img.png')
                                  
                                  ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Column(
                                children: [
                                  Text(
                                    _dataController.fullName.value,
                                    style: myStyle(
                                        14.sp, FontWeight.w400, textClr),
                                  ),
                                  Text(
                                    _dataController.corporationName.value,
                                    style: myStyle(
                                        18.sp, FontWeight.w500, textClr),
                                  )
                                ],
                              ),
                              const Spacer(),
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
                                      style: myStyle(
                                          18.sp, FontWeight.w400, textClr),
                                    ),
                                    Text(
                                      'My Credits',
                                      style: myStyle(
                                          14.sp, FontWeight.w400, offWhite),
                                    ),
                                    Obx(()=>
                                       Text(
                                        _paymentController.totalCredit.value.toString(),
                                        style: myStyle(
                                            14, FontWeight.w400, themeColorGreen),
                                      ),
                                    )
                                  ],
                                ),
                                Image.asset('images/card_img.png')
                              ],
                            ),
                          ),
                          Flexible(
                            child: Obx(
                              () => ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var data =
                                        _paymentController.cardList[index];
                                    return Container(
                                      height: 62.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: scaffoldClr,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                            )
                                          ]),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            data.brand == "Visa"
                                                ? "images/visa_img.png"
                                                : data.brand == "MasterCard"
                                                    ? "images/mastercard_img.png"
                                                    : "images/defult_card.png",
                                            height: 22.h,
                                            width: 56.w,
                                            fit: BoxFit.fill,
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Text(
                                            "**** **** **** ${data.last4}",
                                            style: myStyle(16.sp,
                                                FontWeight.w500, textClr),
                                          ),
                                          const Spacer(),
                                        if(carditData!=null)
                                          GestureDetector(
                                            onTap: () {
                                              if(!_paymentController.isPayNowLoading.value){
                                                 _paymentController
                                                  .selectedCard.value = index;
                                                  _paymentController.payNow(creaditData:carditData, cardId:data.id);

                                              }

                                             
                                            },
                                            child: Obx(
                                              () => Container(
                                                alignment: Alignment.center,
                                            height: 35.h,
                                                width: 75.w,
                                                decoration: BoxDecoration(
                                                    color: _paymentController
                                                                .selectedCard
                                                                .value ==
                                                            index
                                                        ? backIconClr
                                                        : null,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.r),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: backIconClr)),
                                                child:_paymentController.isPayNowLoading.value? SizedBox(
                                height: 15.sp,
                                width: 15.sp,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: Colors.white,
                                ),
                              ) : Text(
                                                  'Pay Now',
                                                  style: myStyle(
                                                      14.sp,
                                                      FontWeight.w400,
                                                      _paymentController
                                                                  .selectedCard
                                                                  .value ==
                                                              index
                                                          ? scaffoldClr
                                                          : backIconClr),
                                                ),
                                              ),
                                            ),
                                          )
                                       ,
                                       if(carditData==null)
                                       SizedBox(width:10.w,),
                                        if(carditData==null)
                                        GestureDetector(
                                            onTap: () {
                                              if(!_paymentController.isDeleteCardLoading.value){
                                                   _paymentController.deleteCard(data.id);
                                              }
                                             
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                height: 35.h,
                                                width: 75.w,
                                                decoration: BoxDecoration(
                                                    color:scaffoldClr,
                                                       
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.r),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: backIconClr)),
                                                child:_paymentController.isDeleteCardLoading.value?SizedBox(
                                height: 15.sp,
                                width: 15.sp,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: Colors.white,
                                ),
                              )  :Text(
                                                  'Delete',
                                                  style: myStyle(
                                                      14.sp,
                                                      FontWeight.w400,
                                                       backIconClr
                                                          ),
                                                ),
                                              
                                            ),
                                          )
                                       
                                       
                                       
                                       
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                  itemCount:
                                      _paymentController.cardList.length),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              _showBottomSheet(context);
                            },
                            child: Container(
                              height: 57.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.r),
                                  border: Border.all(
                                      color: backIconClr, width: 1.w)),
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
                                    style: myStyle(
                                        14.sp, FontWeight.w400, backIconClr),
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
                                    border: Border.all(
                                        color: backIconClr, width: 1.w)),
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
                }),
              ),
      ),
    );
  }

  _showBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r))),
      builder: (context) => Wrap(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your card number";
                      } else if (value.length < 16) {
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
                              controller:
                                  _paymentController.expiryDataTextController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                                CardMonthInputFormatter(),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your expiry date";
                                } else if (value.length < 4) {
                                  return "Enter your valid expiry date";
                                }
                                return null;
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
                                LengthLimitingTextInputFormatter(3),
                              ],
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your  cvv";
                                } else if (value.length < 3) {
                                  return "Enter your valid cvv ";
                                }
                                return null;
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
                    onTap: () {
                     
                        if (_formKey.currentState!.validate()) {
                          _paymentController.createTokenStripe();
                        }
                     
                    },
                    child: Obx(
                      () => Container(
                        height: 50.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: backIconClr),
                        child: _paymentController.isCardAddLoading.value
                            ? SizedBox(
                                height: 15.sp,
                                width: 15.sp,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                'Add Card',
                                style: myStyle(
                                    16.sp, FontWeight.w400, scaffoldClr),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
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
