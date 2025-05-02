import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/reset_pass_success_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/gradient_text.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class CreateNewPassScreen extends StatefulWidget {
  const CreateNewPassScreen({super.key});

  @override
  State<CreateNewPassScreen> createState() => _CreateNewPassScreenState();
}

class _CreateNewPassScreenState extends State<CreateNewPassScreen> {
  bool _obscureText = true;

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
                      "Create New Password",
                      style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontSize: ScreenService.isTablet ? 32 : 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    5.vSpace,
                    Text(
                      "Let's create a new and more secure password",
                      style: GoogleFonts.inter(color: Color(0xff6C7278), fontSize: ScreenService.isTablet ? 18 : 14, fontWeight: FontWeight.w500),
                    ),
                    30.vSpace,
                    Text(
                      "Password",
                      style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: ScreenService.isTablet ? 16 : 12, fontWeight: FontWeight.w500),
                    ),
                    10.vSpace,
                    TextField(
                      obscureText: _obscureText,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF2C2C30),
                        hintStyle: GoogleFonts.inter(
                          fontSize: ScreenService.isTablet ? 16 : 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        hintText: "********",
                        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        suffixIcon: IconButton(
                          icon: SvgPicture.asset(
                            'assets/svg/eyeclose.svg',
                            colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xff44444A)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xff44444A)),
                        ),
                      ),
                    ),
                    20.vSpace,
                    Text(
                      "Repeat Password",
                      style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: ScreenService.isTablet ? 16 : 12, fontWeight: FontWeight.w500),
                    ),
                    10.vSpace,
                    TextField(
                      obscureText: _obscureText,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF2C2C30),
                        hintStyle: GoogleFonts.inter(
                          fontSize: ScreenService.isTablet ? 16 : 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        hintText: "********",
                        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        suffixIcon: IconButton(
                          icon: SvgPicture.asset(
                            'assets/svg/eyeclose.svg',
                            colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xff44444A)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xff44444A)),
                        ),
                      ),
                    ),
                    30.vSpace,
                    Text(
                      "Min 8 Characters with a combination of letters and numbers",
                      style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: ScreenService.isTablet ? 16 : 12, fontWeight: FontWeight.w400),
                    ),
                    30.vSpace,
                    PasswordStrengthMeter(strength: 3),
                  ],
                ),
              ),
            ),
            // Button at the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  RoutingService.push(const ResetPassSuccessScreen());
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
                      "Continue",
                      style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
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

class PasswordStrengthMeter extends StatelessWidget {
  final int strength; // Ranges from 0 to 4

  const PasswordStrengthMeter({super.key, required this.strength});

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [
      Color(0xFFFCA509), // Orange
      Color(0xFF880306), // Dark Red
    ];

    return Row(
      children: [
        // Strength Bars
        for (int i = 0; i < 4; i++)
          Expanded(
            child: Container(
              height: 4.h,
              margin: EdgeInsets.symmetric(horizontal: ScreenService.isTablet ? 10 : 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: i < strength
                    ? LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: gradientColors,
                      )
                    : null,
                color: i < strength ? null : Colors.grey[800], // Default gray for empty bars
              ),
            ),
          ),

        // Strength Text
        const SizedBox(width: 20),
        GradientText(_getStrengthText(),
            style: GoogleFonts.inter(fontSize: ScreenService.isTablet ? 15 : 12, fontWeight: FontWeight.w600),
            gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)])),
      ],
    );
  }

  String _getStrengthText() {
    switch (strength) {
      case 0:
        return "";
      case 1:
        return "Weak";
      case 2:
        return "Fair";
      case 3:
        return "Strong";
      case 4:
        return "Strong";
      default:
        return "";
    }
  }
}
