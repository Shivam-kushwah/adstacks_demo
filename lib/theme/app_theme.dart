import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.scaffold,
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme).apply(
        bodyColor: AppColors.textDark,
        displayColor: AppColors.textDark,
      ),
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.purple,
        surface: Colors.white,
      ),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
    );
  }
}


class Responsive {
  static const double mobileMax = 720;
  static const double tabletMax = 1180;

  static bool isMobile(BuildContext c) =>
      MediaQuery.sizeOf(c).width < mobileMax;

  static bool isTablet(BuildContext c) {
    final w = MediaQuery.sizeOf(c).width;
    return w >= mobileMax && w < tabletMax;
  }

  static bool isDesktop(BuildContext c) =>
      MediaQuery.sizeOf(c).width >= tabletMax;
}
