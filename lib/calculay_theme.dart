import 'package:calculay/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String kDarkBgColor = '#22252d';
String kDarkFgColor = '#292d36';
String kLightBgColor = '#ffffff';
String kLightFgColor = '#f9f9f9';
String kOperatorsColor = '#fd2d36';
String kDarkNumeralsColor = '#ffffff';
String kDarkNumeralsBgColor = '#272b33';
String kLightNumeralsColor = '#000000';
String kLightNumeralsBgColor = '#f7f7f7';
String kDarkOperandsColor = '#26d2b8';
String kLightOperandsColor = '#4faa9a'; // '#76fae2'
String kOffColor = '#5a5d64';
String kOnColor = '#c6c6c9';

class CalculayTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: hexColor(kLightNumeralsColor),
    ),
    displayLarge: GoogleFonts.poppins(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: hexColor(kLightNumeralsColor),
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: hexColor(kLightNumeralsColor),
    ),
    displaySmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: hexColor(kLightNumeralsColor),
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: hexColor(kLightNumeralsColor),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: hexColor(kDarkNumeralsColor),
    ),
    displayLarge: GoogleFonts.poppins(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: hexColor(kDarkNumeralsColor),
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: hexColor(kDarkNumeralsColor),
    ),
    displaySmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: hexColor(kDarkNumeralsColor),
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: hexColor(kDarkNumeralsColor),
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return Colors.black;
        }),
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: hexColor(kLightFgColor),
        backgroundColor: hexColor(kLightBgColor),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: hexColor(kDarkFgColor),
        backgroundColor: hexColor(kDarkBgColor),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: darkTextTheme,
    );
  }
}
