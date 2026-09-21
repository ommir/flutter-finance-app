import 'package:flutter/material.dart';

class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 20;
  static const double button = 24;
}

class AppColors {
  static const background = Colors.white;
  static const primaryBrown = Colors.brown;

  static const textPrimary = Color(0xFF111111);
  static const textSecondary = Colors.grey;
  static const indicatorActive = Color(0xFF307E2C);
  static const indicatorInactive = Color(0xFFE0E0E0);

  static const divider = Color(0xFFEDEDED);
  static const bgOverlay = Color(0x3B000000);

  static const card = Colors.white;
  static const iconBg = Color(0xFFEFE7E5);
  static const border = Color(0xFFE5E7EB);
}

class AppInput {
  static const height = 56.0;
  static const radius = 14.0;
}

class AppShadow {
  static const soft = BoxShadow(
    color: Color(0x14000000),
    blurRadius: 12,
    offset: Offset(0, 4),
  ); // BoxShadow
}

class AppOtp {
  static const boxSize = 56.0;
  static const radius = 14.0;
}

class DashboardSizes {
  static const headerRadius = 32.0;
  static const iconCircle = 56.0;
}