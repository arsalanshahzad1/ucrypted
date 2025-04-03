import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';

class AppLoader {
  static void startLoading() {
    Get.dialog(const SimpleDialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(
            color: AppColors.textColor,
            backgroundColor: AppColors.white,
          ),
        )
      ],
    ));
  }

  static stopLoading() {
    Get.close(1);
  }
}
