import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class SecuritySettingScreen extends StatefulWidget {
  const SecuritySettingScreen({super.key});

  @override
  State<SecuritySettingScreen> createState() => _SecuritySettingScreenState();
}

class _SecuritySettingScreenState extends State<SecuritySettingScreen> {
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

  bool securityQA = false;
  bool apiSecurity = true;
  bool encrypt = true;
  bool loginAlert = false;

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
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenService.isTablet ? 30 : 16),
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
                        "Security Settings",
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenService.isTablet ? 20 : 16.sp,
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
                title: "Security Questions",
                subtitle: "Set up security questions for account recovery.",
                value: securityQA,
                onChanged: (val) => setState(() => securityQA = val),
              ),
              30.vSpace,
              toggleSettingItem(
                title: "API Security",
                subtitle: "Manage API keys and permissions for third-party integrations.",
                value: apiSecurity,
                onChanged: (val) => setState(() => apiSecurity = val),
              ),
              30.vSpace,
              toggleSettingItem(
                title: "Encryption Options",
                subtitle: "Manage encryption settings for your stored data.",
                value: encrypt,
                onChanged: (val) => setState(() => encrypt = val),
              ),
              30.vSpace,
              toggleSettingItem(
                title: "Login Alerts",
                subtitle: "Get notified when there is a login from a new device or location.",
                value: loginAlert,
                onChanged: (val) => setState(() => loginAlert = val),
              ),
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
          style: GoogleFonts.inter(fontSize: ScreenService.isTablet ? 18 : 14, color: Colors.grey[500]),
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
