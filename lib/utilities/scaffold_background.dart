import 'package:flutter/material.dart';

class ScaffoldWithBackground extends StatelessWidget {
  final Widget child;
  final Widget? bottomNavChild;
  final String? backgroundImage;

  const ScaffoldWithBackground({
    super.key,
    required this.child,
    this.bottomNavChild,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavChild,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage(backgroundImage ?? 'assets/images/background.png'),
              fit: backgroundImage != null ? BoxFit.fill : BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
            )),
        child: child,
      ),
    );
  }
}
