import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/home_screen.dart';
import 'package:ucrypted_app/screens/login_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class InputRecoverySuccessScreen extends StatefulWidget {
  const InputRecoverySuccessScreen({super.key});

  @override
  State<InputRecoverySuccessScreen> createState() => _InputRecoverySuccessScreenState();
}

class _InputRecoverySuccessScreenState extends State<InputRecoverySuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/bg1.png",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    100.vSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 90.h,
                          width: 90.w,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff21808C1A).withOpacity(0.1)),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: SvgPicture.asset(
                              "assets/svg/success.svg",
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Input Success",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: AppColors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    20.vSpace,
                    Text(
                      "Your secret recovery word has been successfully verified and saved. Keep it safe",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(color: Color(0xff6C7278), fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  RoutingService.pushAndRemoveUntil(const HomeScreen());
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFFCA509), Color(0xFF880306)],
                    ),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(
                    child: Text(
                      "Go to Home",
                      style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
