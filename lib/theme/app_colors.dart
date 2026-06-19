import 'package:flutter/material.dart';


class AppColors {
  AppColors._();

  // Surfaces
  static const Color scaffold = Color(0xFFE9EAF0); // page background behind cards
  static const Color sidebar = Color(0xFFFFFFFF); // left navigation
  static const Color contentBg = Color(0xFFFFFFFF); // white content surface
  static const Color darkCard = Color(0xFF1C1E45); // "All Projects" / "Top Creators"
  static const Color darkPanel = Color(0xFF15173A); // right rail background
  static const Color darkPanelCard = Color(0xFF20224B); // inner cards in right rail

  // Brand / accents
  static const Color purple = Color(0xFF6C4EE6);
  static const Color purpleSoft = Color(0xFF8E6CF0);
  static const Color lavenderActive = Color(0xFFF1EEFE); // active nav item bg
  static const Color pink = Color(0xFFE85C8A); // "Pending Done" line
  static const Color blue = Color(0xFF5B6BE5); // "Project Done" line

  // Hero gradient
  static const Color heroStart = Color(0xFF5B4DE0);
  static const Color heroMid = Color(0xFF8A4FE0);
  static const Color heroEnd = Color(0xFFC24FD6);

  // Project highlight (coral) gradient
  static const Color coralStart = Color(0xFFE85C6E);
  static const Color coralEnd = Color(0xFFE0556B);

  // Text
  static const Color textDark = Color(0xFF24243A);
  static const Color textGrey = Color(0xFF9A9AB2);
  static const Color textMuted = Color(0xFFB9B9CC);
  static const Color onDark = Color(0xFFFFFFFF);
  static const Color onDarkMuted = Color(0xFF9C9EC4);

  // Misc
  static const Color divider = Color(0xFFEDEDF3);
}
