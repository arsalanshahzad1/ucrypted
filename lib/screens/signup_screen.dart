import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/login_screen.dart';
import 'package:ucrypted_app/screens/recovery_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/app_print.dart';
import 'package:ucrypted_app/utilities/custom_textfield.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isTandC = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ScaffoldWithBackground(
          backgroundImage: "assets/images/onboard.png",
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 30 : 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  60.vSpace,
                  Row(
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(color: AppColors.disableBtnColor, shape: BoxShape.circle),
                      ),
                      5.hSpace,
                      Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(color: AppColors.disableBtnColor, shape: BoxShape.circle),
                      ),
                      5.hSpace,
                      Container(
                        height: 8,
                        width: 20,
                        decoration: BoxDecoration(color: const Color(0xFFDDDCFE), borderRadius: BorderRadius.circular(12)),
                      )
                    ],
                  ),
                  30.vSpace,
                  Text(
                    "Create account",
                    style: isTablet
                        ? GoogleFonts.inter(
                            color: AppColors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          )
                        : GoogleFonts.inter(
                            color: AppColors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                          ),
                  ),
                  5.vSpace,
                  Text(
                    "Let's create new account",
                    style: isTablet
                        ? GoogleFonts.inter(
                            color: AppColors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )
                        : GoogleFonts.inter(
                            color: AppColors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                  ),
                  25.vSpace,
                  SocialAuthBtn(
                    onTap: () {
                      appPrint("Continue with Facebook");
                    },
                    imagePath: "assets/svg/fb.svg",
                    text: "Continue with Facebook",
                  ),
                  10.vSpace,
                  SocialAuthBtn(
                    onTap: () {
                      appPrint("Continue with Google");
                    },
                    imagePath: "assets/svg/google.svg",
                    text: "Continue with Google",
                  ),
                  10.vSpace,
                  SocialAuthBtn(
                    onTap: () {
                      appPrint("Continue with Apple");
                    },
                    imagePath: "assets/svg/apple.svg",
                    text: "Continue with Apple",
                  ),
                  10.vSpace,
                  SocialAuthBtn(
                    onTap: () {
                      appPrint("Continue with Metamask");
                    },
                    imagePath: "assets/svg/metamask.svg",
                    text: "SignUp With Metamask",
                  ),
                  30.vSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Color(0xff393737),
                          thickness: 1,
                          indent: 0,
                          endIndent: 10,
                        ),
                      ),
                      Text(
                        "Or",
                        style: GoogleFonts.poppins(
                          color: Color(0xff7E8088),
                          fontSize: isTablet ? 16 : 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Color(0xff393737),
                          thickness: 1,
                          indent: 10,
                          endIndent: 0,
                        ),
                      ),
                    ],
                  ),
                  20.vSpace,

                  //For Name
                  Text(
                    "Name",
                    style: GoogleFonts.inter(color: Color(0xff93989F), fontSize: isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                  ),
                  5.vSpace,
                  CustomTextField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.emailAddress,
                    isPassword: false,
                    hintText: "Tony Nguyen",
                  ),

                  20.vSpace,

                  //For Email
                  Text(
                    "Email",
                    style: GoogleFonts.inter(color: Color(0xff93989F), fontSize: isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                  ),
                  5.vSpace,
                  CustomTextField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.emailAddress,
                    isPassword: false,
                    hintText: "Example@gmail",
                  ),

                  20.vSpace,

                  //For Phone Number
                  Text(
                    "Phone Number",
                    style: GoogleFonts.inter(color: Color(0xff93989F), fontSize: isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                  ),
                  5.vSpace,
                  CustomTextField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.number,
                    isPassword: false,
                    hintText: "123 456 789",
                  ),

                  20.vSpace,

                  //For Password
                  Text(
                    "Password",
                    style: GoogleFonts.inter(color: Color(0xff93989F), fontSize: isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                  ),
                  5.vSpace,
                  CustomTextField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.emailAddress,
                    isPassword: true,
                    hintText: "6 -20 characters",
                  ),

                  20.vSpace,

                  //For Confirm Password
                  Text(
                    "Confirm Password",
                    style: GoogleFonts.inter(color: Color(0xffffffff), fontSize: isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                  ),
                  10.vSpace,
                  CustomTextField2(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.emailAddress,
                    isPassword: true,
                    hintText: "hi.avitex@gmail.com l",
                  ),
                  20.vSpace,
                  Row(
                    children: [
                      SizedBox(
                        height: 15.h,
                        width: 15.w,
                        child: SvgPicture.asset("assets/svg/r1.svg"),
                      ),
                      // SizedBox(
                      //   height: 24.h,
                      //   width: 24.w,
                      //   child: Checkbox(
                      //     value: isTandC,
                      //     onChanged: (bool? newValue) {
                      //       setState(() {
                      //         isTandC = newValue ?? false;
                      //       });
                      //     },
                      //     activeColor: Colors.green,
                      //   ),
                      // ),
                      5.hSpace,
                      Row(
                        children: [
                          Text(
                            "I agree to ",
                            style: GoogleFonts.poppins(color: Color(0xff7E8088), fontSize: isTablet ? 16 : 14),
                          ),
                          Text(
                            "Terms and Condition",
                            style: GoogleFonts.poppins(color: AppColors.white, fontSize: isTablet ? 16 : 14),
                          )
                        ],
                      ),
                    ],
                  ),

                  30.vSpace,

                  GestureDetector(
                    onTap: () {
                      RoutingService.push(const RecoveryScreem());
                    },
                    child: Container(
                      height: isTablet ? 45.h : 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                        borderRadius: BorderRadius.circular(isTablet ? 40 : 28),
                      ),
                      child: Center(
                        child: Text(
                          "Signup",
                          style: isTablet
                              ? GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 22)
                              : GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  10.vSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: GoogleFonts.inter(color: Colors.white, fontSize: isTablet ? 16 : 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          RoutingService.push(const LoginScreen());
                        },
                        child: Text(
                          "Log In",
                          style: GoogleFonts.inter(
                            color: Colors.blue,
                            fontSize: isTablet ? 16 : 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.vSpace,
                ],
              ),
            ),
          )),
    );
  }
}
