import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() => _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool isNotifications = false;
  bool isEmail = true;
  bool isSms = false;

  bool isNewsUpdates = false;
  bool isTipsTutorials = false;
  bool isOffersPromotions = false;

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
                        "Notification Settings",
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
                title: "Push Notifications",
                subtitle: "Configure push notifications for your mobile devices.",
                value: isNotifications,
                onChanged: (val) => setState(() => isNotifications = val),
              ),
              30.vSpace,
              toggleSettingItem(
                title: "SMS Notifications",
                subtitle: "Enable/disable SMS notifications for critical alerts.",
                value: isSms,
                onChanged: (val) => setState(() => isSms = val),
              ),
              30.vSpace,
              toggleSettingItem(
                title: "Email Notifications",
                subtitle: "Choose which updates and alerts you want to receive via email.",
                value: isEmail,
                onChanged: (val) => setState(() => isEmail = val),
              ),
              20.vSpace,
              const Divider(
                height: 1.0,
                color: AppColors.grey,
              ),
              20.vSpace,

              /// UI from screenshot
              buildSettingsOption("News and Update Settings", "The latest news about the latest features and software update settings", isNewsUpdates, (val) {
                setState(() => isNewsUpdates = val);
              }),
              buildSettingsOption("Tips and Tutorials", "Tips and tricks in order to increase your performance efficiency", isTipsTutorials, (val) {
                setState(() => isTipsTutorials = val);
              }),
              buildSettingsOption("Offer and Promotions", "Promotions about software package prices and about the latest discounts", isOffersPromotions, (val) {
                setState(() => isOffersPromotions = val);
              }),
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

  Widget buildSettingsOption(String title, String subtitle, bool value, Function(bool) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: GoogleFonts.inter(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w600)),
            Checkbox(
              value: value,
              onChanged: (val) {
                if (val != null) {
                  onChanged(val);
                }
              },
              activeColor: Colors.orange,
            ),
          ],
        ),
        Text(subtitle,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.grey[500],
            )),
        10.vSpace,
        Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.disableBtnColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            iconSize: 0.0,
            underline: const SizedBox.shrink(),
            value: "Suggested",
            items: ["Suggested", "All", "None"].map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: GoogleFonts.inter(color: AppColors.white)),
              );
            }).toList(),
            onChanged: (value) {},
            dropdownColor: AppColors.disableBtnColor,
          ),
        ),
        20.vSpace,
      ],
    );
  }
}
