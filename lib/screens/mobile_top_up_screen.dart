import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/chat_room_screen.dart';
import 'package:ucrypted_app/screens/home_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/custom_textfield.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class MobileTopUpScreen extends StatefulWidget {
  const MobileTopUpScreen({super.key});

  @override
  State<MobileTopUpScreen> createState() => _MobileTopUpScreenState();
}

class _MobileTopUpScreenState extends State<MobileTopUpScreen> {
  String? selectedPaymentMethod;
  bool isChecked = false;
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
              Text(
                "Mobile Top-Up",
                style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: ScreenService.isTablet ? 30 : 28),
              ),
              20.vSpace,
              Text("Payment Method", style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 18 : 16, fontWeight: FontWeight.w400)),
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
                        "Selected Payment Method",
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
              if (selectedPaymentMethod == "Credit Card") ...[
                25.vSpace,
                Text(
                  "Cardholder Name",
                  style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 18 : 16, fontWeight: FontWeight.w400),
                ),
                20.vSpace,
                TextField(
                  style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Enter Card holder name',
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
                    hintText: 'Enter Card holder name',
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
                    hintText: 'Enter Card holder name',
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
              ],
              25.vSpace,
              Text(
                "Phone Number",
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 18 : 16, fontWeight: FontWeight.w400),
              ),
              20.vSpace,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffCCCCCC), width: 1), // White border
                  borderRadius: BorderRadius.circular(8), // Rounded edges
                ),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    // Country Flag & Dropdown
                    Row(
                      children: [
                        const SizedBox(width: 5), // Space between flag & dropdown
                        Image.asset(
                          "assets/images/america.png", // Replace with your flag image
                          width: 24,
                          height: 16,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10), // Space between flag & dropdown
                        Image.asset(
                          "assets/images/drop.png",
                          color: Colors.white,
                        )
                      ],
                    ),
                    // Vertical Divider
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 30,
                      width: 1,
                      color: Colors.white,
                    ),
                    // TextField
                    Expanded(
                      child: TextField(
                        style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 13),
                        decoration: InputDecoration(
                          hintText: "Enter receiver number",
                          hintStyle: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 15 : 13),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              25.vSpace,
              Text(
                "Amount",
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 18 : 16, fontWeight: FontWeight.w400),
              ),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: 'Enter Amount',
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
              15.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Select an amount between \$20.00 - \$1000.00",
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: ScreenService.isTablet ? 14 : 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              25.vSpace,
              Row(
                children: [
                  5.hSpace,
                  SizedBox(height: 16.h, width: 16.w, child: SvgPicture.asset("assets/svg/tickfinal.svg")),
                  10.hSpace,
                  Expanded(
                    child: Text(
                      "By clicking 'Buy Now', you agree to our Terms and Conditions, including our Cancellation Policy.",
                      style: GoogleFonts.poppins(color: Color(0xffDADADA), fontSize: ScreenService.isTablet ? 14 : 12, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              25.vSpace,
              GestureDetector(
                onTap: () {
                  RoutingService.push(MobileTopUpSuccessScreen(
                    fromWallet: selectedPaymentMethod == "Wallet" ? true : false,
                  ));
                },
                child: Container(
                  height: ScreenService.isTablet ? 50 : 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: ScreenService.isTablet ? 20 : 18),
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
}

class MobileTopUpSuccessScreen extends StatefulWidget {
  final bool fromWallet;

  const MobileTopUpSuccessScreen({super.key, required this.fromWallet});

  @override
  State<MobileTopUpSuccessScreen> createState() => _MobileTopUpSuccessScreenState();
}

class _MobileTopUpSuccessScreenState extends State<MobileTopUpSuccessScreen> {
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
              30.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: ScreenService.isTablet ? 70.h : 65.h, // Outer circle
                    width: ScreenService.isTablet ? 70.w : 65.w,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 94, 155, 25).withOpacity(0.1), // Green outer ring
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: ScreenService.isTablet ? 50.h : 45.h,
                      width: ScreenService.isTablet ? 50.w : 45.w,
                      child: SvgPicture.asset(
                        "assets/svg/success1.svg",
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                ],
              ),
              20.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Transactions has been Successfully Proceed!",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                      color: Color(0xffFAFAFA),
                      fontSize: ScreenService.isTablet ? 21 : 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              30.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xff151515), border: Border.all(color: Color(0xffCCCCCC))),
                  padding: const EdgeInsets.all(26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Mobile Top-up Details",
                              style: GoogleFonts.poppins(color: AppColors.white, fontSize: ScreenService.isTablet ? 25 : 23, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      20.vSpace,
                      _transactionRow("Payment Method", widget.fromWallet == true ? "Wallet" : "Credit Card"),
                      10.vSpace,
                      _transactionRow("Amount", "\$100.00"),
                      10.vSpace,
                      if (!widget.fromWallet) ...[
                        _transactionRow("Card Number", "4882632736"),
                        10.vSpace,
                        _transactionRow("Bank", "XYZ Bank"),
                        10.vSpace,
                        _transactionRow("Phone Number", "+1 23124 343242"),
                        10.vSpace,
                        _transactionRow("Transaction Refrence", "TRX-ABC12323232"),
                      ],

                      if (widget.fromWallet) ...[
                        _transactionRow("Receipt", "4882632736"),
                        10.vSpace,
                        _transactionRow("Transaction ID", "TRX- AUS123456"),
                        10.vSpace,
                        _transactionRow("Region", "United States"),
                      ],
                      // _transactionRow("Email Address", "alice@gmail.com"),
                      // 10.vSpace,
                      // _transactionRow("Transaction ID", "TRX-AUS101212"),
                      10.vSpace,
                      const Divider(color: Color(0xffCCCCCC)),
                      20.vSpace,
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
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
                                  "Download Top-Up Card",
                                  style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 18 : 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      20.vSpace,
                      GestureDetector(
                        onTap: () {
                          RoutingService.pushAndRemoveUntil(const HomeScreen());
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(28), border: Border.all(color: Color(0xffDADADA))),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/svg/email.svg"),
                                10.hSpace,
                                Text(
                                  "Send to email",
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
              if (!widget.fromWallet) ...[
                30.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "For any discrepancies or complaints, please contact: support@ucrypted.com. The top-up should reflect in the recipient's account shortly. If you encounter any issues, feel free to contact our support team.",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(fontSize: ScreenService.isTablet ? 8.sp : 10.sp, color: Color(0xffDADADA), fontWeight: FontWeight.w300),
                  ),
                ),
                40.vSpace,
              ]
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
              style: GoogleFonts.poppins(color: Color(0xffDADADA), fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: Color(0xffFAFAFA),
              fontSize: ScreenService.isTablet ? 14 : 12,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
