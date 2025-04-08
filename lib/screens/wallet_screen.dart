import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/gradient_text.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int _selectedIndex = 0;
  bool showWallet = true;

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

  int selectedIndex = 0;
  int selectedIndexCustom = 1;
  bool isBalanceHide = true;

  final List<List<Color>> cardGradients = [
    [Color.fromARGB(255, 170, 3, 142), Color.fromARGB(255, 171, 135, 244)],
    [Color(0xFFFCA509), Color.fromARGB(255, 139, 35, 37)],
    [Color.fromARGB(223, 85, 56, 148), Color.fromARGB(255, 64, 48, 150)],
  ];

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
                    ],
                  ),
                ],
              ),
              10.vSpace,
              Column(
                children: [
                  // 10.vSpace,
                  if (showWallet == true) ...[
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
                            // RoutingService.push(const DepositCryptoscreen());
                          }),
                          10.hSpace,
                          buildActionButton(Icons.arrow_downward, "Withdraw", () {}),
                        ],
                      ),
                    ),
                  ],
                  if (showWallet == false) ...[
                    Container(
                      width: 330.w,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(border: Border.all(color: Color(0xff2C2C30)), borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 20.h,
                                    width: 3.w,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xffECAC31)),
                                  ),
                                  10.hSpace,
                                  Text(
                                    "BTC Wallet",
                                    style: GoogleFonts.inter(color: Color(0xffACB5BB), fontWeight: FontWeight.w400, fontSize: 14),
                                  )
                                ],
                              ),
                              SizedBox(height: 40.h, width: 40.w, child: SvgPicture.asset("assets/svg/bscexc.svg")),
                            ],
                          ),
                          10.vSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "0.34545 ",
                                    style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "BTC",
                                    style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Text(
                                "21900,84 USD",
                                style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          10.vSpace,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(color: Color(0xff161618), borderRadius: BorderRadius.circular(8), border: Border.all(color: Color(0xff2C2C30))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "OxsD12F32xvW3deG5...",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffACB5BB),
                                  ),
                                ),
                                Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(color: Color(0xff2C2C30), borderRadius: BorderRadius.circular(8.r)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset("assets/svg/copy1.svg"),
                                  ),
                                )
                              ],
                            ),
                          ),
                          10.vSpace,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xff1E1E20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "1 BTC : 70859,40 USD",
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffACB5BB),
                                      ),
                                    ),
                                    5.vSpace,
                                    Text(
                                      "Total selling amount : 54,634 \$",
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffACB5BB),
                                      ),
                                    ),
                                    5.vSpace,
                                    Text(
                                      "Total buying buy : 534,263 \$",
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffACB5BB),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          15.vSpace,
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // RoutingService.pushAndRemoveUntil(const HomeScreen());
                                  },
                                  child: Container(
                                    height: 45.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Withdraw",
                                        style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              10.hSpace,
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // RoutingService.pushAndRemoveUntil(const HomeScreen());
                                  },
                                  child: Container(
                                    height: 45.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xff2C2C30),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Deposite",
                                        style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.vSpace,
                    Container(
                      // height: 470.h,
                      width: 330.w,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(border: Border.all(color: Color(0xff2C2C30)), borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 20.h,
                                    width: 3.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient:
                                          const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color.fromARGB(255, 204, 6, 9)]),
                                    ),
                                  ),
                                  10.hSpace,
                                  Text(
                                    "ETH Wallet",
                                    style: GoogleFonts.inter(color: Color(0xffACB5BB), fontWeight: FontWeight.w400, fontSize: 14),
                                  )
                                ],
                              ),
                              SizedBox(height: 40.h, width: 40.w, child: SvgPicture.asset("assets/svg/ethex.svg")),
                            ],
                          ),
                          10.vSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "12,345 ",
                                    style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "ETH",
                                    style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Text(
                                "37870,88 USD",
                                style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          10.vSpace,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(color: Color(0xff161618), borderRadius: BorderRadius.circular(8), border: Border.all(color: Color(0xff2C2C30))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "OxsD12F32xvW3deG5...",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffACB5BB),
                                  ),
                                ),
                                Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(color: Color(0xff2C2C30), borderRadius: BorderRadius.circular(8.r)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset("assets/svg/copy1.svg"),
                                  ),
                                )
                              ],
                            ),
                          ),
                          10.vSpace,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xff1E1E20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "1 ETH : 273 USD",
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffACB5BB),
                                      ),
                                    ),
                                    5.vSpace,
                                    Text(
                                      "Total selling amount : 79,634 \$",
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffACB5BB),
                                      ),
                                    ),
                                    5.vSpace,
                                    Text(
                                      "Total buying buy : 534,263 \$",
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffACB5BB),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          15.vSpace,
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // RoutingService.pushAndRemoveUntil(const HomeScreen());
                                  },
                                  child: Container(
                                    height: 45.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Withdraw",
                                        style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              10.hSpace,
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // RoutingService.pushAndRemoveUntil(const HomeScreen());
                                  },
                                  child: Container(
                                    height: 45.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xff2C2C30),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Deposite",
                                        style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.vSpace,
                    SizedBox(
                      height: 470.h,
                      width: 330.w,
                      child: FittedBox(
                        fit: BoxFit.fitWidth, // or .scaleDown, .fitWidth etc.
                        child: SvgPicture.asset("assets/svg/balance-flow.svg"),
                      ),
                    )
                  ],
                  35.vSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("My Cards", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.white)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              showWallet = !showWallet;
                            });
                          },
                          child: SvgPicture.asset("assets/svg/more.svg"))
                    ],
                  ),
                  if (showWallet == true) ...[
                    // 10.vSpace,
                    Container(
                      height: 250.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Card carousel
                          SizedBox(
                            height: 210.h,
                            child: PageView.builder(
                              controller: PageController(viewportFraction: 0.78, initialPage: 1),
                              itemCount: cardGradients.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.h),
                                  child: Column(
                                    children: [
                                      _buildCard(index, cardGradients[index]),
                                      10.vSpace,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 20.h,
                                            width: 40.w,
                                            child: SvgPicture.asset("assets/svg/dotd.svg"),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          // Overlay starting slightly below half and sticking out of the card stack
                          Positioned(
                            // top: 100.h, // move slightly below halfway of card height
                            left: 0,
                            bottom: 10,
                            right: 0,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              child: Container(
                                height: 130.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                child: Image.asset(
                                  "assets/images/overlay.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                  // 25.vSpace,
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
                                      colors: [Colors.white, Colors.white],
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(int index, List<Color> gradientColors) {
    return Container(
      height: 180.h,
      width: 300.w,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: LinearGradient(
          end: Alignment.topLeft,
          begin: Alignment.bottomRight,
          colors: gradientColors,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Debit card",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Frieda Wirtz",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          10.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "\$ 36,654",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          10.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "**** **** ****",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                " 3465",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          5.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/svg/card1.svg"),
              Text(
                " 7/25",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
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
