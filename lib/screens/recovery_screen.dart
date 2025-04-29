import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/input_recovery_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class RecoveryScreem extends StatefulWidget {
  const RecoveryScreem({super.key});

  @override
  State<RecoveryScreem> createState() => _RecoveryScreemState();
}

class _RecoveryScreemState extends State<RecoveryScreem> {
  final List<String> recoveryWords = [
    "Nebula",
    "Cipher",
    "Eclipse",
    "Quantum",
    "Mystique",
    "Raven",
    "Aurora",
    "Vortex",
    "Mirage",
    "Phoenix",
    "Seraph",
    "Specter",
    "Seraph",
    "Specter"
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/bg1.png",
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 30 : 20,
        ),
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
              "Secret Recovery Word",
              style: GoogleFonts.inter(
                color: AppColors.white,
                fontSize: isTablet ? 32 : 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            5.vSpace,
            Text(
              "This is the only way you will be able to recover your account. Please store it somewhere safe!",
              style: GoogleFonts.inter(color: Color(0xff6C7278), fontSize: isTablet ? 18 : 14, fontWeight: FontWeight.w500),
              textAlign: isTablet ? TextAlign.center : TextAlign.start,
            ),
            isTablet ? 30.vSpace : 50.vSpace,
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0.0),
                itemCount: recoveryWords.length,
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: isTablet ? 3.9 : 3.2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Color.fromARGB(255, 34, 34, 37),
                        border: Border.all(
                          color: Color(0xff44444A),
                        )),
                    child: Center(
                      child: Text(
                        "${index + 1}. ${recoveryWords[index]}",
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: isTablet ? 16 : 14,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            20.vSpace,
            GestureDetector(
              onTap: () {
                RoutingService.push(const InputRecoveryscreen());
              },
              child: Container(
                height: 45.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                  borderRadius: BorderRadius.circular(isTablet ? 32 : 28),
                ),
                child: Center(
                  child: Text(
                    "Confirm",
                    style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: isTablet ? 22 : 18),
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
