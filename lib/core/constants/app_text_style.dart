import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle{
  //Style for headings
  static TextStyle h1 = GoogleFonts.poppins(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    height: 1.5,
    letterSpacing: -0.5,
  );

  //Style for subheadings
  static TextStyle subtitle = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.grey[600],
  );

  //Style for body text
  static TextStyle textLarge = GoogleFonts.inter(
    fontSize: 16,
    height: 1.5,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  static TextStyle text = GoogleFonts.inter(
    fontSize: 14,
    height: 1.5,
    color: Colors.black,
    fontWeight: FontWeight.w300,
  );

  // Button Text
  static TextStyle buttonLarge = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static TextStyle buttonMedium = GoogleFonts.montserrat(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static TextStyle buttonSmall = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  //func for text color variants
  static TextStyle withColor(TextStyle textStyle, Color color) {
    return textStyle.copyWith(
      color: color,
    );
  }

  //func for text weight variants
  static TextStyle withWeight(TextStyle textStyle, FontWeight weight) {
    return textStyle.copyWith(
      fontWeight: weight,
    );
  }

}