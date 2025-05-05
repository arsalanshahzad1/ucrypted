import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/input_rec_success_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class InputRecoveryscreen extends StatefulWidget {
  const InputRecoveryscreen({super.key});

  @override
  State<InputRecoveryscreen> createState() => _InputRecoveryscreenState();
}

class _InputRecoveryscreenState extends State<InputRecoveryscreen> {
  final List<TextEditingController> controllers = List.generate(14, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/bg1.png",
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isTablet ? 30 : 16),
        child: Column(
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
                    color: Color(0xffDCE4E8),
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
              "Input Recovery Word",
              style: GoogleFonts.inter(
                color: AppColors.white,
                fontSize: isTablet ? 34 : 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            5.vSpace,
            Text(
              "Enter the secret recovery word that was given previously in the correct order and sequence.",
              style: GoogleFonts.inter(
                color: AppColors.grey,
                fontSize: isTablet ? 18 : 14,
              ),
              textAlign: TextAlign.center,
            ),
            isTablet ? 30.vSpace : 50.vSpace,
            Expanded(
              child: GridView.builder(
                itemCount: 14,
                shrinkWrap: true,
                padding: const EdgeInsets.all(0.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: isTablet ? 3.9 : 3.2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Color.fromARGB(255, 34, 34, 37),
                        border: Border.all(
                          color: index == 0 ? Colors.white : Color(0xff44444A),
                        )),
                    child: TextField(
                      controller: controllers[index],
                      textAlign: TextAlign.center,
                      cursorColor: Colors.orange,
                      style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: index == 0 ? "1. Nebula" : "",
                          hintStyle: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: isTablet ? 16 : 14)),
                    ),
                  );
                },
              ),
            ),
            20.vSpace,
            GestureDetector(
              onTap: () {
                // RoutingService.push(const InputRecoveryscreen());
                !ScreenService.isTablet
                    ? Get.bottomSheet(bottomSheetContent(360.h, "Confirm Your Secret Recovery Word ?",
                        "This secret recovery word is crucial for accessing your account and cannot be recovered if lost. Are you sure you’ve entered it correctly ?", () {
                        RoutingService.push(const InputRecoverySuccessScreen());
                      }))
                    : showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        constraints: BoxConstraints(
                            // maxHeight: 1000,
                            ),
                        builder: (BuildContext context) {
                          return SafeArea(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xff1E1E20),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              padding: const EdgeInsets.all(20),
                              child: buildBottomSheetContent(context), // replace this with your Column/Widgets
                            ),
                          );
                        },
                      );
              },
              child: Container(
                height: isTablet ? 50.h : 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 34, 34, 37),
                  borderRadius: BorderRadius.circular(isTablet ? 32 : 28),
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: GoogleFonts.inter(color: Color(0xffACB5BB), fontWeight: FontWeight.w600, fontSize: isTablet ? 17 : 14),
                  ),
                ),
              ),
            ),
            10.vSpace,
          ],
        ),
      ),
    );
  }
}

Widget bottomSheetContent(
  double height,
  String title,
  String subtitle,
  VoidCallback onTap,
) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth, // ensures full width
        height: height,
        decoration: const BoxDecoration(
          color: Color(0xff1E1E20),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 4,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xff44444A),
                    ),
                  )
                ],
              ),
              10.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      "assets/images/siren.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              10.vSpace,
              Text(
                title,
                style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 24),
              ),
              10.vSpace,
              Text(
                subtitle,
                style: GoogleFonts.inter(color: Color(0xff6C7278), fontWeight: FontWeight.w500, fontSize: 14),
              ),
              40.vSpace,
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 55.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: Color.fromARGB(255, 34, 34, 37),
                          border: Border.all(color: Color(0xff44444A)),
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  20.hSpace,
                  Expanded(
                    child: GestureDetector(
                      onTap: onTap,
                      child: Container(
                        height: 55.h,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFFCA509), Color(0xFF880306)],
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Text(
                            "Confirm",
                            style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget bottomSheetContentTab(
  double height,
  String title,
  String subtitle,
  VoidCallback onTap,
) {
  return SafeArea(
    child: Container(
      width: double.infinity, // Full width
      constraints: BoxConstraints(
        maxWidth: 600, // Optional: limit on very large tablets
      ),
      decoration: const BoxDecoration(
        color: Color(0xff1E1E20),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Wraps content height
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              height: 4,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xff44444A),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            width: 40,
            child: Image.asset("assets/images/siren.png", fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              color: const Color(0xff6C7278),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pop(Get.context!),
                  child: Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color.fromARGB(255, 34, 34, 37),
                      border: Border.all(color: const Color(0xff44444A)),
                    ),
                    child: const Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFFCA509), Color(0xFF880306)],
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildBottomSheetContent(BuildContext context) {
  return SafeArea(
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 200.h,
      decoration: const BoxDecoration(
        color: Color(0xff1E1E20),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: 4,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xff44444A),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset("assets/images/siren.png", fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Confirm Your Secret Recovery Word?",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenService.isTablet ? 26 : 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "This secret recovery word is crucial for accessing your account and cannot be recovered if lost. Are you sure you’ve entered it correctly?",
            style: GoogleFonts.inter(
              color: Color(0xff6C7278),
              fontWeight: FontWeight.w500,
              fontSize: ScreenService.isTablet ? 18 : 14,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: ScreenService.isTablet ? 50 : 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color.fromARGB(255, 34, 34, 37),
                      border: Border.all(color: const Color(0xff44444A)),
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenService.isTablet ? 16 : 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    RoutingService.push(const InputRecoverySuccessScreen());
                  },
                  child: Container(
                    height: ScreenService.isTablet ? 50 : 45,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFFCA509), Color(0xFF880306)],
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenService.isTablet ? 18 : 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
