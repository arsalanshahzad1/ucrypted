import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() => _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  int _selectedIndex = 0;

  final List<String> _selectedIcons = [
    "assets/svg/home-bottoms.svg",
    "assets/svg/trade-bottoms.svg",
    "assets/svg/convert-bottoms.svg",
    "assets/svg/gift-bottoms.svg",
    "assets/svg/discover-bottoms.svg"
  ];
  final List<String> _unselectedIcons = [
    "assets/svg/home-bottom.svg",
    "assets/svg/trade-bottom.svg",
    "assets/svg/convert-bottom.svg",
    "assets/svg/gift-bottom.svg",
    "assets/svg/discover-bottom.svg"
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      fit: BoxFit.fill,
      bottomNavChild: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 28, 28, 30),
          border: Border(
            top: BorderSide(color: Colors.black, width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedFontSize: 0.0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.white,
          items: List.generate(5, (index) {
            return BottomNavigationBarItem(
              label: "",
              icon: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: SvgPicture.asset(_unselectedIcons[index], width: 60, height: 60),
                  ),
                  25.vSpace,
                ],
              ),
              activeIcon: Column(
                children: [
                  SizedBox(
                    child: SvgPicture.asset(
                      _selectedIcons[index],
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                  ),
                  25.vSpace,
                ],
              ),
            );
          }),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenService.isTablet ? 30 : 16),
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
                        "Tradding Settings",
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenService.isTablet ? 10.sp : 16.sp,
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
              buildSettingsOption1("News and Update Settings", "The latest news about the latest features and software update settings", isNewsUpdates, (val) {
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
          style: GoogleFonts.inter(fontSize: ScreenService.isTablet ? 18 : 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        15.vSpace,
        Text(
          subtitle,
          style: GoogleFonts.inter(fontSize: ScreenService.isTablet ? 16 : 14, color: Colors.grey[500]),
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
                fontSize: ScreenService.isTablet ? 18 : 16,
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
            Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Container(
                height: 17.h,
                width: ScreenService.isTablet ? 14.w : 17.w,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r), border: Border.all(color: Colors.white)),
              ),
            ),
            // 5.hSpace,
          ],
        ),
        10.vSpace,
        Text(subtitle,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Color(0xffACB5BB),
            )),
        10.vSpace,
        Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Color(0xff2C2C30),
            border: Border.all(color: Color(0xff44444A)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            iconSize: 0.0,
            underline: const SizedBox.shrink(),
            style: GoogleFonts.inter(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
            value: "Suggested",
            items: ["Suggested", "All", "None"].map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item,
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                    )),
              );
            }).toList(),
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "assets/images/drop.png",
                  color: Colors.white,
                ),
                5.hSpace,
              ],
            ),
            onChanged: (value) {},
            dropdownColor: AppColors.disableBtnColor,
          ),
        ),
        20.vSpace,
      ],
    );
  }

  Widget buildSettingsOption1(String title, String subtitle, bool value, Function(bool) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: GoogleFonts.inter(color: AppColors.white, fontSize: ScreenService.isTablet ? 18 : 16, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 20.h,
              width: 20.w,
              child: SvgPicture.asset("assets/svg/tick.svg"),
            )
          ],
        ),
        10.vSpace,
        Text(subtitle,
            style: GoogleFonts.inter(
              fontSize: ScreenService.isTablet ? 16 : 14,
              color: Color(0xffACB5BB),
            )),
        10.vSpace,
        Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Color(0xff2C2C30),
            border: Border.all(color: Color(0xff44444A)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            iconSize: 0.0,
            underline: const SizedBox.shrink(),
            style: GoogleFonts.inter(color: Colors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
            value: "Suggested",
            items: ["Suggested", "All", "None"].map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item,
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                    )),
              );
            }).toList(),
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "assets/images/drop.png",
                  color: Colors.white,
                ),
                5.hSpace,
              ],
            ),
            onChanged: (value) {},
            dropdownColor: AppColors.disableBtnColor,
          ),
        ),
        20.vSpace,
      ],
    );
  }
}
