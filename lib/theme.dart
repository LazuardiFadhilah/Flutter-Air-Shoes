// ignore_for_file: unused_import

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color bgColor = const Color(0xffF5F8F7);
Color whiteColor = const Color(0xffFFFFFF);
Color secondaryWhiteColor = const Color(0xffF3F3F3);
Color blackColor = const Color(0xff1B2028);
Color greyColor = const Color(0xffA4AAAD);
Color secondaryGreyColor = const Color(0xff969696);
Color orangeColor = const Color(0xffEB7430);
Color secondaryorangeColor = const Color(0xffC87A1F);
Color thirdOrangeColor = const Color(0xffEF4F28);
Color fourOrangeColor = const Color(0xffFFB865);
Color purpleColor = const Color(0xff6B00BF);
Color secondaryPurpleColor = const Color(0xffBF82EF);
Color thirdPurpleColor = const Color(0xffB072E1);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

TextStyle buttonTextStyle = GoogleFonts.poppins(
  color: blackColor,
  fontSize: 14,
  fontWeight: regular,
);

TextStyle cartTextStyle = GoogleFonts.poppins(
  color: whiteColor,
  fontSize: 16,
  fontWeight: regular,
);

TextStyle titleTextStyle = GoogleFonts.poppins(
  color: blackColor,
  fontSize: 14,
  fontWeight: semiBold,
);

TextStyle descTextStyle = GoogleFonts.poppins(
  color: secondaryGreyColor,
  fontSize: 10,
  fontWeight: regular,
);

TextStyle secondaryButtonTextStyle = GoogleFonts.poppins(
  color: whiteColor,
  fontSize: 12,
  fontWeight: medium,
);

class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}
