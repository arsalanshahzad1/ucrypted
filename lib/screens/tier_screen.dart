import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/chat_room_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class TierScreen extends StatefulWidget {
  const TierScreen({super.key});

  @override
  State<TierScreen> createState() => _TierScreenState();
}

class _TierScreenState extends State<TierScreen> {
  int _selectedIndex = 4;

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

  String? selectedPaymentMethod;
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/tier.png",
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tier Payment",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: ScreenService.isTablet ? 30 : 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "\$25.00",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: ScreenService.isTablet ? 30 : 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                "Supporter",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: ScreenService.isTablet ? 25 : 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Each contribution brings us closer to\nrevolutionizing the trading experience.",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: ScreenService.isTablet ? 18 : 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              20.vSpace,
              Text("Choose Tier", style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 18 : 16, fontWeight: FontWeight.w400)),
              20.vSpace,
              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.disableBtnColor,
                    border: Border.all(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      dropdownColor: AppColors.disableBtnColor,
                      value: selectedPaymentMethod,
                      hint: Text(
                        "Wallet",
                        style: GoogleFonts.poppins(color: const Color(0xFFCCCCCC), fontWeight: FontWeight.w300, fontSize: ScreenService.isTablet ? 14 : 12),
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
                        "Wallet",
                        "Credit Card",
                      ]
                          .map((method) => DropdownMenuItem(
                                value: method,
                                child: Text(method, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w300, fontSize: ScreenService.isTablet ? 14 : 12)),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              25.vSpace,
              Text(
                "Email",
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 18 : 16, fontWeight: FontWeight.w400),
              ),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: 'desmond@gmail.com',
                  hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: ScreenService.isTablet ? 15 : 13, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              25.vSpace,
              Text(
                "CVV",
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 18 : 16, fontWeight: FontWeight.w400),
              ),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: 'desmond',
                  hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: ScreenService.isTablet ? 15 : 13, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              25.vSpace,
              Text(
                "Card Holder Name",
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 18 : 16, fontWeight: FontWeight.w400),
              ),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: 'Enter your Full Name',
                  hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: ScreenService.isTablet ? 15 : 13, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              25.vSpace,
              Text(
                "Card Number",
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 18 : 16, fontWeight: FontWeight.w400),
              ),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: '41112121212121212',
                  hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: ScreenService.isTablet ? 15 : 13, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              25.vSpace,
              Text(
                "Expiration Date",
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 18 : 16, fontWeight: FontWeight.w400),
              ),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: '12/25',
                  hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: ScreenService.isTablet ? 15 : 13, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              20.vSpace,
              Text(
                "Amount",
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 14 : 16, fontWeight: FontWeight.w400),
              ),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: '\$20.00',
                  hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: ScreenService.isTablet ? 15 : 13, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              20.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    RoutingService.push(const TierScreenSuccess());
                  },
                  child: Container(
                    height: ScreenService.isTablet ? 42.h : 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                      borderRadius: BorderRadius.circular(ScreenService.isTablet ? 32 : 28),
                    ),
                    child: Center(
                      child: Text(
                        "Confirm Support",
                        style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 18 : 16),
                      ),
                    ),
                  ),
                ),
              ),
              20.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    // RoutingService.pushAndRemoveUntil(const HomeScreen());
                  },
                  child: Container(
                    height: ScreenService.isTablet ? 42.h : 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(ScreenService.isTablet ? 32 : 28), border: Border.all(color: Colors.white)),
                    child: Center(
                      child: Text(
                        "Back",
                        style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 18 : 16),
                      ),
                    ),
                  ),
                ),
              ),
              30.vSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class TierScreenSuccess extends StatefulWidget {
  const TierScreenSuccess({super.key});

  @override
  State<TierScreenSuccess> createState() => _TierScreenSuccessState();
}

class _TierScreenSuccessState extends State<TierScreenSuccess> {
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
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/tier.png",
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
              10.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: ScreenService.isTablet ? 70.h : 68.h,
                    width: ScreenService.isTablet ? 70.h : 68.w,
                    decoration: BoxDecoration(color: Color.fromARGB(32, 87, 140, 26), borderRadius: BorderRadius.circular(ScreenService.isTablet ? 67 : 65)),
                    child: SizedBox(
                      height: ScreenService.isTablet ? 62 : 60,
                      width: ScreenService.isTablet ? 62 : 60,
                      child: SvgPicture.asset(
                        "assets/svg/badge.svg",
                        fit: ScreenService.isTablet ? BoxFit.contain : BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              15.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Transaction has been Successfully Processed!",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                      color: Color(0xffFAFAFA),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              30.vSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: ScreenService.isTablet ? 20 : 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xff151515),
                      border: Border.all(
                        color: Color(0xffCCCCCC).withOpacity(0.5),
                      )),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 56.w, vertical: 28.h),
                            decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Payment Details",
                              style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 23),
                            ),
                          ),
                        ],
                      ),
                      15.vSpace,
                      _transactionRow("Payment Method", "Credit Card"),
                      15.vSpace,
                      _transactionRow("Service", "Support Tier"),
                      15.vSpace,
                      _transactionRow("Billing Type", "prepaid"),
                      15.vSpace,
                      _transactionRow("Account Number", "0400001023123123"),
                      15.vSpace,
                      _transactionRow("Amount", "\$35.00"),
                      25.vSpace,
                      const Divider(color: AppColors.grey),
                      45.vSpace,
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/svg/msg.svg"),
                                10.hSpace,
                                Text(
                                  "Download Payment Details",
                                  style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 18 : 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      25.vSpace,
                      GestureDetector(
                        onTap: () {
                          // RoutingService.pushAndRemoveUntil(const HomeScreen());
                        },
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(
                                color: Color(0xffDADADA),
                              )),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/svg/email.svg"),
                                10.hSpace,
                                Text(
                                  "Send To Email",
                                  style: GoogleFonts.poppins(color: Color(0xffDADADA), fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 18 : 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              30.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "For any discrepancies or complaints, please contact: info@ucrypted.com. Together, we can make Ucrypted a reality and shape the future of secure financial trading. Thank you for being an essential part of our journey!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(color: Color(0xffDADADA), fontSize: ScreenService.isTablet ? 16 : 12, fontWeight: FontWeight.w300),
                ),
              ),
              30.vSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _transactionRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(color: Color(0xffDADADA), fontSize: ScreenService.isTablet ? 18 : 14, fontWeight: FontWeight.w400),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: Color(0xffFAFAFA),
              fontSize: ScreenService.isTablet ? 16 : 12,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
