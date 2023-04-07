import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homelyknock/Screens/ProfileScreen/profile.dart';
import 'package:homelyknock/Screens/SettingsScreen/PaymentDetails/Model/payment_model.dart';
import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:homelyknock/utils/colors.dart';

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

  int buttonSelected = 0;

  Future showModalBS() {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(15.w),
        height: 396.h,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Card',
              style: myStyle(20.sp, FontWeight.w500, textClr),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Name on card',
              style: myStyle(14.sp, FontWeight.w400, offWhite),
            ),
            TextField(),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Card number',
              style: myStyle(14.sp, FontWeight.w400, offWhite),
            ),
            TextField(),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Expiry date',
                        style: myStyle(14.sp, FontWeight.w400, offWhite),
                      ),
                      const SizedBox(
                        child: TextField(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'CVV',
                        style: myStyle(14.sp, FontWeight.w400, offWhite),
                      ),
                      const SizedBox(
                        child: TextField(),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Spacer(),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.w),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: backIconClr),
              child: Text(
                'Add Card',
                style: myStyle(16.sp, FontWeight.w400, scaffoldClr),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldClr,
      body: SafeArea(
        child: Container(
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
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Profile(),
                          ));
                        },
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
                            style: myStyle(14, FontWeight.w400, themeColorGreen),
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
                                  style: myStyle(16.sp, FontWeight.w500, textClr),
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
                                        borderRadius: BorderRadius.circular(4.r),
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
                    showModalBS();
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
                          style:
                              myStyle(14.sp, FontWeight.w400, backIconClr),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
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
                    Expanded(
                        child: Container(
                          height: 51.h,
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: backIconClr),
                      child: Text(
                        'Next',
                        style: myStyle(16.sp, FontWeight.w400, scaffoldClr),
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
