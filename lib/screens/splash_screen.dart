import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ucrypted_app/screens/home_screen.dart';
import 'package:ucrypted_app/screens/onboarding_screen.dart';
import 'package:ucrypted_app/services/local/local_storage.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final isLoggedIn = await LocalStorage().isLoggedIn();
    await Future.delayed(const Duration(seconds: 3));
    if (isLoggedIn) {
      RoutingService.pushAndRemoveUntil(const HomeScreen());
    } else {
      RoutingService.pushAndRemoveUntil(const OnboardingScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/splash-new.png",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              "assets/svg/splash-logo.svg",
              width: 50,
              height: 50,
            ),
          )
        ],
      ),
    );
  }
}
