import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
      color: Colors.black87,
      fontSize: 26,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: GoogleFonts.poppins(
      color: Colors.black87,
      fontSize: 24,
    ),
    bodyLarge: GoogleFonts.poppins(
      color: Colors.black87,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: GoogleFonts.poppins(
      color: Colors.black87,
      fontSize: 14,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
      color: Colors.white70,
      fontSize: 26,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: GoogleFonts.poppins(
      color: Colors.white60,
      fontSize: 24,
    ),
    bodyLarge: GoogleFonts.poppins(
      color: Colors.white70,
      fontSize: 16,
    ),
    bodySmall: GoogleFonts.poppins(
      color: Colors.white70,
      fontSize: 14,
    ),
  );
}