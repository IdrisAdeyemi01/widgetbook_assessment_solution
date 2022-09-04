import 'package:flutter/cupertino.dart';

/// Helper class for the app's screen utility
class ScreenUtil {
  /// Method for providing the screen's height on-demand
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Method for providing the screen's width on-demand
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
