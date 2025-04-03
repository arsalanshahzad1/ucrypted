import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ucrypted_app/screens/onboarding_screen.dart';
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

    //Just Check using pseudo code
    // isUserLoggedIn -> pushAndRemoveUntil (Home/DashboardScreen)
    // !isUserLoggedIn -> pushAndRemoveUntil (OnboardingScreen)
    Future.delayed(const Duration(seconds: 3), () {
      RoutingService.pushAndRemoveUntil(const OnboardingScreen());

    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
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
