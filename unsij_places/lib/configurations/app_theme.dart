import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 5, 7, 5),
    surface: Color.fromARGB(255, 0, 0, 0));

final appTextTheme = GoogleFonts.robotoFlexTextTheme().copyWith(
  bodyMedium: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 24),
  bodyLarge: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 20),
  titleSmall: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 12),
  titleMedium: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16),
  titleLarge: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 18),
);

final appTheme = ThemeData().copyWith(
    scaffoldBackgroundColor: appColorScheme.surface,
    colorScheme: appColorScheme,
    textTheme: appTextTheme);
