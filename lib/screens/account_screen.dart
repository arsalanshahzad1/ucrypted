import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/controllers/account_screen_controller.dart';
import 'package:ucrypted_app/controllers/auth_controller.dart';
import 'package:ucrypted_app/screens/general_setting_screen.dart';
import 'package:ucrypted_app/screens/login_screen.dart';
import 'package:ucrypted_app/screens/notification_setting_screen.dart';
import 'package:ucrypted_app/screens/portfolio_setting_screen.dart';
import 'package:ucrypted_app/screens/profile_setting_screen.dart';
import 'package:ucrypted_app/screens/security_setting_screen.dart';
import 'package:ucrypted_app/screens/trading_setting_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/app_loaders.dart';
import 'package:ucrypted_app/utilities/app_print.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final AuthController authController = Get.put(AuthController());
  final AccountScreenController accountController = Get.put(AccountScreenController());
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

  @override
  void initState() {
    super.initState();
    accountController.loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // IconButton(
                      //   onPressed: () {
                      //     Get.back();
                      //   },
                      //   icon: const Icon(
                      //     Icons.arrow_back_ios,
                      //     color: AppColors.white,
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          "Settings",
                          style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/svg/search1.svg"),
                      20.hSpace,
                      SvgPicture.asset("assets/svg/notification.svg"),
                      5.hSpace,
                    ],
                  ),
                ],
              ),
              30.vSpace,
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/person.png"),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        accountController.userName.toString(),
                        style: GoogleFonts.inter(fontSize: ScreenService.isTablet ? 24 : 20, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                      Text(
                        accountController.userEmail.toString(),
                        style: GoogleFonts.inter(fontSize: ScreenService.isTablet ? 16 : 14, color: Colors.grey[500], fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]),
                    ],
                  )),
                ],
              ),
              30.vSpace,
              Text(
                "Preferences",
                style: GoogleFonts.inter(fontSize: ScreenService.isTablet ? 18 : 14, fontWeight: FontWeight.w400, color: Color(0xffACB5BB)),
              ),
              const SizedBox(height: 10),
              settingsItem("assets/svg/account.svg", "Account Settings", () {
                RoutingService.push(const ProfileSettingScreen());
              }),
              5.vSpace,
              settingsItem("assets/svg/general.svg", "General Settings", () {
                RoutingService.push(const GeneralSettingScreen());
              }),
              5.vSpace,
              settingsItem("assets/svg/accnotific.svg", "Notification Settings", () {
                RoutingService.push(const NotificationSettingScreen());
              }),
              30.vSpace,
              Text(
                "Other",
                style: GoogleFonts.inter(fontSize: ScreenService.isTablet ? 18 : 14, fontWeight: FontWeight.w400, color: Color(0xffACB5BB)),
              ),
              10.vSpace,
              settingsItem("assets/svg/portfolio.svg", "Portfolio Settings", () {
                RoutingService.push(const PortfolioSettingScreen());
              }),
              5.vSpace,
              settingsItem("assets/svg/trading.svg", "Trading Settings", () {
                RoutingService.push(const TradingSettingScreen());
              }),
              5.vSpace,
              settingsItem("assets/svg/security.svg", "Security Settings", () {
                RoutingService.push(const SecuritySettingScreen());
              }),
              5.vSpace,
              settingsItem("assets/svg/logout.svg", "Logout", () {
                AppLoader.startLoading();
                Future.delayed(const Duration(seconds: 3), () {
                  authController.onLogout();
                });
              }),
            ],
          ),
        ),
      );
    });
  }

  Widget settingsItem(
    String icon,
    String title,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(height: 30, width: 30, decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: const Color(0xFF44444A)), child: SvgPicture.asset(icon)),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.inter(fontSize: ScreenService.isTablet ? 17 : 14, fontWeight: FontWeight.w400, color: Color(0xffEDF1F3)),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]),
          ],
        ),
      ),
    );
  }
}
