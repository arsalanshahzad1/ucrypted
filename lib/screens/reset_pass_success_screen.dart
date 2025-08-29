import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/create_new_pass_screen.dart';
import 'package:ucrypted_app/screens/home_screen.dart';
import 'package:ucrypted_app/screens/login_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class ResetPassSuccessScreen extends StatefulWidget {
  const ResetPassSuccessScreen({super.key});

  @override
  State<ResetPassSuccessScreen> createState() => _ResetPassSuccessScreenState();
}

class _ResetPassSuccessScreenState extends State<ResetPassSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/bg1.png",
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenService.isTablet ? 30 : 20),
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
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(color: Color.fromARGB(32, 87, 140, 26), borderRadius: BorderRadius.circular(90)),
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
                    20.vSpace,
                    ScreenService.isTablet
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Reset password successful",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  color: AppColors.white,
                                  fontSize: ScreenService.isTablet ? 36 : 32,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            "Reset password successful",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: AppColors.white,
                              fontSize: ScreenService.isTablet ? 36 : 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    20.vSpace,
                    ScreenService.isTablet
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Successfully changed password. Please login again",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(color: Color(0xff6C7278), fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        : Text(
                            "Successfully changed password. Please login again",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(color: Color(0xff6C7278), fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w500),
                          ),
                  ],
                ),
              ),
            ),
            // Button at the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  RoutingService.pushAndRemoveUntil(const LoginScreen());
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
                      "Go to Login",
                      style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: ScreenService.isTablet ? 22 : 18,
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
