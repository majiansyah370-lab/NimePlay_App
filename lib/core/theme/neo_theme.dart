import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NeoColors {
  // Dark Mode Palette
  static const Color bg = Color(0xFF121212);
  static const Color surface = Color(0xFF1E1E1E);
  static const Color white = Colors.white;
  
  // Neon Colors
  static const Color neonGreen = Color(0xFF00FF41);
  static const Color neonBlue = Color(0xFF00E5FF);
  static const Color neonPink = Color(0xFFFF00FF);
  static const Color neonYellow = Color(0xFFFFFF00);
  static const Color neonRed = Color(0xFFFF3131);
}

class NeoTheme {
  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: NeoColors.bg,
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: NeoColors.white,
          displayColor: NeoColors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: NeoColors.bg,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: NeoColors.neonGreen),
          titleTextStyle: GoogleFonts.poppins(
            color: NeoColors.neonGreen,
            fontSize: 20,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
      );
}
