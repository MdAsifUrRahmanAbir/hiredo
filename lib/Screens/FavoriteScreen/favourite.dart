// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/HomeScreen/home.dart';

class Favourite extends StatefulWidget {
  static const String routename = '/favpage';
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  String _selectedGender = 'Top Categories';

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 50.h,
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.r)),
                              borderSide: BorderSide(color: Color(0xff9CCDB5))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0.r)),
                              borderSide: BorderSide(color: Color(0xff9CCDB5))),
                          hintText: "Search ",
                          hintStyle: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                              color: Color(0xffB7B7B7)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      color: Color(0xff187949),
                      height: 50.h,
                      width: 45.w,
                      child: Icon(
                        Icons.search,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(10.w),
                child: Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListTile(
                          trailing: Radio<String>(
                            activeColor: Color(0xff187949),
                            value: 'Top Categories',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value!;
                              });
                            },
                          ),
                          leading: Text('Top Categories',
                              style: GoogleFonts.roboto(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff272727))),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 10,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2.3,
                            ),
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 5.w,
                                      right: 5.w,
                                      bottom: 5.w,
                                      top: 5.h),
                                  child: Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(
                                            color: Color(0xff9CCDB5),
                                          )),
                                      child: ListTile(
                                        leading: Text(
                                          "Hair",
                                          style: GoogleFonts.roboto(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff272727)),
                                        ),
                                        trailing: Icon(
                                          Icons.fingerprint,
                                          color: Color(0xff187949),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(flex: 3, child: Container())
          ],
        ),
      ),
    );
  }
}
