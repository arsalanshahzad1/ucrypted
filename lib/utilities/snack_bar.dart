import 'package:get/get_core/src/get_main.dart';
import 'package:ucrypted_app/screens/app_imports.dart';

class SnackBars {
  void showSnackBar(String title, String message, Color bgColor) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: bgColor,
      colorText: Get.theme.colorScheme.onError,
      duration: const Duration(seconds: 2),
    );
  }
}