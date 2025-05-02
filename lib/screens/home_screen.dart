import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/chat_room_screen.dart';
import 'package:ucrypted_app/screens/convert_screen.dart';
import 'package:ucrypted_app/screens/deposit_crypto_screen.dart';
import 'package:ucrypted_app/screens/discover_screen.dart';
import 'package:ucrypted_app/screens/discover_send_screen.dart';
import 'package:ucrypted_app/screens/discover_withdraw_screen.dart';
import 'package:ucrypted_app/screens/gift_listing_screen.dart';
import 'package:ucrypted_app/screens/gift_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/screens/trading_screen.dart';
import 'package:ucrypted_app/screens/wallet_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/candle_data.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/gradient_text.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Widget> _pages;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // final List<Widget> _pages = [
  //   HomePage(onNavChange: _onItemTapped),
  //   const TradingScreen(),
  //   const ConvertScreen(),
  //   const GiftScreen(),
  //   const DiscoverScreen(),
  // ];
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

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(onNavChange: _onItemTapped),
      const TradingScreen(),
      const ConvertScreen(),
      const GiftListingScreen(),
      DiscoverScreen(
        onNavChange: _onItemTapped,
      ),
    ];
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
      child: _pages[_selectedIndex],
    );
  }
}

class HomePage extends StatefulWidget {
  final void Function(int)? onNavChange;
  const HomePage({super.key, this.onNavChange});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  int selectedIndexCustom = 1;
  bool isBalanceHide = true;
  bool showConverter = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            RoutingService.push(const WalletScreen());
          },
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isTablet ? 30 : 16),
          child: Column(
            children: [
              5.vSpace,
              if (showConverter == false) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => selectedIndex = 0),
                      child: GradientText(
                        "Overview",
                        style: GoogleFonts.inter(
                            color: selectedIndex == 0 ? AppColors.textColor : Colors.white, fontSize: ScreenService.isTablet ? 18 : 14, fontWeight: FontWeight.w600),
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
                        style: GoogleFonts.inter(
                            color: selectedIndex == 1 ? AppColors.textColor : Colors.white, fontSize: ScreenService.isTablet ? 18 : 14, fontWeight: FontWeight.w600),
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
                        style: GoogleFonts.inter(
                            color: selectedIndex == 2 ? AppColors.textColor : Colors.white, fontSize: ScreenService.isTablet ? 18 : 14, fontWeight: FontWeight.w600),
                        gradient: selectedIndex == 2
                            ? const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)])
                            : const LinearGradient(
                                colors: [Colors.white, Colors.white],
                              ),
                      ),
                    ),
                  ],
                ),
                6.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1.0,
                      width: ScreenService.isTablet ? 150.w : 220.w,
                      decoration: BoxDecoration(color: AppColors.disableBtnColor, borderRadius: BorderRadius.circular(12)),
                    ),
                  ],
                ),
              ],
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
                        showConverter = !showConverter;
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
                    "\$12,765.00",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 36,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              15.vSpace,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildActionButton(Icons.arrow_upward, "Send", () {
                      RoutingService.push(const DiscoverSendScreen());
                    }),
                    10.hSpace,
                    buildActionButton(Icons.arrow_downward, "Deposit", () {
                      RoutingService.push(const DepositCryptoscreen());
                    }),
                    10.hSpace,
                    buildActionButton(Icons.arrow_downward, "Withdraw", () {
                      RoutingService.push(const DiscoverWithdrawScreen());
                    }),
                  ],
                ),
              ),
              20.vSpace,
              if (!showConverter) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Balances", style: GoogleFonts.inter(fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w600, color: AppColors.white)),
                    GestureDetector(
                        onTap: () {},
                        child: Text("See all", style: GoogleFonts.poppins(fontSize: ScreenService.isTablet ? 16 : 12, fontWeight: FontWeight.w500, color: Color(0xff838383)))),
                  ],
                ),
                10.vSpace,
              ],
              if (showConverter == false) ...[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      coinCard(
                        "assets/svg/eth.svg",
                        "ETH",
                        "19,654",
                        () {
                          widget.onNavChange?.call(1);
                        },
                        "assets/images/irc2.png",
                      ),
                      18.hSpace,
                      coinCard("assets/svg/bsc.svg", "BSC", "112,654", () {
                        widget.onNavChange?.call(1);
                      }, "assets/images/irc1.png", i: true),
                      18.hSpace,
                      coinCard(
                        "assets/svg/eth.svg",
                        "ETH",
                        "19.8878",
                        () {
                          widget.onNavChange?.call(1);
                        },
                        "assets/images/irc2.png",
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
                          child: Text(
                            "Recent Transactions",
                            style: GoogleFonts.inter(color: Colors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w600),
                          )),
                      ScreenService.isTablet ? 50.hSpace : 30.hSpace,
                      GestureDetector(
                        onTap: () => setState(() => selectedIndexCustom = 1),
                        child: Text(
                          "Exchange History",
                          style: GoogleFonts.inter(color: Colors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                      ScreenService.isTablet ? 40.hSpace : 30.hSpace,
                      GestureDetector(
                        onTap: () => setState(() => selectedIndexCustom = 2),
                        child: Text(
                          "Transaction",
                          style: GoogleFonts.inter(color: Colors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                10.vSpace,
                ScreenService.isTablet
                    ? SizedBox(
                        height: 1.5,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                color: Color(0xFF1B1B1F),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFDA6B1A),
                                      Color(0xFFAC2C24),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                color: Color(0xFF1B1B1F),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 1.5,
                        child: Row(
                          children: [
                            // Gradient part (1/3)
                            Expanded(
                              flex: 3, // 3 + 3 = 6 to match 3 sections total
                              child: Container(
                                color: Color(0xFF1B1B1F),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFDA6B1A),
                                      Color(0xFFAC2C24),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // Solid dark gray part (2/3)
                            Expanded(
                              flex: 1, // 3 + 3 = 6 to match 3 sections total
                              child: Container(
                                color: Color(0xFF1B1B1F),
                              ),
                            ),
                          ],
                        ),
                      ),
                15.vSpace,
                Column(
                  children: [
                    exchangeWidget("assets/svg/bscexc.svg", () {
                      widget.onNavChange?.call(1);
                    }),
                    exchangeWidget("assets/svg/ethex.svg", () {}),
                    exchangeWidget("assets/svg/bscexc.svg", () {}),
                    exchangeWidget("assets/svg/ethex.svg", () {}),
                    exchangeWidget("assets/svg/bscexc.svg", () {}),
                  ],
                ),
              ],
              if (showConverter == true) ...[
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 110.h,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xff0000003).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                            // gradient: RadialGradient(
                            //   center: Alignment.bottomRight,
                            //   radius: 1.0,
                            //   colors: [
                            //     Colors.green.withOpacity(0.2),
                            //     Colors.transparent,
                            //   ],
                            //   stops: const [0.2, 1.0],
                            // ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Exchange",
                                    style: GoogleFonts.inter(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              20.vSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.blue,
                                        backgroundImage: AssetImage("assets/images/dol1.png"),
                                      ),
                                      10.hSpace,
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "DOLLAR",
                                                style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 22, color: Colors.white),
                                              ),
                                              // 10.hSpace,
                                              GestureDetector(
                                                onTap: () {
                                                  RoutingService.push(const DepositCryptoscreen());
                                                },
                                                child: const Icon(
                                                  Icons.arrow_drop_down_outlined,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "0\$",
                                        style: GoogleFonts.poppins(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        0.vSpace,
                        Stack(
                          children: [
                            // Gradient layer 1 (bottomLeft - blue)
                            Container(
                              height: 110.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: RadialGradient(
                                  center: Alignment.bottomLeft,
                                  radius: 1.0,
                                  colors: [
                                    Colors.blue.withOpacity(0.2),
                                    Colors.transparent,
                                  ],
                                  stops: const [0.2, 1.0],
                                ),
                              ),
                            ),
                            // Gradient layer 2 (bottomRight - green)
                            // Container(
                            //   height: 110.h,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10),
                            //     gradient: RadialGradient(
                            //       center: Alignment.topRight,
                            //       radius: 1.0,
                            //       colors: [
                            //         Colors.green.withOpacity(0.2),
                            //         Colors.transparent,
                            //       ],
                            //       stops: const [0.2, 1.0],
                            //     ),
                            //   ),
                            // ),
                            // Actual content
                            Container(
                              height: 110.h,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  20.vSpace,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Exchange To",
                                        style: GoogleFonts.inter(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.vSpace,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.blue.withOpacity(.6),
                                            backgroundImage: AssetImage("assets/images/dol.png"),
                                          ),
                                          10.hSpace,
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "USDC",
                                                    style: GoogleFonts.inter(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 22,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      RoutingService.push(const DepositCryptoscreen());
                                                    },
                                                    child: Icon(
                                                      Icons.arrow_drop_down_outlined,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "0\$",
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 75.h,
                      child: Center(
                          child: SvgPicture.asset(
                        "assets/svg/convert.svg",
                        height: 48.h,
                        width: 48.w,
                      )),
                    ),
                  ],
                ),
                20.vSpace,
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(15), border: Border.all(color: Color(0xff393737))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Buy USDC",
                            style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                          Row(
                            children: [
                              Text(
                                "USDC",
                                style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                              ),
                              10.hSpace,
                              SvgPicture.asset("assets/svg/con.svg")
                            ],
                          ),
                        ],
                      ),
                      5.vSpace,
                      Divider(
                        height: 1.0,
                        color: Color(0xff393737),
                      ),
                      15.vSpace,
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Unit price 291.50",
                                    style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: 11),
                                  ),
                                  10.vSpace,
                                  Text(
                                    "Quantity 5.14 USDT",
                                    style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: 11),
                                  ),
                                ],
                              ),
                              Text(
                                "03/01/2025, 19:53",
                                style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: 11),
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Saqib Trander",
                            style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: 11),
                          ),
                          Row(
                            children: [
                              GradientText(
                                "Convert",
                                style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14),
                                gradient: LinearGradient(colors: [
                                  Color(0xffFCA509),
                                  Color(0xff880306),
                                ]),
                              ),
                              5.hSpace,
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 14,
                                color: Color(0xff7E8088),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                100.vSpace,
              ]
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
          height: ScreenService.isTablet ? 45.h : 55,
          decoration: BoxDecoration(
            color: const Color(0xFF202226),
            borderRadius: BorderRadius.circular(ScreenService.isTablet ? 32 : 24),
          ),
          padding: EdgeInsets.symmetric(horizontal: ScreenService.isTablet ? 20 : 12),
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
                padding: EdgeInsets.symmetric(horizontal: ScreenService.isTablet ? 20 : 10),
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: ScreenService.isTablet ? 18 : 14,
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

  Widget coinCard(String image, String title, String value, VoidCallback onTap, String asset, {bool? i}) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Positioned image at bottom right middle
          Positioned(
            bottom: -40,
            right: ScreenService.isTablet ? -140 : -60,
            child: SizedBox(
              height: 180.h,
              width: 180.w,
              child: Image.asset(
                asset,
                color: Color(0xff202226).withOpacity(0.70),
              ),
            ),
          ),

          // Main card container
          Container(
            height: 172.h,
            width: ScreenService.isTablet ? 190.w : 200.w,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.white, width: 1.0),
              // color: Color(0xff202226).withOpacity(0.55),
              color: Color.fromARGB(255, 41, 44, 49).withOpacity(0.55),
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
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenService.isTablet ? 22 : 18,
                        ),
                      )
                    ],
                  ),
                ),
                ScreenService.isTablet ? 40.vSpace : 30.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Portfolio",
                    style: GoogleFonts.inter(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: ScreenService.isTablet ? 18 : 16,
                    ),
                  ),
                ),
                ScreenService.isTablet ? 30.vSpace : 15.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GradientText(
                        "\$$value",
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenService.isTablet ? 22 : 18,
                        ),
                        gradient: i != true
                            ? const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFFFCA509), Color(0xFF880306)],
                              )
                            : const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.white, Colors.white],
                              ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 10.h,
                            width: 10.w,
                            child: SvgPicture.asset("assets/svg/ic.svg"),
                          ),
                          3.hSpace,
                          Text(
                            "+10%",
                            style: GoogleFonts.inter(
                              color: const Color(0xFF00C566),
                              fontWeight: FontWeight.w400,
                              fontSize: ScreenService.isTablet ? 20 : 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget exchangeWidget(String image, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            ScreenService.isTablet ? const SizedBox(width: 10) : const SizedBox(width: 5),
            // Transaction Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BTC → ETH",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: ScreenService.isTablet ? 17 : 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "#12123TRA",
                    style: GoogleFonts.inter(
                      color: Color(0xffACB5BB),
                      fontSize: ScreenService.isTablet ? 14 : 12,
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
                    fontSize: ScreenService.isTablet ? 16 : 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "0.342 BTC",
                  style: GoogleFonts.inter(
                    color: Color(0xffACB5BB),
                    fontSize: ScreenService.isTablet ? 14 : 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
