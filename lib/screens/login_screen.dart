import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/controllers/auth_controller.dart';
import 'package:ucrypted_app/screens/app_imports.dart';
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
  final AuthController authController = Get.put(AuthController());
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return Obx(() {
      return BlurLoader(
        isLoading: authController.loginLoader.value,
        child: GestureDetector(
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
                        "Login",
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
                            style: isTablet
                                ? GoogleFonts.poppins(
                                    color: const Color(0xff7E8088),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  )
                                : GoogleFonts.poppins(
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
                        style: GoogleFonts.inter(color: const Color(0xff93989F), fontSize: isTablet ? 15 : 14, fontWeight: FontWeight.w400),
                      ),
                      10.vSpace,
                      CustomTextField(
                        controller: authController.emailControllerLogin,
                        keyboardType: TextInputType.emailAddress,
                        isPassword: false,
                        hintText: "Example@gmail",
                      ),
                      10.vSpace,
                      //For Password
                      Text(
                        "Password",
                        style: GoogleFonts.inter(color: const Color(0xff93989F), fontSize: isTablet ? 15 : 14, fontWeight: FontWeight.w400),
                      ),
                      10.vSpace,
                      CustomTextField2(
                        controller: authController.passwordControllerLogin,
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
                                fontSize: isTablet ? 15 : 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 25, 
                                width: 25,
                                child: Transform.scale(
                                  scale: 0.89,
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      unselectedWidgetColor: Colors.white,
                                    ),
                                    child: Checkbox(
                                      value: isChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = value ?? false;
                                        });
                                      },
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                      side: const BorderSide(color: Colors.white),
                                      activeColor: Colors.white,
                                      checkColor: Colors.orange,
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: VisualDensity.compact, 
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Remember Me",
                                style: GoogleFonts.inter(
                                  fontSize: isTablet ? 15 : 14,
                                  color: const Color(0xff93989F),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      20.vSpace,
                      GestureDetector(
                        onTap: () {
                          authController.onLogin();
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
                              "Log In",
                              style: isTablet
                                  ? GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 22)
                                  : GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      20.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Doesn’t have an Account? ",
                            style: GoogleFonts.inter(
                              color: Color(0xFF93989F),
                              fontSize: isTablet ? 16 : 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              RoutingService.push(const SignUpScreen());
                            },
                            child: Text(
                              "SignUp",
                              style: GoogleFonts.inter(
                                color: Color(0Xff6179FD),
                                fontSize: isTablet ? 16 : 14,
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
        ),
      );
    });
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: isTablet ? 55.h : 50,
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
              isTablet
                  ? SvgPicture.asset(
                      imagePath,
                      height: 20.h,
                      width: 20.w,
                    )
                  : SvgPicture.asset(imagePath),
              10.hSpace,
              Text(
                text,
                style: isTablet ? GoogleFonts.poppins(color: AppColors.white, fontSize: 17) : GoogleFonts.poppins(color: AppColors.white, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
