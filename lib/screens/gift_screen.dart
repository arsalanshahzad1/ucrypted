import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/chat_room_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/app_print.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class GiftScreen extends StatefulWidget {
  const GiftScreen({super.key});

  @override
  State<GiftScreen> createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  int _selectedIndex = 4;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
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
            children: [
              50.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: SvgPicture.asset(
                          "assets/svg/menu-dots.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          RoutingService.push(const ChatRoomScreen());
                        },
                        child: SvgPicture.asset(
                          "assets/svg/chats.svg",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      15.hSpace,
                      GestureDetector(
                        onTap: () {
                          RoutingService.push(const NotificationScreen());
                        },
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset("assets/svg/notification.svg"),
                        ),
                      ),
                      15.hSpace,
                      GestureDetector(
                        onTap: () {
                          RoutingService.push(const AccountScreen());
                        },
                        child: const CircleAvatar(
                          backgroundColor: AppColors.disableBtnColor,
                          radius: 22,
                          backgroundImage: AssetImage("assets/images/person.png"),
                        ),
                      ),
                      10.hSpace,
                    ],
                  ),
                ],
              ),
              20.vSpace,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Gift Redeem",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: AppColors.white, fontSize: ScreenService.isTablet ? 30 : 28),
                    ),
                  ),
                ],
              ),
              10.vSpace,
              Row(
                children: [
                  // 20.hSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Moves text to the left
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/star.svg"),
                          10.hSpace,
                          Text(
                            "Points",
                            style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 18 : 16),
                          ),
                        ],
                      ),
                      5.vSpace,
                      Padding(
                        padding: const EdgeInsets.only(left: 20), // Adjust left padding
                        child: Text(
                          "0",
                          style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w700, fontSize: ScreenService.isTablet ? 40 : 38),
                        ),
                      ),
                      5.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Reward Shop ",
                            style: GoogleFonts.inter(color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 18 : 16),
                          ),
                          2.hSpace,
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.textColor,
                            size: ScreenService.isTablet ? 16 : 14,
                          )
                        ],
                      ),
                    ],
                  ),

                  38.hSpace,
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/card.svg"),
                          10.hSpace,
                          Text(
                            "Gift Cards",
                            style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 18 : 16),
                          ),
                        ],
                      ),
                      5.vSpace,
                      Text(
                        "0",
                        style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w700, fontSize: ScreenService.isTablet ? 40 : 38),
                      ),
                      5.vSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "My Gift Cards ",
                            style: GoogleFonts.inter(color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 18 : 16),
                          ),
                          2.hSpace,
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.textColor,
                            size: ScreenService.isTablet ? 16 : 14,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              20.vSpace,
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Get Rewards",
                      style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: ScreenService.isTablet ? 28 : 26),
                    ),
                    Row(
                      children: [
                        Text(
                          "More   ",
                          style: GoogleFonts.inter(color: Color(0xff7A808C), fontSize: ScreenService.isTablet ? 18 : 16, fontWeight: FontWeight.w400),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Color(0xff7A808C),
                          size: ScreenService.isTablet ? 14 : 12,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              10.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontSize: ScreenService.isTablet ? 18 : 16,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(text: "Explo"),
                        TextSpan(
                          text: "r",
                          style: GoogleFonts.inter(
                            color: AppColors.white,
                            fontSize: ScreenService.isTablet ? 18 : 16,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xffFCA509),
                            decorationThickness: 1.5,
                            height: 1.6, // 👈 This pushes the text a bit away from the underline
                          ),
                        ),
                        TextSpan(
                          text: "e",
                          style: GoogleFonts.inter(
                            color: AppColors.white,
                            fontSize: ScreenService.isTablet ? 18 : 16,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xffFCA509),
                            decorationThickness: 1.5,
                            height: 1.6, // 👈 Same here
                          ),
                        ),
                        TextSpan(text: " More"),
                      ],
                    ),
                  )
                ],
              ),
              // 10.verticalSpace,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: buildGiftTokens(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGiftTokens() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF13171A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            children: [
              SvgPicture.asset("assets/svg/incoming.svg"),
              8.hSpace,
              Expanded(
                child: Text(
                  "Make a Deposit and Get Gift Card",
                  style: GoogleFonts.inter(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: ScreenService.isTablet ? 16 : 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),

          12.vSpace,

          // Progress Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Progress",
                style: GoogleFonts.inter(color: Color(0xff7E8088), fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  Text(
                    "0",
                    style: GoogleFonts.inter(
                      color: Colors.green,
                      fontSize: ScreenService.isTablet ? 16 : 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "/10 USDT",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: ScreenService.isTablet ? 16 : 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),

          8.vSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reward",
                style: GoogleFonts.inter(color: Color(0xff7E8088), fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/svg/card.svg"),
                  8.hSpace,
                  Text(
                    "USDT Trading Fee Rebate Voucher",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: ScreenService.isTablet ? 16 : 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),

          8.vSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Time Left to complete Task",
                style: GoogleFonts.inter(color: Color(0xff7E8088), fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
              ),
              Text(
                "02D:00H:30M",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: ScreenService.isTablet ? 16 : 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          20.vSpace,
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 28.h,
              width: ScreenService.isTablet ? 65.w : 70.w,
              // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
              ),
              child: Center(
                child: Text(
                  "Do Task",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: ScreenService.isTablet ? 16 : 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          4.vSpace,
        ],
      ),
    );
  }
}
