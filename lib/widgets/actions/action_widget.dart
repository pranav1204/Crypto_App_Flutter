import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Padding actionWidget(
    IconData actionIcon,
    String actionStr,
    ThemeData themeData,
    ) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 2.h),
    child: Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                actionIcon,
                size: 20.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 1.5.h),
          child: Text(
            actionStr,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
            ),
          ),
        ),
      ],
    ),
  );
}