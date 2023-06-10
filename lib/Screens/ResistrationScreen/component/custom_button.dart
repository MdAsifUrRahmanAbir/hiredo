import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
 const CustomButton({super.key, required this.title, required this.onTap});
 final String title;
 final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xFF187949),
            borderRadius: BorderRadius.circular(4.r)),
        child: Center(
            child: Text(
          title,
          style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
