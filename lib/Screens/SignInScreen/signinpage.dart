import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/HomeScreen/home.dart';
import 'package:myapp/Screens/IntroScreen/signupintropage.dart';
import 'package:myapp/Screens/ResistrationScreen/Controller/registration_controller.dart';
import 'package:myapp/Screens/ResistrationScreen/component/custom_button.dart';
import 'package:myapp/Screens/ResistrationScreen/component/custome_text_field.dart';
import 'package:myapp/Screens/SignInScreen/Contoller/signin_controller.dart';
import 'package:myapp/Screens/SignInScreen/Model/error_model.dart';
import 'package:myapp/Screens/SignInScreen/Model/sign_in_model.dart';
import 'package:myapp/local/my_local.dart';
import 'package:myapp/nav_bar_page/nav_bar_controller.dart';
import 'package:myapp/utils/colors.dart';
import '../ForgetPasswordScreen/forgotpasswordpage.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _signInController = Get.put(SignInController());

  final _registrationController = Get.put(RegistrationController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late SignInModel signInModel;
  late SignInErrorModel _signInErrorModel;

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(90.r),
                      topRight: Radius.circular(90.r),
                      bottomLeft: Radius.circular(90.r),
                      bottomRight: Radius.circular(90.r)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: themeColorGreen,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Form(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Sign in to your account',
                        style: GoogleFonts.roboto(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff555957)),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        height: 82.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Email',
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff555957)),
                                ),
                                Text(
                                  '*',
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff555957)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            CustomeTextField(
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Feild is Empty';
                                } else if (value.contains('@') &&
                                    !value.contains('.')) {
                                  return 'Invalid Your Email';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 82.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Password',
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff555957)),
                                ),
                                Text(
                                  '*',
                                  style: GoogleFonts.roboto(
                                      color: Colors.red,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            CustomeTextField(
                              controller: passwordController,
                              obscureText:
                                  _registrationController.isVisibility.value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Your Password";
                                } else if (value.length < 8) {
                                  return 'Password required must be 8 character';
                                }
                                return null;
                              },
                              hintText: '********',
                              suffixIcon: Obx(
                                () => IconButton(
                                    onPressed: () {
                                      _registrationController
                                              .isVisibility.value =
                                          !_registrationController
                                              .isVisibility.value;
                                    },
                                    icon: Icon(
                                        _registrationController
                                                .isVisibility.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(
                        () => InkWell(
                          onTap: () {
                            _signInController.isChecked.value =
                                !_signInController.isChecked.value;
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20.w,
                                child: Checkbox(
                                  activeColor: themeColorGreen,
                                  value: _signInController.isChecked.value,
                                  onChanged: (value) {
                                    _signInController.isChecked.value =
                                        !_signInController.isChecked.value;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'Remember me',
                                style: GoogleFonts.roboto(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff555957)),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : InkWell(
                              onTap: () {
                                print("login");

                                login();
                              },
                              child: Container(
                                height: 50.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF187949),
                                    borderRadius: BorderRadius.circular(4.r)),
                                child: Center(
                                  child: Text(
                                    'Sign In',
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ForegPasswordPage()));
                          },
                          child: Text(
                            'Forgot the password?',
                            style: GoogleFonts.roboto(
                                fontSize: 18.sp, color: themeColorGreen),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an accout?",
                            style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff555957)),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => SignIntroPage()));
                              },
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.roboto(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff555957)),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<SignInModel?> login() async {
    setState(() {
      isLoading = true;
    });

    Map<String, dynamic> body = {
      "email": emailController.text,
      "password": passwordController.text
    };

    var response = await http.post(
        Uri.parse('http://ringknock.pythonanywhere.com//login/'),
        body: body,
        headers: {'Accept': "application/json"});

    if (response.statusCode == 200) {
      signInModel = signInModelFromMap(response.body);
      setState(() {
        Fluttertoast.showToast(
            msg: "${signInModel.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.sp);
      });

      setState(() {
        isLoading = false;
      });
      print("Respnse ${response.body}");

      MyPreference.setToken(signInModel.token.toString());

      Navigator.push(
          context, MaterialPageRoute(builder: (_) => BottomNavController()));
    } else if (response.statusCode == 404) {
      _signInErrorModel = signInErrorModelFromMap(response.body);
      setState(() {
        Fluttertoast.showToast(
            msg: "${_signInErrorModel.errors}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.sp);
      });
    }
  }
}
