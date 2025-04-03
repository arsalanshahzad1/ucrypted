import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class TradingSettingScreen extends StatefulWidget {
  const TradingSettingScreen({super.key});

  @override
  State<TradingSettingScreen> createState() => _TradingSettingScreenState();
}

class _TradingSettingScreenState extends State<TradingSettingScreen> {
  bool isTradingPairOn = false;
  bool isAutoTradingOn = true;
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
                      "Trading Settings",
                      style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset("assets/svg/inof.svg"),
                  ),
                ),
              ],
            ),
            30.vSpace,
            toggleSettingItem(
              title: "Default Trading Pair",
              subtitle: "Set your default trading pair for quick access.",
              value: isTradingPairOn,
              onChanged: (val) => setState(() => isTradingPairOn = val),
            ),
            30.vSpace,
            toggleSettingItem(
              title: "Auto-Trading Bots",
              subtitle: "Configure and manage auto-trading bots.",
              value: isAutoTradingOn,
              onChanged: (val) => setState(() => isAutoTradingOn = val),
            ),
          ],
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
