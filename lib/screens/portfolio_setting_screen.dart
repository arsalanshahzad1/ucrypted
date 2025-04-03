import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class PortfolioSettingScreen extends StatefulWidget {
  const PortfolioSettingScreen({super.key});

  @override
  State<PortfolioSettingScreen> createState() => _PortfolioSettingScreenState();
}

class _PortfolioSettingScreenState extends State<PortfolioSettingScreen> {
  bool isNotifications = false;
  List<String> options = [
    "Profit/Loss",
    "Portfolio Value",
    "Performance",
    "Net Investment",
    "Risk Metrics",
  ];

  Set<String> selectedOptions = {};

  void toggleSelection(String option) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
      } else {
        selectedOptions.add(option);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/background1.png",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
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
                        "Portfolio Settings",
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
              toggleSettingItem(
                title: "Notifications for Portfolio Changes",
                subtitle: "Set up alerts for significant changes in your portfolio's value.",
                value: isNotifications,
                onChanged: (val) => setState(() => isNotifications = val),
              ),
              30.vSpace,
              Text(
                "Import/Export Portfolio",
                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              15.vSpace,
              Text(
                "Import or export your portfolio data in various formats (CSV, JSON).",
                style: GoogleFonts.inter(fontSize: 14, color: Colors.grey[500]),
              ),
              20.vSpace,
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                    Color(0xFFCCCCCC),
                    Color(0xFF666666),
                  ]),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/export.svg",
                        height: 20,
                      ),
                      5.hSpace,
                      Text(
                        "Export",
                        style: GoogleFonts.inter(color: AppColors.white),
                      )
                    ],
                  ),
                ),
              ),
              20.vSpace,
              Container(
                height: 40,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.transparent, border: Border.all(color: AppColors.grey)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/import.svg",
                        height: 20,
                      ),
                      5.hSpace,
                      Text(
                        "Export",
                        style: GoogleFonts.inter(color: AppColors.white),
                      )
                    ],
                  ),
                ),
              ),
              20.vSpace,
              Text(
                "Performance Metrics",
                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              15.vSpace,
              Text(
                "Choose which performance metrics to display (e.g., ROI, profit/loss).",
                style: GoogleFonts.inter(fontSize: 14, color: Colors.grey[500]),
              ),
              20.vSpace,
              //Create below this
              Column(
                mainAxisSize: MainAxisSize.min,
                children: options.map((option) {
                  bool isSelected = selectedOptions.contains(option);
                  return GestureDetector(
                    onTap: () => toggleSelection(option),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.disableBtnColor,
                        border: Border.all(
                          color: isSelected ? Colors.orange : AppColors.disableBtnColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            option,
                            style: GoogleFonts.inter(color: Colors.white, fontSize: 16),
                          ),
                          if (isSelected) const Icon(Icons.check, color: Colors.orange),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              20.vSpace,
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
              20.vSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget toggleSettingItem({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        15.vSpace,
        Text(
          subtitle,
          style: GoogleFonts.inter(fontSize: 14, color: Colors.grey[500]),
        ),
        15.vSpace,
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    gradient: value ? const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]) : null,
                    borderRadius: BorderRadius.circular(20),
                    color: value ? null : Colors.grey[700],
                  ),
                ),
                Switch(
                  value: value,
                  onChanged: onChanged,
                  activeColor: Colors.transparent,
                  activeTrackColor: Colors.transparent,
                  inactiveTrackColor: Colors.transparent,
                  inactiveThumbColor: Colors.white,
                  trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Text(
              value ? "On" : "Off",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: value ? Colors.orange : Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
