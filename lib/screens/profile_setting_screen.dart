import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/custom_textfield.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
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

  String? sLocaton;
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
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                          "Account Settings",
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
                20.vSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Profile Picture",
                    style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                ),
                10.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CircleAvatar(
                            backgroundColor: AppColors.disableBtnColor,
                            radius: 30,
                            backgroundImage: AssetImage("assets/images/person.png"),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 38.h,
                            width: 138.w,
                            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: AppColors.grey),
                            ),
                            child: Center(
                                child: Text(
                              "Upload New Picture",
                              style: GoogleFonts.inter(fontWeight: FontWeight.w600,
                               color: AppColors.white, fontSize: 12),
                            )),
                          ),
                          10.hSpace,
                          Container(
                              height: 40,
                              // padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              // decoration: BoxDecoration(
                              //   shape: BoxShape.circle,
                              //   border: Border.all(color: AppColors.grey),
                              // ),
                              child: SvgPicture.asset("assets/svg/trash.svg")),
                        ],
                      ),
                    ),
                  ],
                ),
                20.vSpace,
                Text(
                  "Full Name",
                  style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 16),
                ),
                10.vSpace,
                Container(
                  decoration: BoxDecoration(color: Color(0xFF1C1C1E), borderRadius: BorderRadius.circular(8), border: Border.all(color: Color(0xff44444A))),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: TextField(
                    style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_sharp, color: Colors.grey.shade500),
                      hintText: "User name",
                      hintStyle: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                20.vSpace,
                Text(
                  "Email Address",
                  style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 16),
                ),
                10.vSpace,
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF1C1C1E), // Dark background
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                    border: Border.all(color: Color(0xFF44444A)), // Border color
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "yourmail@gmail.com",
                      hintStyle: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                      border: InputBorder.none, // Removes default border
                    ),
                  ),
                ),
                20.vSpace,
                Text(
                  "Location",
                  style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 16),
                ),
                10.vSpace,
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF1C1C1E), // Dark background
                      border: Border.all(color: Color(0xff44444A)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        dropdownColor: AppColors.disableBtnColor,
                        value: sLocaton,
                        hint: Text(
                          "Select Location",
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
                        items: ["Gilgit,Pakistan", "Karachi", "Cuba"]
                            .map((method) => DropdownMenuItem(
                                  value: method,
                                  child: Text(method, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14)),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            sLocaton = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                20.vSpace,
                Text(
                  "Password",
                  style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 16),
                ),
                10.vSpace,
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF1C1C1E), // Dark background
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                    border: Border.all(color: Color(0xFF44444A)), // Border color
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "********",
                      hintStyle: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                      border: InputBorder.none, // Removes default border
                      suffixIcon: GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   _obscureText = !_obscureText; // Toggle visibility
                          // });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(12), // Adjust padding
                          child: SvgPicture.asset(
                            "assets/svg/eye.svg",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                20.vSpace,
                Text(
                  "Two-Factor Authentication",
                  style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 16),
                ),
                10.vSpace,
                Text(
                  "Enable/disable 2FA to enhance account security.",
                  style: GoogleFonts.inter(color: Color(0xffACB5BB), fontWeight: FontWeight.w400, fontSize: 14),
                ),
                20.vSpace,
                GestureDetector(
                  onTap: () {
                    // RoutingService.pushAndRemoveUntil( HomeScreen());
                  },
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Center(
                      child: Text(
                        "Set Authentication",
                        style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                20.vSpace,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    color: Color(0xff2C2C30),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delete Account",
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      8.vSpace,
                      Text(
                        "Permanently delete your account and associated data.",
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      16.vSpace,
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF666666),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Delete Account",
                            style: GoogleFonts.inter(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      // 20.vSpace,
                    ],
                  ),
                ),
                20.vSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
