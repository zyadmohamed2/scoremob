import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme();

  ThemeData toThemeData() {
    return ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black45,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.poppinsTextTheme());
  }
}
