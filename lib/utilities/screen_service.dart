// screen_service.dart
import 'package:flutter/material.dart';

class ScreenService {
  static late MediaQueryData _mediaQueryData;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
  }

  static double get width => _mediaQueryData.size.width;

  static bool get isTablet => width >= 600 && width < 1024;

  static bool get isMobile => width < 600;

  static bool get isDesktop => width >= 1024;
}
