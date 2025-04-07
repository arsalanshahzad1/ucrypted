import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/home_screen.dart';
import 'package:ucrypted_app/screens/reset_password_screen.dart';
import 'package:ucrypted_app/screens/signup_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/app_print.dart';
import 'package:ucrypted_app/utilities/custom_textfield.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ScaffoldWithBackground(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
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
                "Login",
                style: GoogleFonts.inter(color: AppColors.white, fontSize: 36, fontWeight: FontWeight.w500),
              ),
              5.vSpace,
              Text(
                "Let's create new account",
                style: GoogleFonts.inter(
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
                text: "Login With Metamask",
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
                      color: const Color(0xff7E8088),
                      fontSize: 14,
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
              //For Email
              Text(
                "Email",
                style: GoogleFonts.inter(color: const Color(0xff93989F), fontSize: 14, fontWeight: FontWeight.w400),
              ),
              10.vSpace,
              CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                isPassword: false,
                hintText: "Example@gmail",
              ),
              10.vSpace,
              //For Password
              Text(
                "Password",
                style: GoogleFonts.inter(color: const Color(0xff93989F), fontSize: 14, fontWeight: FontWeight.w400),
              ),
              10.vSpace,
              CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                isPassword: true,
                hintText: "*****l",
                color: Color(0xff222223),
              ),

              10.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      RoutingService.push(const ResetPasswordScreen());
                    },
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.poppins(
                        color: Color(0xff7E8088),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: Checkbox(
                      value: isRememberMe,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isRememberMe = newValue ?? false;
                        });
                      },
                      activeColor: Colors.orange,
                      fillColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.orange;
                        }
                        return Colors.grey[300];
                      }),
                    ),
                  ),
                  5.hSpace,
                  Text(
                    "Remember Me",
                    style: GoogleFonts.inter(fontSize: 14, color: Color(0xff93989F), fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              20.vSpace,
              GestureDetector(
                onTap: () {
                  RoutingService.pushAndRemoveUntil(const HomeScreen());
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(
                    child: Text(
                      "Log In",
                      style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 18),
                    ),
                  ),
                ),
              ),
              20.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Doesn't have an account? ",
                    style: GoogleFonts.inter(color: Color(0xFF93989F), fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      RoutingService.push(const SignUpScreen());
                    },
                    child: Text(
                      "Sign up",
                      style: GoogleFonts.inter(
                        color: Color(0Xff6179FD),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              80.vSpace,
            ],
          ),
        ),
      )),
    );
  }
}

class SocialAuthBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final String text;

  const SocialAuthBtn({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff171717),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xff393737), width: 1.0),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(imagePath),
              10.hSpace,
              Text(
                text,
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
