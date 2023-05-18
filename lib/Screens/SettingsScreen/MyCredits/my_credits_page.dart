import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:homelyknock/utils/colors.dart';

import 'package:homelyknock/widgets/custom_loader.dart';

import 'package:jiffy/jiffy.dart';

import '../../../Route/routes.dart';

import 'Controller/credit_controller.dart';

class MyCreditsPage extends StatelessWidget {
  MyCreditsPage({Key? key}) : super(key: key);

  final _creditController = Get.put(CreditController());

  @override
  Widget build(BuildContext context) {
    _creditController.getData();
    return Scaffold(
      backgroundColor: scaffoldClr,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: backIconClr,
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/credits.png',
              width: 30.w,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              'My Credits',
              style: myStyle(20.sp, FontWeight.w500, textClr),
            ),
          ],
        ),
        actions: [
          Image.asset('images/notification.png'),
        ],
      ),
      body: Obx(
        () => _creditController.isLoading.value
            ? const CustomLoader()
            : Container(
                padding: EdgeInsets.all(13.w),
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Credits',
                        style: myStyle(20.sp, FontWeight.w500, textClr),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        padding: EdgeInsets.all(10.w),
                        color: containerClr,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: themeColorGreenbright,
                              size: 25.sp,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: RichText(
                                    text: TextSpan(
                                        text:
                                            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet',
                                        style: myStyle(
                                            14.sp, FontWeight.w400, textClr),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: '\nMy Profile',
                                          style: myStyle(14.sp, FontWeight.w400,
                                              themeColorGreen))
                                    ])),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => Row(
                          children: [
                            FlutterSwitch(
                              activeColor: themeColorGreen,
                              width: 37.0.w,
                              height: 19.0.h,
                              toggleSize: 15.0.sp,
                              value: _creditController.status.value,
                              borderRadius: 30.0.r,
                              padding: 2.0.w,
                              showOnOff: _creditController.status.value,
                              onToggle: (val) {
                                _creditController.status.value = val;
                              },
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Auto top-up is',
                              style: myStyle(14.sp, FontWeight.w400, textClr),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3.h, horizontal: 5.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.r),
                                  color: textformback),
                              child: Text(
                                _creditController.status.value ? 'On' : 'Off',
                                style: myStyle(
                                    8.sp, FontWeight.w400, themeColorGreen),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "You have ${_creditController.totalCredit.value} credits",
                              style: myStyle(14.sp, FontWeight.w400, textClr),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _creditController.userCreditData.length,
                        itemBuilder: (context, index) {
                          var perCredit = _creditController
                                  .userCreditData[index].priceAmount /
                              2;
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: offWhite.withOpacity(0.3),
                                      width: .5),
                                  bottom: BorderSide(
                                      color: offWhite.withOpacity(0.3),
                                      width: .5)),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'About responses',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF272727)),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'images/credits.png',
                                          width: 30.w,
                                        ),
                                        Text(
                                          "${_creditController.userCreditData[index].creditAmount}",
                                          style: myStyle(
                                              14.sp, FontWeight.w400, textClr),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${_creditController.userCreditData[index].priceAmount}",
                                          style: myStyle(
                                              12.sp, FontWeight.w400, textClr),
                                        ),
                                        Text('\$$perCredit credit',
                                            style: myStyle(12.sp,
                                                FontWeight.w400, textClr))
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: scaffoldClr,
                                      activeColor: themeColorGreen,
                                      hoverColor: themeColorGreen,
                                      value: false,
                                      side: const BorderSide(
                                          color: themeColorGreen, width: 2),
                                      onChanged: (value) {
                                        _creditController.isCheck.value =
                                            !_creditController.isCheck.value;
                                      },
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      'Auto top-up next time',
                                      style: myStyle(
                                          14.sp, FontWeight.w400, textClr),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () async {
                                        Get.toNamed(Routes.myPaymentDetails,
                                            arguments: _creditController
                                                .userCreditData[index]);

                                        // var amount = _creditController
                                        //     .userCreditData[index].priceAmount
                                        //     .toInt();

                                        // var sharedPreferences =
                                        //     await SharedPreferences
                                        //         .getInstance();
                                        // var id = sharedPreferences
                                        //         .getInt(CommonData.id) ??
                                        //     0;
                                        // StripeService().makePayment(
                                        //     id: id,
                                        //     amount: amount.toString(),
                                        //     cradit: _creditController
                                        //         .userCreditData[index]
                                        //         .creditAmount,
                                        //     currency: "USD");
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 34.h,
                                        width: 109.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.r),
                                            color: backIconClr),
                                        child: Text(
                                          'Buy Credits',
                                          style: myStyle(14.sp, FontWeight.w400,
                                              scaffoldClr),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(
                            color: containerClr,
                            borderRadius: BorderRadius.circular(3.w)),
                        child: Row(
                          children: [
                            Image.asset(
                              'images/visa.png',
                              width: 30.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                                child: Text(
                              'We ll charge the card ending 2518 that we have on file',
                              style: myStyle(12.sp, FontWeight.w400, textClr),
                            )),
                            Text(
                              'Change',
                              style: myStyle(12.sp, FontWeight.w400,
                                  themeColorGreenbright),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      // Text(
                      //   'Redeem coupon',
                      //   style: myStyle(12.sp, FontWeight.w400, textClr),
                      // ),
                      // SizedBox(
                      //   height: 5.h,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     SizedBox(
                      //       height: 35.h,
                      //       width: 180.w,
                      //       child: TextFormField(
                      //         decoration: InputDecoration(
                      //           hintText: 'coupon code',
                      //           fillColor: textformback,
                      //           filled: true,
                      //           hintStyle:
                      //               myStyle(12.sp, FontWeight.w400, offWhite),
                      //           enabledBorder: const OutlineInputBorder(
                      //               borderSide: BorderSide.none),
                      //           focusedBorder: const OutlineInputBorder(
                      //               borderSide: BorderSide.none),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 15.h,
                      //     ),
                      //     Container(
                      //       alignment: Alignment.center,
                      //       padding: EdgeInsets.symmetric(horizontal: 20.w),
                      //       height: 35.h,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(4.r),
                      //           border: Border.all(
                      //               color: themeColorGreen, width: 1)),
                      //       child: Text(
                      //         'Apply',
                      //         style: myStyle(14.sp, FontWeight.w400, textClr),
                      //       ),
                      //     )
                      //   ],
                      // ),

                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Credit transaction log',
                        style: myStyle(18.sp, FontWeight.w500, textClr),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        height: 30.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: containerClr),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'ID',
                              style: myStyle(12.sp, FontWeight.w400, textClr),
                            ),
                            Text(
                              'Description',
                              style: myStyle(12.r, FontWeight.w400, textClr),
                            ),
                            Text(
                              'Credits',
                              style: myStyle(12.r, FontWeight.w400, textClr),
                            ),
                            Text(
                              'Date',
                              style: myStyle(12.h, FontWeight.w400, textClr),
                            ),
                          ],
                        ),
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var data =
                                _creditController.creditTransactionList[index];
                            var date = Jiffy.parse('${data.date}').yMMMd;
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top:
                                          BorderSide(color: offWhite, width: 1),
                                      bottom: BorderSide(
                                          color: offWhite, width: 1))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data.id.toString(),
                                    style: myStyle(
                                        12.sp, FontWeight.w400, textClr),
                                  ),
                                  Text(
                                    "${data.leadPostCredit} credits used to reply",
                                    style: myStyle(
                                        12.sp, FontWeight.w400, textClr),
                                  ),
                                  Text(
                                    data.leadPostCredit.toString(),
                                    style: myStyle(
                                        12.sp, FontWeight.w400, textClr),
                                  ),
                                  Text(
                                    date,
                                    style: myStyle(
                                        12.sp, FontWeight.w400, textClr),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 15.h,
                              ),
                          itemCount:
                              _creditController.creditTransactionList.length),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  buildContainer(String responce, String credit, String amount) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: offWhite.withOpacity(0.3), width: .5),
            bottom: BorderSide(color: offWhite.withOpacity(0.3), width: .5)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                responce,
                style: myStyle(14.sp, FontWeight.w400, textClr),
              ),
              Row(
                children: [
                  Image.asset(
                    'images/credits.png',
                    width: 30.w,
                  ),
                  Text(
                    credit,
                    style: myStyle(14.sp, FontWeight.w400, textClr),
                  ),
                ],
              ),
              Text(
                amount,
                style: myStyle(12.sp, FontWeight.w400, textClr),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Checkbox(
                checkColor: scaffoldClr,
                activeColor: themeColorGreen,
                hoverColor: themeColorGreen,
                value: false,
                side: const BorderSide(color: themeColorGreen, width: 2),
                onChanged: (value) {},
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                'Auto top-up next time',
                style: myStyle(14.sp, FontWeight.w400, textClr),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.center,
                height: 34.h,
                width: 109.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    color: backIconClr),
                child: Text(
                  'Buy Credits',
                  style: myStyle(14.sp, FontWeight.w400, scaffoldClr),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
