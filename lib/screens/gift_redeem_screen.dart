import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/home_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/custom_textfield.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class GiftRedeemScreen extends StatefulWidget {
  const GiftRedeemScreen({super.key});

  @override
  State<GiftRedeemScreen> createState() => _GiftRedeemScreenState();
}

class _GiftRedeemScreenState extends State<GiftRedeemScreen> {
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
              Text("Country", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16)),
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
                      value: selectCountry,
                      hint: Text(
                        "Select Country",
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
                        "Select Country 1",
                        "Select Country 2",
                        "Select Country 3",
                        "Select Country 4",
                      ]
                          .map((method) => DropdownMenuItem(
                                value: method,
                                child: Text(method, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12)),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectCountry = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              25.vSpace,
              Text("Redemption Method", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16)),
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
              Text("Card Activation Code", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16)),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: 'Please Enter Activation code ',
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
              Text("Card Value (\$)", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16)),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: 'Enter Card Value',
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
              Text("Conversion Rate", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16)),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: '0',
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
              Text("Card Range", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16)),
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
                      value: selectedCardRange,
                      hint: Text(
                        "\$1000",
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
                        "\$10-100K",
                        "\$100-1500K",
                      ]
                          .map((method) => DropdownMenuItem(
                                value: method,
                                child: Text(method, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12)),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCardRange = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              25.vSpace,
              Text("Cash Value", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16)),
              20.vSpace,
              Container(
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white30),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("0.00", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 24)),
                    10.vSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text("0% fees will be charged on wallet transfer and 5% fees will be charged on bank transfer.",
                          textAlign: TextAlign.center, style: GoogleFonts.poppins(color: AppColors.white, fontSize: 9, fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
              ),
              10.vSpace,
              if (selectedPaymentMethod == 'Wallet') ...[
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
                            gradient:
                                isPreOrder ? const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]) : null,
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
              ],
              15.vSpace,
              Row(
                children: [
                  SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked = newValue ?? false;
                        });
                      },
                      activeColor: Colors.orange,
                      fillColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.orange;
                        }
                        return Colors.grey[300];
                      }),
                    ),
                  ),
                  5.hSpace,
                  Expanded(
                    child: Text(
                      "By clicking 'Buy Now', you agree to our Terms and Conditions, including our Cancellation Policy.",
                      style: GoogleFonts.poppins(color: Color(0xffDADADA), fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              20.vSpace,
              GestureDetector(
                onTap: () {
                  RoutingService.push(GiftRedeemSuccessScreen(
                    fromWallet: selectedPaymentMethod == "Wallet" ? true : false,
                  ));
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

class GiftRedeemSuccessScreen extends StatefulWidget {
  final bool fromWallet;

  const GiftRedeemSuccessScreen({super.key, required this.fromWallet});

  @override
  State<GiftRedeemSuccessScreen> createState() => _GiftRedeemSuccessScreenState();
}

class _GiftRedeemSuccessScreenState extends State<GiftRedeemSuccessScreen> {
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
              Text(
                "Thank you for your Redemption!",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              30.vSpace,
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey.withOpacity(0.1), border: Border.all(color: AppColors.grey)),
                padding: const EdgeInsets.all(26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                          decoration: BoxDecoration(
                            color: AppColors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Redeem Card Details",
                            style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                    15.vSpace,
                    _transactionRow("Payment Method", widget.fromWallet == true ? "Wallet" : "Credit Card"),
                    10.vSpace,
                    _transactionRow("Amount", "\$100.00"),
                    10.vSpace,
                    if (!widget.fromWallet) ...[
                      _transactionRow("Credit Card", "4564-235533-343432"),
                      10.vSpace,
                      _transactionRow("Card Holder Name", "Alice"),
                      10.vSpace,
                    ],
                    _transactionRow("Email Address", "alice@gmail.com"),
                    10.vSpace,
                    _transactionRow("Transaction ID", "TRX-AUS101212"),
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
                                style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 16),
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
                                style: GoogleFonts.poppins(color: Color(0xffDADADA), fontWeight: FontWeight.w400, fontSize: 16),
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
              if (!widget.fromWallet) ...[
                30.vSpace,
                Text(
                  "For any discrepancies or complaints, please contact: support@ucrypted.com. The top-up should reflect in the recipient's account shortly. If you encounter any issues, feel free to contact our support team.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(fontSize: 12, color: AppColors.grey, fontWeight: FontWeight.normal),
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
              style: GoogleFonts.poppins(color: Color(0xffDADADA), fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
