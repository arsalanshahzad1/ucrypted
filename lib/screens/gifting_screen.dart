import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/home_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class GiftingScreen extends StatefulWidget {
  const GiftingScreen({super.key});

  @override
  State<GiftingScreen> createState() => _GiftingScreenState();
}

class _GiftingScreenState extends State<GiftingScreen> {
  String? selectBrand;
  String? selectedPaymentMethod;
  String? selectedCardRange;
  String? selectCountry;
  bool isChecked = false;
  bool isPreOrder = false;

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
    // Schedule the dialog to show after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showFullWidthDialog(context);
    });
  }

  void showFullWidthDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent, // No default background
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95, // Takes 90% of screen width
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E), // Dark background like the screenshot
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Wrap content properly
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              30.vSpace,
              SvgPicture.asset("assets/svg/splash-logo.svg", height: 30), // Adjust logo path
              20.vSpace,

              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Log In to Pay with Crypto",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              20.vSpace,

              Text(
                "Please log in to pay via cryptocurrency. If you don't have an account, sign up now!",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),

              // Buttons
              20.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 35.h,
                      width: 80.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(28), border: Border.all(color: Color(0xffFFFFFF))),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  16.hSpace,
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      // RoutingService.pushAndRemoveUntil(const HomeScreen());
                    },
                    child: Container(
                      height: 35.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Center(
                        child: Text(
                          "Log In",
                          style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              15.vSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGradientButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFCA509), Color(0xFF880306)],
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
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
          padding: const EdgeInsets.symmetric(horizontal: 26),
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
                          RoutingService.push(const AccountScreen());
                        },
                        child: const CircleAvatar(
                          backgroundColor: AppColors.disableBtnColor,
                          radius: 22,
                          backgroundImage: AssetImage("assets/images/person.png"),
                        ),
                      ),
                      // 10.hSpace,
                    ],
                  ),
                ],
              ),
              20.vSpace,
              Text(
                "NordVPN Gift Card",
                style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 28),
              ),
              30.vSpace,
              Text("Select Brand", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16)),
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
                      value: selectBrand,
                      hint: Text(
                        "Nord VPN",
                        style: GoogleFonts.poppins(color: const Color(0xFFCCCCCC), fontWeight: FontWeight.w300, fontSize: 12),
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
                        "Nord Vpn 1",
                        "Nord Vpn 2",
                        "Nord Vpn 3",
                      ]
                          .map((method) => DropdownMenuItem(
                                value: method,
                                child: Text(method, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12)),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectBrand = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              25.vSpace,
              Text("Payment Method", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16)),
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
                        style: GoogleFonts.poppins(color: const Color(0xFFCCCCCC), fontWeight: FontWeight.w300, fontSize: 12),
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
                                child: Text(method, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12)),
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
                20.vSpace,
                Text(
                  "Cardholder Name",
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
                10.vSpace,
                TextField(
                  style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Enter Card holder name',
                    hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: 13, fontWeight: FontWeight.w400),
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
                  "Card Number",
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
                20.vSpace,
                TextField(
                  style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Enter Card Number',
                    hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: 13, fontWeight: FontWeight.w400),
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
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
                20.vSpace,
                TextField(
                  style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Enter Email',
                    hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: 13, fontWeight: FontWeight.w400),
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
                  style: GoogleFonts.poppins(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
                20.vSpace,
                TextField(
                  style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Enter Email',
                    hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: 13, fontWeight: FontWeight.w400),
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
                5.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Payable Amount is \$120 with \$5 commission.",
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
              25.vSpace,
              Text("Email", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16)),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: 'Enter Email',
                  hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: 13, fontWeight: FontWeight.w400),
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
              Text("From", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16)),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: 'Enter Name',
                  hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: 13, fontWeight: FontWeight.w400),
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
              Text("Quantity", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16)),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: 'Enter Quantity',
                  hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: 13, fontWeight: FontWeight.w400),
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
              Text("Amount", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16)),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: 'Enter Amount',
                  hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: 13, fontWeight: FontWeight.w400),
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
              10.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Select an amount between \$20.00 - \$1000.00",
                    style: GoogleFonts.inter(color: Colors.white54, fontSize: 12),
                  ),
                ],
              ),
              10.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pre Order",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: AppColors.white, fontSize: 20),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          gradient: isPreOrder ? const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]) : null,
                          borderRadius: BorderRadius.circular(20),
                          color: isPreOrder ? null : Colors.grey[700],
                        ),
                      ),
                      Switch(
                        value: isPreOrder,
                        onChanged: (val) => setState(() => isPreOrder = val),
                        activeColor: Colors.transparent,
                        activeTrackColor: Colors.transparent,
                        inactiveTrackColor: Colors.transparent,
                        inactiveThumbColor: Colors.white,
                        trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                    ],
                  ),
                ],
              ),
              15.vSpace,
              Row(
                children: [
                  Container(
                    height: 20.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: const Color.fromARGB(255, 185, 111, 2),
                        size: 15.sp,
                      ),
                    ),
                  ),
                  10.hSpace,
                  Expanded(
                    child: Text(
                      "By clicking 'Buy Now', you agree to our Terms and Conditions, including our Cancellation Policy.",
                      style: GoogleFonts.poppins(color: Color(0xffDADADA), fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              60.vSpace,
              GestureDetector(
                onTap: () {
                  RoutingService.push(const GiftingSucess());
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(
                    child: Text(
                      "Confirm Purchase",
                      style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 18),
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

class GiftingSucess extends StatefulWidget {
  const GiftingSucess({
    super.key,
  });

  @override
  State<GiftingSucess> createState() => _GiftingSucessState();
}

class _GiftingSucessState extends State<GiftingSucess> {
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
                          RoutingService.push(const AccountScreen());
                        },
                        child: const CircleAvatar(
                          backgroundColor: AppColors.disableBtnColor,
                          radius: 22,
                          backgroundImage: AssetImage("assets/images/person.png"),
                        ),
                      ),
                      // 10.hSpace,
                    ],
                  ),
                ],
              ),
              30.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(color: Color.fromARGB(32, 87, 140, 26), borderRadius: BorderRadius.circular(65)),
                    child: SizedBox(
                      height: 55,
                      width: 55,
                      child: SvgPicture.asset(
                        "assets/svg/success1.svg",
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                ],
              ),
              20.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Thank you for your purchase!",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: ScreenService.isTablet ? 34 : 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              30.vSpace,
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xff151515).withOpacity(0.1), border: Border.all(color: Color(0xffCCCCCC))),
                padding: const EdgeInsets.all(26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          // onTap: () {
                          //   RoutingService.push(const RedeemStatus());
                          // },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: ScreenService.isTablet ? 55.w : 25.w, vertical: 30),
                            decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Gift Card Details",
                              style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: ScreenService.isTablet ? 24 : 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    35.vSpace,
                    _transactionRow("Payment Method", "Wallet"),
                    10.vSpace,
                    _transactionRow("Amount", "\$200.00"),
                    10.vSpace,
                    _transactionRow("Gift Card Code", "ABCD-1234-EFGH-5678"),
                    10.vSpace,
                    _transactionRow("Expiration Date", "12/31/2024"),
                    10.vSpace,
                    _transactionRow("Region", "United States"),
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
                                "Download Redemption",
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
              style: GoogleFonts.poppins(color: Color(0xffDADADA), fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: ScreenService.isTablet ? 14 : 12,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
