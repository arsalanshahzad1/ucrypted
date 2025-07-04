import 'dart:ui';

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
            color: Color.fromARGB(255, 236, 143, 4),
          ),
        )
      ],
    ));
  }

  static stopLoading() {
    Get.close(1);
  }
}

class BlurLoader extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const BlurLoader({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.2),
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  color: Color.fromARGB(255, 236, 143, 4),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
