import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/create_new_pass_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/app_print.dart';
import 'package:ucrypted_app/utilities/custom_textfield.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                    50.vSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 100,
                          child: SvgPicture.asset(
                            "assets/svg/splash-logo.svg",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    30.vSpace,
                    Text(
                      "Reset Password",
                      style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontSize: ScreenService.isTablet ? 36 : 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    5.vSpace,
                    Text(
                      "Input your email address account to receive a reset link",
                      style: GoogleFonts.inter(
                        color: Color(0xff6C7278),
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenService.isTablet ? 18 : 14,
                      ),
                    ),
                    50.vSpace,
                    Text(
                      "Email",
                      style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: ScreenService.isTablet ? 16 : 12, fontWeight: FontWeight.w500),
                    ),
                    10.vSpace,
                    TextField(
                      style: TextStyle(color: Colors.white), // Text color inside
                      decoration: InputDecoration(
                        hintText: 'yourname@gmail.com',
                        hintStyle: GoogleFonts.inter(color: Colors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w500), // Placeholder color
                        filled: true,
                        fillColor: Color(0xFF2C2C30), // Inside background color of the field
                        contentPadding: EdgeInsets.symmetric(vertical: ScreenService.isTablet ? 15.0 : 12.0, horizontal: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Color(0xff44444A), // Border color when not focused
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: Color(0xff44444A), // Border color when focused
                            width: 1.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Button at the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  RoutingService.push(const CreateNewPassScreen());
                },
                child: Container(
                  height: ScreenService.isTablet ? 55 : 50,
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
                      "Continue",
                      style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: ScreenService.isTablet ? 20 : 18,
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
