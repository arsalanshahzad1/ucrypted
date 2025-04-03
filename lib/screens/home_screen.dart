import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/convert_screen.dart';
import 'package:ucrypted_app/screens/deposit_crypto_screen.dart';
import 'package:ucrypted_app/screens/discover_screen.dart';
import 'package:ucrypted_app/screens/gift_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/screens/trading_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/candle_data.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/gradient_text.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';
import 'package:interactive_chart/interactive_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const TradingScreen(),
    const ConvertScreen(),
    const GiftScreen(),
    const DiscoverScreen(),
  ];

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
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.white,
          items: List.generate(5, (index) {
            return BottomNavigationBarItem(
              label: "",
              icon: SizedBox(
                height: 50,
                child: SvgPicture.asset(_unselectedIcons[index], width: 60, height: 60),
              ),
              activeIcon: SizedBox(
                child: SvgPicture.asset(
                  _selectedIcons[index],
                  width: 60,
                  height: 60,
                ),
              ),
            );
          }),
        ),
      ),
      child: _pages[_selectedIndex],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  int selectedIndexCustom = 1;
  bool isBalanceHide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              "assets/svg/menu-dots.svg",
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        actions: [
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              10.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => selectedIndex = 0),
                    child: GradientText(
                      "Overview",
                      style: GoogleFonts.inter(color: selectedIndex == 0 ? AppColors.textColor : Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                      gradient: selectedIndex == 0
                          ? const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)])
                          : const LinearGradient(
                              colors: [Colors.white, Colors.white],
                            ),
                    ),
                  ),
                  20.hSpace,
                  GestureDetector(
                    onTap: () => setState(() => selectedIndex = 1),
                    child: GradientText(
                      "Spot",
                      style: GoogleFonts.inter(color: selectedIndex == 1 ? AppColors.textColor : Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                      gradient: selectedIndex == 1
                          ? const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)])
                          : const LinearGradient(
                              colors: [Colors.white, Colors.white],
                            ),
                    ),
                  ),
                  20.hSpace,
                  GestureDetector(
                    onTap: () => setState(() => selectedIndex = 2),
                    child: GradientText(
                      "Funding",
                      style: GoogleFonts.inter(color: selectedIndex == 2 ? AppColors.textColor : Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                      gradient: selectedIndex == 2
                          ? const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)])
                          : const LinearGradient(
                              colors: [Colors.white, Colors.white],
                            ),
                    ),
                  ),
                ],
              ),
              10.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1.0,
                    width: 220.w,
                    decoration: BoxDecoration(color: AppColors.disableBtnColor, borderRadius: BorderRadius.circular(12)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/svg/eye.svg",
                      height: 20.h,
                      width: 20.w,
                    ),
                    onPressed: () {
                      setState(() {
                        isBalanceHide = !isBalanceHide;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  10.hSpace,
                  Text(
                    isBalanceHide ? "\$12,765.00" : "•••••••",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 36,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              20.vSpace,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildActionButton(Icons.arrow_upward, "Send", () {}),
                    10.hSpace,
                    buildActionButton(Icons.arrow_downward, "Deposit", () {
                      RoutingService.push(const DepositCryptoscreen());
                    }),
                    10.hSpace,
                    buildActionButton(Icons.arrow_downward, "Withdraw", () {}),
                  ],
                ),
              ),
              35.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Balances", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.white)),
                  Text("See all", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff838383))),
                ],
              ),
              25.vSpace,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    coinCard(
                      "assets/svg/eth.svg",
                      "ETH",
                      "19.00",
                    ),
                    18.hSpace,
                    coinCard(
                      "assets/svg/bsc.svg",
                      "BSC",
                      "19.19",
                    ),
                    18.hSpace,
                    coinCard(
                      "assets/svg/eth.svg",
                      "ETH",
                      "19.8878",
                    ),
                  ],
                ),
              ),
              30.vSpace,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => setState(() => selectedIndexCustom = 0),
                        child: GradientText(
                          "Recent Transactions",
                          style: GoogleFonts.inter(color: selectedIndexCustom == 0 ? AppColors.textColor : Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                          gradient: selectedIndexCustom == 0
                              ? const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Color(0xFFFCA509), Color(0xFF880306)],
                                )
                              : const LinearGradient(
                                  colors: [Colors.white, Colors.white], // White for unselected
                                ),
                        )),
                    30.hSpace,
                    GestureDetector(
                      onTap: () => setState(() => selectedIndexCustom = 1),
                      child: GradientText(
                        "Exchange History",
                        style: GoogleFonts.inter(color: selectedIndexCustom == 1 ? AppColors.textColor : Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                        gradient: selectedIndexCustom == 1
                            ? const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)])
                            : const LinearGradient(
                                colors: [Colors.white, Colors.white],
                              ),
                      ),
                    ),
                    30.hSpace,
                    GestureDetector(
                      onTap: () => setState(() => selectedIndexCustom = 2),
                      child: GradientText(
                        "Transaction",
                        style: GoogleFonts.inter(color: selectedIndexCustom == 2 ? AppColors.textColor : Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                        gradient: selectedIndexCustom == 2
                            ? const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)])
                            : const LinearGradient(
                                colors: [Colors.white, Colors.white],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              15.vSpace,
              Divider(
                height: 1.0,
                color: Color(0xff2C2C30),
              ),
              15.vSpace,
              Visibility(
                  visible: selectedIndexCustom == 1 ? true : false,
                  child: Column(
                    children: [
                      exchangeWidget("assets/svg/bscexc.svg"),
                      exchangeWidget("assets/svg/ethex.svg"),
                      exchangeWidget("assets/svg/bscexc.svg"),
                      exchangeWidget("assets/svg/ethex.svg"),
                      exchangeWidget("assets/svg/bscexc.svg"),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildActionButton(IconData icon, String label, Function onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      // onTap: onTap(),
      child: IntrinsicWidth(
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: const Color(0xFF202226),
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(icon, color: Colors.black),
              ),
              10.hSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget coinCard(String image, String title, String value) {
    return Container(
      height: 180.h,
      width: 200.w,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white, width: 2.0),
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SvgPicture.asset(
                  image,
                  height: 45,
                  width: 45,
                ),
                15.hSpace,
                Text(
                  title,
                  style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 18),
                )
              ],
            ),
          ),
          30.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Portfolio",
              style: GoogleFonts.inter(color: AppColors.grey, fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
          15.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(
                  "\$$value",
                  style: GoogleFonts.inter(color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: 20),
                  gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                ),
                Text(
                  "+10%",
                  style: GoogleFonts.inter(color: const Color(0xFF00C566), fontWeight: FontWeight.w400, fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget exchangeWidget(String image) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      decoration: BoxDecoration(
        // color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Circle with Icon
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // color: Colors.black,
            ),
            child: Center(
              child: SvgPicture.asset(
                image,
                width: 43.w,
                height: 43.h,
              ),
            ),
          ),
          const SizedBox(width: 5),

          // Transaction Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "BTC → ETH",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "#12123TRA",
                  style: GoogleFonts.inter(
                    color: Color(0xffACB5BB),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Amount Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "6,21 ETH",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "0.342 BTC",
                style: GoogleFonts.inter(
                  color: Color(0xffACB5BB),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
