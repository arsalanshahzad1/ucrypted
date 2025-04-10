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

class NautaCubaTopUpScreen extends StatefulWidget {
  const NautaCubaTopUpScreen({super.key});

  @override
  State<NautaCubaTopUpScreen> createState() => _NautaCubaTopUpScreenState();
}

class _NautaCubaTopUpScreenState extends State<NautaCubaTopUpScreen> {
  String? selectedPaymentMethod;
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

  bool isChecked = false;
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
                        onTap: () {},
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
                "Nauta cuba Top-Up",
                style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 28),
              ),
              20.vSpace,
              Text("Payment Method", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w400)),
              10.vSpace,
              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF212121),
                    border: Border.all(color: Color(0xffCCCCCC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      dropdownColor: AppColors.disableBtnColor,
                      value: selectedPaymentMethod,
                      hint: Text(
                        "Select Payment Method",
                        style: GoogleFonts.poppins(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
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
                      items: ["Visa", "MasterCard", "PayPal"]
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
              20.vSpace,
              Text(
                "Email",
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
              ),
              10.vSpace,
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
              10.vSpace,
              Text(
                "Amount",
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
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              15.vSpace,
              Text("CUP Amount", style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 16)),
              10.vSpace,
              Container(
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffCCCCCC)),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("0.00", style: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: 19, fontWeight: FontWeight.w500)),
                    10.vSpace,
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Text("Delivery Amount", style: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontWeight: FontWeight.w400, fontSize: 8)),
                    ),
                  ],
                ),
              ),
              15.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Select an amount between \$20.00 - \$1000.00",
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              20.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SizedBox(height: 16.h, width: 16.w, child: SvgPicture.asset("assets/svg/tickfinal.svg")),
                    10.hSpace,
                    // Checkbox(
                    //   value: isChecked,
                    //   activeColor: AppColors.white,
                    //   checkColor: Colors.orange,
                    //   onChanged: (bool? value) {
                    //     setState(() {
                    //       isChecked = value ?? false;
                    //     });
                    //   },
                    // ),
                    Expanded(
                      child: Text(
                        "By clicking 'Buy Now', you agree to our Terms and Conditions, including our Cancellation Policy.",
                        style: GoogleFonts.poppins(color: Color(0xffDADADA), fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              25.vSpace,
              GestureDetector(
                onTap: () {
                  RoutingService.push(const NautaCubaSuccessScreen());
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
                      "Next",
                      style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 16),
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

class NautaCubaSuccessScreen extends StatefulWidget {
  const NautaCubaSuccessScreen({super.key});

  @override
  State<NautaCubaSuccessScreen> createState() => _NautaCubaSuccessScreenState();
}

class _NautaCubaSuccessScreenState extends State<NautaCubaSuccessScreen> {
  int _selectedIndex = 0;
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
                        onTap: () {},
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Your Transactions has been Successfully Proceed!",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                    color: Color(0xffFAFAFA),
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              30.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xff151515), borderRadius: BorderRadius.circular(12), border: Border.all(color: Color(0xffCCCCCC).withOpacity(0.2))),
                  padding: const EdgeInsets.all(26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                              color: Color(0xff212121),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Nauta Cuba Top-up Details",
                              style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      15.vSpace,
                      _transactionRow("Payment Method", "Wallet"),
                      15.vSpace,
                      _transactionRow("Top-up Amount", "\$100.00"),
                      15.vSpace,
                      _transactionRow("Email Address", "alice@gmail.com"),
                      15.vSpace,
                      _transactionRow("Transaction ID", "TRX-AUS101212"),
                      15.vSpace,
                      const Divider(color: AppColors.grey),
                      25.vSpace,
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
                                  "Download Top-up Receipt",
                                  style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      25.vSpace,
                      GestureDetector(
                        onTap: () {
                          RoutingService.pushAndRemoveUntil(const HomeScreen());
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
              ),
              50.vSpace,
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
              style: GoogleFonts.poppins(
                color: Color(0xffDADADA),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
