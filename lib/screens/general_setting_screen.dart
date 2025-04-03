import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class GeneralSettingScreen extends StatefulWidget {
  const GeneralSettingScreen({super.key});

  @override
  State<GeneralSettingScreen> createState() => _GeneralSettingScreenState();
}

class _GeneralSettingScreenState extends State<GeneralSettingScreen> {
  String? sLanguage;
  String? sCurrency;
  String? stimeZone;
  String? stimeFormat;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/background1.png",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.vSpace,
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      "General Settings",
                      style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1, // 1 part
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset("assets/svg/inof.svg"),
                  ),
                ),
              ],
            ),
            30.vSpace,
            Text(
              "Language",
              style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            20.vSpace,
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF212121),
                  border: Border.all(color: Color(0xff44444A)),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: AppColors.disableBtnColor,
                    value: sLanguage,
                    hint: Text(
                      "Select Language",
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    icon: Row(
                      children: [
                        Image.asset(
                          "assets/images/drop.png",
                          color: Colors.white,
                        ),
                        5.hSpace,
                      ],
                    ),
                    items: ["English (USA)", "Spanish", "French"]
                        .map((method) => DropdownMenuItem(
                              value: method,
                              child: Text(method, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14)),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        sLanguage = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            25.vSpace,
            Text(
              "Currency Display",
              style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            20.vSpace,
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF212121),
                  border: Border.all(color: Color(0xff44444A)),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: AppColors.disableBtnColor,
                    value: sCurrency,
                    hint: Text(
                      "Select Currency",
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    icon: Row(
                      children: [
                        Image.asset(
                          "assets/images/drop.png",
                          color: Colors.white,
                        ),
                        5.hSpace,
                      ],
                    ),
                    items: ["United States dollar (USD)", "BTC", "PKR"]
                        .map((method) => DropdownMenuItem(
                              value: method,
                              child: Text(method, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14)),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        sCurrency = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            25.vSpace,
            Text(
              "Select timezone",
              style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            20.vSpace,
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF212121),
                  border: Border.all(color: Color(0xff44444A)),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: AppColors.disableBtnColor,
                    value: stimeZone,
                    hint: Text(
                      "Select Timezone",
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    icon: Row(
                      children: [
                        Image.asset(
                          "assets/images/drop.png",
                          color: Colors.white,
                        ),
                        5.hSpace,
                      ],
                    ),
                    items: ["Gilgit,Pakistan", "Saudia Arabia", "Britain"]
                        .map((method) => DropdownMenuItem(
                              value: method,
                              child: Text(method, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14)),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        stimeZone = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            25.vSpace,
            Text(
              "Timezone format",
              style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            20.vSpace,
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF212121),
                  border: Border.all(color: Color(0xff44444A)),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: AppColors.disableBtnColor,
                    value: stimeFormat,
                    hint: Text(
                      "Timezone format",
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    icon: Row(
                      children: [
                        Image.asset(
                          "assets/images/drop.png",
                          color: Colors.white,
                        ),
                        5.hSpace,
                      ],
                    ),
                    items: [
                      "24 hours",
                      "12 hours",
                    ]
                        .map((method) => DropdownMenuItem(
                              value: method,
                              child: Text(method, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14)),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        stimeFormat = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                // RoutingService.pushAndRemoveUntil(const HomeScreen());
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
                    "Update",
                    style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                ),
              ),
            ),
            30.vSpace,
          ],
        ),
      ),
    );
  }
}
