import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorSeed = Color(0xff424CB8);
const scaffoldBackgroundColor = Color.fromARGB(255, 239, 239, 239);
const subtitleColor = Color.fromARGB(255, 150, 150, 150);

class AppTheme {
  ThemeData getTheme() => ThemeData(

      ///* General
      useMaterial3: true,
      colorSchemeSeed: colorSeed,

      ///* Texts
      textTheme: TextTheme(
          titleLarge: GoogleFonts.montserratAlternates()
              .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
          titleMedium: GoogleFonts.montserratAlternates()
              .copyWith(fontSize: 30, fontWeight: FontWeight.bold, color: subtitleColor),
          titleSmall:
              GoogleFonts.montserratAlternates().copyWith(fontSize: 20)),

      ///* Scaffold Background Color
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      
      ///* Buttons
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
              textStyle: WidgetStatePropertyAll(
                  GoogleFonts.montserratAlternates()
                      .copyWith(fontWeight: FontWeight.w700)))),

      ///* AppBar
      appBarTheme: AppBarTheme(
        color: scaffoldBackgroundColor,
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: BorderSide.strokeAlignOutside,
        titleTextStyle: GoogleFonts.montserratAlternates().copyWith(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      ));
}
