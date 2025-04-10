import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:ucrypted_app/screens/chat_room_screen.dart';
import 'package:ucrypted_app/screens/discover_block_trade_screen.dart';
import 'package:ucrypted_app/screens/discover_cash_screen.dart';
import 'package:ucrypted_app/screens/discover_express_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/gradient_text.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class DiscoverP2PScreen extends StatefulWidget {
  const DiscoverP2PScreen({super.key});

  @override
  State<DiscoverP2PScreen> createState() => _DiscoverP2PScreenState();
}

class _DiscoverP2PScreenState extends State<DiscoverP2PScreen> with SingleTickerProviderStateMixin {
  int i = 4;

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
      i = index;
    });
  }

  late TabController _tabController;
  int selectedIndex = 1;
  int? j;

  final List<String> labels = ["Express", "P2P", "Block Trade", "Cash"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      bottomNavChild: selectedIndex == 0
          ? Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 28, 28, 30),
                border: Border(
                  top: BorderSide(color: Colors.black, width: 0.5),
                ),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                currentIndex: i,
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
            )
          : null,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.vSpace,
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(labels.length, (index) {
                        String text = labels[index];

                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              RoutingService.pushReplacement(const DiscoverExpressScreen());
                            } else if (index == 2) {
                              RoutingService.pushReplacement(const DiscoverBlockTradeScreen());
                            } else if (index == 3) {
                              RoutingService.pushReplacement(const DiscoverCashScreen());
                            } else {
                              setState(() {
                                selectedIndex = index;
                              });
                            }
                          },
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 0),
                                child: selectedIndex == index
                                    ? GradientText(
                                        text,
                                        gradient: const LinearGradient(
                                          colors: [Color(0xffFCA509), Color(0xff880306)],
                                        ),
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    : GradientText(
                                        text,
                                        gradient: const LinearGradient(
                                          colors: [Color(0xffCCCCCC), Color(0xff666666)],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final textPainter = TextPainter(
                                    text: TextSpan(
                                      text: text,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    maxLines: 1,
                                    textDirection: TextDirection.ltr,
                                  )..layout();

                                  return Container(
                                    width: textPainter.width, // Dynamic width
                                    height: 2,
                                    // margin: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                      gradient: selectedIndex == index
                                          ? const LinearGradient(
                                              colors: [Color(0xffFCA509), Color(0xff880306)],
                                            )
                                          : null,
                                      color: selectedIndex == index ? null : const Color(0xff666666),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    5.hSpace,
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset("assets/svg/inof.svg"),
                      ],
                    )),
                  ],
                ),
                20.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: p2pDetail(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget p2pDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select payment method",
          style: GoogleFonts.inter(fontSize: 24, color: Color(0xffffffff), fontWeight: FontWeight.w600),
        ),
        15.vSpace,
        Text(
          "This list will refresh in 43s",
          style: GoogleFonts.inter(fontSize: 16, color: Color(0xffffffff), fontWeight: FontWeight.w500),
        ),
        10.vSpace,
        Text(
          "Bank Transfer",
          style: GoogleFonts.inter(fontSize: 14, color: Color(0xffffffff), fontWeight: FontWeight.w500),
        ),
        20.vSpace,
        settingsItem("assets/images/paypal.png", "Paypal", 0),
        25.vSpace,
        settingsItem("assets/images/us.png", "US Bank", 1),
        25.vSpace,
        settingsItem("assets/images/otherbank.png", "Other Bank", 2),
        25.vSpace,
        Text(
          "Credit/Debit Card",
          style: GoogleFonts.inter(
            color: AppColors.grey,
            fontSize: 16,
          ),
        ),
        10.vSpace,
        settingsItem("assets/images/add.png", "Add new Card", 3),
        100.vSpace,
        GestureDetector(
          onTap: () {
            // Get.bottomSheet(isScrollControlled: true, filterBottomSheet(700.h, "\$21.00", "\$23.0120", () {}, context));
            RoutingService.pushReplacement(const P2PBuyScreen());
          },
          child: Container(
            height: 40.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Center(
              child: Text(
                "continue",
                style: GoogleFonts.inter(color: Color(0xffffffff), fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget settingsItem(
    String icon,
    String title,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          j = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 22, 22, 23),
            borderRadius: BorderRadius.circular(8.r),
            border: j != index
                ? Border.all(color: Colors.transparent)
                : GradientBoxBorder(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]))),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Row(
          children: [
            Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r), color: Colors.transparent),
                child: Image.asset(
                  icon,
                  // fit: BoxFit.cover,
                )),
            15.hSpace,
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.grey[800]),
          ],
        ),
      ),
    );
  }

  Widget p2pBottomSheet(double height, String title, String subtitle, VoidCallback onTap, BuildContext c) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        color: Color(0xff161618),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 3.h,
                width: 120.w,
                decoration: BoxDecoration(color: Color(0xff44444A), borderRadius: BorderRadius.circular(12.r)),
              ),
            ],
          ),
          20.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "P2P",
                style: GoogleFonts.inter(
                  color: Color(0xff6C7278),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          10.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Start small if this is your first P2P trade",
              style: GoogleFonts.inter(
                color: Color(0xffFFFFFF),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          10.vSpace,
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                height: 1.0,
                color: Color(0xff2C2C30),
              )),
          10.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "We recommend starting with an order under 1,000 CNY for your first P2P trade.",
              style: GoogleFonts.inter(
                color: Color(0xff6C7278),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          10.vSpace,
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                height: 1.0,
                color: Color(0xff2C2C30),
              )),
          10.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Larger orders may require additional verification from sellers,potentially delaying your trade.",
              style: GoogleFonts.inter(
                color: Color(0xff6C7278),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          20.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap: () {
                Get.back();
                // RoutingService.push(const PaymentSelectScreenP2P());
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.08),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.04),
                      blurRadius: 12,
                      spreadRadius: 1,
                      offset: Offset(0, 0),
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.06),
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Start with 100 \$",
                    style: GoogleFonts.inter(color: Color(0xffFFFFFF), fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
          10.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap: () {
                Get.back();
                // RoutingService.push(const PaymentSelectScreenP2P());
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Center(
                  child: Text(
                    "Keep current amount",
                    style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class P2PBuyScreen extends StatefulWidget {
  const P2PBuyScreen({super.key});

  @override
  State<P2PBuyScreen> createState() => _P2PBuyScreenState();
}

class _P2PBuyScreenState extends State<P2PBuyScreen> with SingleTickerProviderStateMixin {
  int selectedIndex = 1;
  bool isChecked = false;
  int? j;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<String> labels = ["Express", "P2P", "Block Trade", "Cash"];
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.vSpace,
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(labels.length, (index) {
                        String text = labels[index];
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              RoutingService.pushReplacement(const DiscoverExpressScreen());
                            } else if (index == 3) {
                              RoutingService.pushReplacement(const DiscoverCashScreen());
                            } else if (index == 2) {
                              RoutingService.pushReplacement(const DiscoverBlockTradeScreen());
                            } else {
                              setState(() {
                                selectedIndex = index;
                              });
                            }
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 0),
                                child: selectedIndex == index
                                    ? GradientText(
                                        text,
                                        gradient: const LinearGradient(
                                          colors: [Color(0xffFCA509), Color(0xff880306)],
                                        ),
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    : GradientText(
                                        text,
                                        gradient: const LinearGradient(
                                          colors: [Color(0xffCCCCCC), Color(0xff666666)],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final textPainter = TextPainter(
                                    text: TextSpan(
                                      text: text,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    maxLines: 1,
                                    textDirection: TextDirection.ltr,
                                  )..layout();

                                  return Container(
                                    width: textPainter.width, // Dynamic width
                                    height: 2,
                                    // margin: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                      gradient: selectedIndex == index
                                          ? const LinearGradient(
                                              colors: [Color(0xffFCA509), Color(0xff880306)],
                                            )
                                          : null,
                                      color: selectedIndex == index ? null : const Color(0xff666666),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    5.hSpace,
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset("assets/svg/inof.svg"),
                      ],
                    )),
                  ],
                ),
                20.vSpace,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 35.h,
                          width: 120.w,
                          decoration: BoxDecoration(color: Color.fromARGB(255, 27, 27, 28), borderRadius: BorderRadius.circular(30), border: Border.all(color: Color(0xff3C3C3C))),
                          child: TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            isScrollable: false,
                            dividerColor: Colors.transparent,
                            controller: _tabController,
                            indicator: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.white,
                            labelStyle: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14),
                            tabs: const [
                              Tab(text: "Buy"),
                              Tab(text: "Sell"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          BuyBlockTrade(),
                          SellBlockTrade(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget BuyBlockTrade() {
    return SingleChildScrollView(
      child: Column(
        children: [
          25.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: SvgPicture.asset("assets/svg/btcc.svg"),
                  ),
                  10.hSpace,
                  Text(
                    "BTC",
                    style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  5.hSpace,
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  10.hSpace,
                  Text(
                    "Amount",
                    style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  5.hSpace,
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  10.hSpace,
                  Text(
                    "Payment",
                    style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  5.hSpace,
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(isScrollControlled: true, filterBottomSheet(700.h, "\$21.00", "\$23.0120", () {}, context));
                },
                child: Container(
                  height: 28.h,
                  width: 33.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: Color(0xff393737)),
                  ),
                  child: Center(
                    child: SvgPicture.asset("assets/svg/filter2.svg"),
                  ),
                ),
              ),
            ],
          ),
          10.vSpace,
          BuySellCard(true, true, "Link-Exchange", "88.46", () {
            // RoutingService.pushReplacement(const OrderCreated());
            RoutingService.pushReplacement(const OrderCreated());
          }),
          5.vSpace,
          BuySellCard(false, true, "Inter-Exchange", "86.32", () {
            RoutingService.pushReplacement(const OrderCreated());
          }),
          5.vSpace,
          BuySellCard(true, true, "Inter-Exchange", "88.46", () {
            RoutingService.pushReplacement(const OrderCreated());
          }),
          5.vSpace,
          BuySellCard(false, true, "Inter-Exchange", "86.32", () {
            RoutingService.pushReplacement(const OrderCreated());
          }),
          5.vSpace,
          BuySellCard(true, true, "Inter-Exchange", "86.32", () {
            RoutingService.pushReplacement(const OrderCreated());
          }),
          5.vSpace,
        ],
      ),
    );
  }

  Widget SellBlockTrade() {
    return SingleChildScrollView(
      child: Column(
        children: [
          25.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: SvgPicture.asset("assets/svg/btcc.svg"),
                  ),
                  10.hSpace,
                  Text(
                    "BTC",
                    style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  5.hSpace,
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  10.hSpace,
                  Text(
                    "Amount",
                    style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  5.hSpace,
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  10.hSpace,
                  Text(
                    "Payment",
                    style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  5.hSpace,
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(isScrollControlled: true, filterBottomSheet(700.h, "\$21.00", "\$23.0120", () {}, context));
                },
                child: Container(
                  height: 28.h,
                  width: 33.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: Color(0xff393737)),
                  ),
                  child: Center(
                    child: SvgPicture.asset("assets/svg/filter2.svg"),
                  ),
                ),
              ),
            ],
          ),
          10.vSpace,
          BuySellCard(true, false, "Link-Exchange", "88.46", () {
            RoutingService.pushReplacement(const OrderCreated());
          }),
          5.vSpace,
          BuySellCard(false, false, "Inter-Exchange", "86.32", () {
            RoutingService.pushReplacement(const OrderCreated());
          }),
          5.vSpace,
          BuySellCard(true, false, "Inter-Exchange", "88.46", () {
            RoutingService.pushReplacement(const OrderCreated());
          }),
          5.vSpace,
          BuySellCard(false, false, "Inter-Exchange", "86.32", () {
            RoutingService.pushReplacement(const OrderCreated());
          }),
          5.vSpace,
          BuySellCard(true, false, "Inter-Exchange", "86.32", () {
            RoutingService.pushReplacement(const OrderCreated());
          }),
          5.vSpace,
        ],
      ),
    );
  }

  Widget filterBottomSheet(double height, String title, String subtitle, VoidCallback onTap, BuildContext c) {
    bool first = false;
    bool second = true;
    bool third = false;
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        color: Color(0xff161618),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 4.h,
                    width: 70.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xff44444A)),
                  ),
                ],
              ),
            ),
            10.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  10.hSpace,
                  Text(
                    "Filter",
                    style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 28, color: AppColors.white),
                  ),
                ],
              ),
            ),
            30.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Ad Type",
                style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.white),
              ),
            ),
            10.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tradable Ads Only",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff6C7278),
                    ),
                  ),
                  SizedBox(height: 20.h, width: 30.w, child: Image.asset("assets/images/toggle1.png"))
                ],
              ),
            ),
            10.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Verified Merchants Ads only",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff6C7278),
                    ),
                  ),
                  SizedBox(height: 20.h, width: 30.w, child: Image.asset("assets/images/toggle2.png"))
                ],
              ),
            ),
            10.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ads with no Verification Requires",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff6C7278),
                    ),
                  ),
                  SizedBox(height: 20.h, width: 30.w, child: Image.asset("assets/images/toggle1.png"))
                ],
              ),
            ),
            5.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1.0,
                color: Color(0xff2C2C30),
              ),
            ),
            5.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Amount",
                style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.white),
              ),
            ),
            10.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter total Amount',
                  hintStyle: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w400),
                  suffixText: 'USD',
                  suffixStyle: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w400),
                  filled: true,
                  fillColor: Color(0xFF1C1C1E),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Color(0xff2C2C30)), // subtle visible border
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Color(0xff2C2C30),
                      ) // )border color when focused
                      ),
                ),
              ),
            ),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1.0,
                color: Color(0xff2C2C30),
              ),
            ),
            10.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Payment Time Limit (minutes)",
                style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.white),
              ),
            ),
            10.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 38.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff2C2C30)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        "All",
                        style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xff6C7278)),
                      ),
                    ),
                  ),
                  15.hSpace,
                  Container(
                    height: 38.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff2C2C30)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        "15",
                        style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xff6C7278)),
                      ),
                    ),
                  ),
                  15.hSpace,
                  Container(
                    height: 38.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff2C2C30)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        "30",
                        style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xff6C7278)),
                      ),
                    ),
                  ),
                  15.hSpace,
                  Container(
                    height: 38.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff2C2C30)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        "45",
                        style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xff6C7278)),
                      ),
                    ),
                  ),
                  15.hSpace,
                  Container(
                    height: 38.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff2C2C30)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        "60",
                        style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xff6C7278)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1.0,
                color: Color(0xff2C2C30),
              ),
            ),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Payment Method(s)",
                style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.white),
              ),
            ),
            10.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff2C2C30)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          "All",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xff6C7278)),
                        ),
                      ),
                    ),
                  ),
                  15.hSpace,
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff2C2C30)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          "Bank Transfer",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xff6C7278)),
                        ),
                      ),
                    ),
                  ),
                  15.hSpace,
                ],
              ),
            ),
            5.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff2C2C30)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          "Paypal Only",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xff6C7278)),
                        ),
                      ),
                    ),
                  ),
                  15.hSpace,
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff2C2C30)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          "Payoneer",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xff6C7278)),
                        ),
                      ),
                    ),
                  ),
                  15.hSpace,
                ],
              ),
            ),
            5.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff2C2C30)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          "Other",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xff6C7278)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40.h,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Color(0xff222223), borderRadius: BorderRadius.circular(28), border: Border.all(color: Color(0xff2C2C30))),
                        child: Center(
                          child: Text(
                            "Reset",
                            style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  10.hSpace,
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40.h,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Color(0xffFFFFFF), borderRadius: BorderRadius.circular(28), border: Border.all(color: Color(0xffFFFFFF))),
                        child: Center(
                          child: Text(
                            "Continue",
                            style: GoogleFonts.inter(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            20.vSpace,
          ],
        ),
      ),
    );
  }

  Widget BuySellCard(
    bool isOnline,
    bool isBuy,
    String title,
    String price,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 350,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: const Color(0xFF0F0F0F), borderRadius: BorderRadius.circular(16), border: Border.all(color: Color(0xff393737))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/person.png'), // Replace with your avatar
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: isOnline == true ? Color(0xff00B300) : Color(0xffFF9500),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 1.5),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          color: Color(0xffD5D5D5),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GradientText(
                        isOnline == true ? 'Online' : "Offline",
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                        gradient: isOnline == true
                            ? LinearGradient(colors: [
                                Color(0xff00B300),
                                Color(0xff004D00),
                              ], end: Alignment.bottomCenter, begin: Alignment.topCenter)
                            : LinearGradient(colors: [
                                Color(0xffFF9500),
                                Color(0xffFF9500),
                              ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
                      ),
                    ],
                  ),
                ),
                GradientText(
                  '95.56%',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  gradient: const LinearGradient(colors: [
                    Color(0xff00B300),
                    Color(0xff004D00),
                  ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Price & Button row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      price + " ",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'USD',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffD5D5D5),
                      ),
                    ),
                  ],
                ),
                isBuy == true
                    ? Container(
                        height: 26.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          gradient: const LinearGradient(colors: [
                            Color(0xff00B300),
                            Color(0xff004D00),
                          ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
                        ),
                        child: Center(
                          child: Text(
                            'Buy',
                            style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ),
                      )
                    : Container(
                        height: 26.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          gradient: const LinearGradient(colors: [
                            Color(0xffD70365),
                            Color(0xff880306),
                          ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
                        ),
                        child: Center(
                          child: Text(
                            'Sell',
                            style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ),
                      )
              ],
            ),

            const SizedBox(height: 10),
            Divider(
              height: 1.0,
              color: Color(0xff393737),
            ),
            10.vSpace,
            // Limits and availability
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Limit : USD 50,000 - 100,000',
                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 10, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Available : 170,318.18 USDT',
                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 10, fontWeight: FontWeight.w400),
                ),
              ],
            ),

            const SizedBox(height: 5),

            Divider(
              height: 1.0,
              color: Color(0xff393737),
            ),

            const SizedBox(height: 10),

            Text(
              '68,226 Transactions · 99.83% Completion',
              style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 11, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCreated extends StatefulWidget {
  const OrderCreated({super.key});

  @override
  State<OrderCreated> createState() => _OrderCreatedState();
}

class _OrderCreatedState extends State<OrderCreated> {
  int selectedIndex = 1;
  bool isChecked = false;
  int? j;

  final List<String> labels = ["Express", "P2P", "Block Trade", "Cash"];
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.vSpace,
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(labels.length, (index) {
                        String text = labels[index];
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              RoutingService.pushReplacement(const DiscoverExpressScreen());
                            } else if (index == 3) {
                              RoutingService.pushReplacement(const DiscoverCashScreen());
                            } else if (index == 2) {
                              RoutingService.pushReplacement(const DiscoverBlockTradeScreen());
                            } else {
                              setState(() {
                                selectedIndex = index;
                              });
                            }
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 0),
                                child: selectedIndex == index
                                    ? GradientText(
                                        text,
                                        gradient: const LinearGradient(
                                          colors: [Color(0xffFCA509), Color(0xff880306)],
                                        ),
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    : GradientText(
                                        text,
                                        gradient: const LinearGradient(
                                          colors: [Color(0xffCCCCCC), Color(0xff666666)],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final textPainter = TextPainter(
                                    text: TextSpan(
                                      text: text,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    maxLines: 1,
                                    textDirection: TextDirection.ltr,
                                  )..layout();

                                  return Container(
                                    width: textPainter.width, // Dynamic width
                                    height: 2,
                                    // margin: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                      gradient: selectedIndex == index
                                          ? const LinearGradient(
                                              colors: [Color(0xffFCA509), Color(0xff880306)],
                                            )
                                          : null,
                                      color: selectedIndex == index ? null : const Color(0xff666666),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    5.hSpace,
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset("assets/svg/inof.svg"),
                      ],
                    )),
                  ],
                ),
                20.vSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Created",
                        style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      10.vSpace,
                      Text(
                        "Pay the seller within  14:48",
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      10.vSpace,
                      Divider(
                        height: 1.0,
                        color: Color(0xff393737),
                      ),
                      10.vSpace,
                      Text(
                        "Enable order shortcuts",
                        style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w400, color: Color(0xffD5D5D5)),
                      ),
                      10.vSpace,
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                        decoration: BoxDecoration(
                          color: Color(0xff0F0F0F),
                          border: Border.all(color: Color(0xff393737)),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    const CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage('assets/images/person.png'), // Replace with your avatar
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Color(0xff00B300),
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.black, width: 1.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Link-Exchange",
                                        style: GoogleFonts.inter(
                                          color: Color(0xffD5D5D5),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      GradientText('Online',
                                          style: GoogleFonts.inter(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          gradient: LinearGradient(colors: [
                                            Color(0xff00B300),
                                            Color(0xff004D00),
                                          ], end: Alignment.bottomCenter, begin: Alignment.topCenter)),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    RoutingService.push(const ChatRoomScreen());
                                  },
                                  child: Container(
                                    height: 25.h,
                                    width: 55.w,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Chat",
                                        style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            10.vSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Escrowed Crypto",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontWeight: FontWeight.w400, fontSize: 11),
                                ),
                                Text(
                                  "Escrowed Crypto",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontWeight: FontWeight.w400, fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      10.vSpace,
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                        decoration: BoxDecoration(
                          color: Color(0xff0F0F0F),
                          border: Border.all(color: Color(0xff393737)),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Buy USDT",
                                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            10.vSpace,
                            Divider(
                              height: 1.0,
                              color: Color(0xff393737),
                            ),
                            10.vSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Fiat Amount",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Rs 10,000",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 12, fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            10.vSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Price",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Rs 291.69",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 12, fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            10.vSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Recevive Quantity",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "34.23 USDT",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 12, fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      20.vSpace,
                      Text(
                        "Payment Method",
                        style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 11, fontWeight: FontWeight.w400),
                      ),
                      10.vSpace,
                      Divider(
                        height: 1.0,
                        color: Color(0xff393737),
                      ),
                      10.vSpace,
                      Text(
                        "paypal",
                        style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      10.vSpace,
                      Text(
                        "Advertiser’s Terms",
                        style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      10.vSpace,
                      Text(
                        "Third-party party payment not allowed..",
                        style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      10.vSpace,
                      GradientText(
                        "Read More",
                        gradient: const LinearGradient(
                          colors: [Color(0xffFCA509), Color(0xff880306)],
                        ),
                        style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      20.vSpace,
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
                      50.vSpace,
                      GestureDetector(
                        onTap: () {
                          RoutingService.pushReplacement(const PayTheSeller());
                        },
                        child: Container(
                          height: 40.h,
                          // width: 200.w,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Center(
                            child: Text(
                              "View Payment Details ",
                              style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PayTheSeller extends StatefulWidget {
  const PayTheSeller({super.key});

  @override
  State<PayTheSeller> createState() => _PayTheSellerState();
}

class _PayTheSellerState extends State<PayTheSeller> {
  int selectedIndex = 1;
  bool isChecked = false;
  int? j;

  final List<String> labels = ["Express", "P2P", "Block Trade", "Cash"];
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.vSpace,
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(labels.length, (index) {
                        String text = labels[index];
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              RoutingService.pushReplacement(const DiscoverExpressScreen());
                            } else if (index == 3) {
                              RoutingService.pushReplacement(const DiscoverCashScreen());
                            } else if (index == 2) {
                              RoutingService.pushReplacement(const DiscoverBlockTradeScreen());
                            } else {
                              setState(() {
                                selectedIndex = index;
                              });
                            }
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 0),
                                child: selectedIndex == index
                                    ? GradientText(
                                        text,
                                        gradient: const LinearGradient(
                                          colors: [Color(0xffFCA509), Color(0xff880306)],
                                        ),
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    : GradientText(
                                        text,
                                        gradient: const LinearGradient(
                                          colors: [Color(0xffCCCCCC), Color(0xff666666)],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final textPainter = TextPainter(
                                    text: TextSpan(
                                      text: text,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    maxLines: 1,
                                    textDirection: TextDirection.ltr,
                                  )..layout();

                                  return Container(
                                    width: textPainter.width, // Dynamic width
                                    height: 2,
                                    // margin: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                      gradient: selectedIndex == index
                                          ? const LinearGradient(
                                              colors: [Color(0xffFCA509), Color(0xff880306)],
                                            )
                                          : null,
                                      color: selectedIndex == index ? null : const Color(0xff666666),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    5.hSpace,
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset("assets/svg/inof.svg"),
                      ],
                    )),
                  ],
                ),
                20.vSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pay the seller",
                            style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              RoutingService.push(const ChatRoomScreen());
                            },
                            child: Container(
                              height: 30.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Text(
                                  "Chat",
                                  style: GoogleFonts.poppins(color: Color(0xffF2F2F7), fontWeight: FontWeight.w400, fontSize: 11),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      10.vSpace,
                      Text(
                        "Order will be cancelled in 14:48",
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      10.vSpace,
                      Divider(
                        height: 1.0,
                        color: Color(0xff393737),
                      ),
                      10.vSpace,
                      Text(
                        "Enable order shortcuts",
                        style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xffD5D5D5)),
                      ),
                      10.vSpace,
                      Row(
                        children: [
                          Container(
                            height: 18.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: const Color.fromARGB(255, 185, 111, 2),
                                size: 13.sp,
                              ),
                            ),
                          ),
                          10.hSpace,
                          Text(
                            "Transfer via paypal Only",
                            style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffD5D5D5)),
                          ),
                        ],
                      ),
                      10.vSpace,
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                        decoration: BoxDecoration(
                          color: Color(0xff0F0F0F),
                          border: Border.all(color: Color(0xff393737)),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Paypal",
                              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                            10.vSpace,
                            Divider(
                              height: 1.0,
                              color: Color(0xff393737),
                            ),
                            10.vSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "You Pay",
                                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffD5D5D5)),
                                ),
                                Text(
                                  "Rs 10,000",
                                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffD5D5D5)),
                                ),
                              ],
                            ),
                            5.vSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Full Name",
                                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffD5D5D5)),
                                ),
                                Text(
                                  "Salman Shah",
                                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffD5D5D5)),
                                ),
                              ],
                            ),
                            5.vSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Paypal account",
                                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffD5D5D5)),
                                ),
                                Text(
                                  "uix.shah@gmail.com",
                                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffD5D5D5)),
                                ),
                              ],
                            ),
                            5.vSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Other payment details",
                                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffD5D5D5)),
                                ),
                                Text(
                                  "03489914431",
                                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffD5D5D5)),
                                ),
                              ],
                            ),
                            5.vSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "International transfer",
                                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffD5D5D5)),
                                ),
                                Text(
                                  "Paypal to paypal",
                                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffD5D5D5)),
                                ),
                              ],
                            ),
                            5.vSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Ref message",
                                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffD5D5D5)),
                                ),
                                Text(
                                  "23218638712536512",
                                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffD5D5D5)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      20.vSpace,
                      Text(
                        "Use your own payment account and ensure that the name on the account matches the name you used to verify...",
                        style: GoogleFonts.poppins(color: Color(0xffDADADA), fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      15.vSpace,
                      Row(
                        children: [
                          Container(
                            height: 18.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: const Color.fromARGB(255, 185, 111, 2),
                                size: 13.sp,
                              ),
                            ),
                          ),
                          10.hSpace,
                          Expanded(
                            child: Text(
                              "After payment, tap the button bellow to notify the seller.",
                              style: GoogleFonts.poppins(color: Color(0xffDADADA), fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      100.vSpace,
                      GestureDetector(
                        onTap: () {
                          // RoutingService.pushAndRemoveUntil(const HomeScreen());
                        },
                        child: Container(
                          height: 40.h,
                          // width: 200.w,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Center(
                            child: Text(
                              "Cancel the order",
                              style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      10.vSpace,
                      GestureDetector(
                        onTap: () {
                          RoutingService.pushReplacement(const DetailPaymentWidget());
                        },
                        child: Container(
                          height: 40.h,
                          // width: 200.w,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Center(
                            child: Text(
                              "View Payment Details ",
                              style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailPaymentWidget extends StatefulWidget {
  const DetailPaymentWidget({super.key});

  @override
  State<DetailPaymentWidget> createState() => _DetailPaymentWidgetState();
}

class _DetailPaymentWidgetState extends State<DetailPaymentWidget> {
  int selectedIndex = 1;
  bool isChecked = false;
  int? j;
  final TextEditingController _amountController = TextEditingController(text: "\$227.00");

  final List<String> labels = ["Express", "P2P", "Block Trade", "Cash"];
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.vSpace,
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(labels.length, (index) {
                        String text = labels[index];
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              RoutingService.pushReplacement(const DiscoverExpressScreen());
                            } else if (index == 3) {
                              RoutingService.pushReplacement(const DiscoverCashScreen());
                            } else if (index == 2) {
                              RoutingService.pushReplacement(const DiscoverBlockTradeScreen());
                            } else {
                              setState(() {
                                selectedIndex = index;
                              });
                            }
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 0),
                                child: selectedIndex == index
                                    ? GradientText(
                                        text,
                                        gradient: const LinearGradient(
                                          colors: [Color(0xffFCA509), Color(0xff880306)],
                                        ),
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    : GradientText(
                                        text,
                                        gradient: const LinearGradient(
                                          colors: [Color(0xffCCCCCC), Color(0xff666666)],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final textPainter = TextPainter(
                                    text: TextSpan(
                                      text: text,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    maxLines: 1,
                                    textDirection: TextDirection.ltr,
                                  )..layout();

                                  return Container(
                                    width: textPainter.width, // Dynamic width
                                    height: 2,
                                    // margin: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                      gradient: selectedIndex == index
                                          ? const LinearGradient(
                                              colors: [Color(0xffFCA509), Color(0xff880306)],
                                            )
                                          : null,
                                      color: selectedIndex == index ? null : const Color(0xff666666),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    5.hSpace,
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset("assets/svg/inof.svg"),
                      ],
                    )),
                  ],
                ),
                20.vSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                        decoration: BoxDecoration(
                          color: Color(0xff0F0F0F),
                          border: Border.all(color: Color(0xff393737)),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    const CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage('assets/images/person.png'), // Replace with your avatar
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Color(0xff00B300),
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.black, width: 1.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Link-Exchange",
                                        style: GoogleFonts.inter(
                                          color: Color(0xffD5D5D5),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      GradientText('Online',
                                          style: GoogleFonts.inter(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          gradient: LinearGradient(colors: [
                                            Color(0xff00B300),
                                            Color(0xff004D00),
                                          ], end: Alignment.bottomCenter, begin: Alignment.topCenter)),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    RoutingService.push(const ChatRoomScreen());
                                  },
                                  child: Container(
                                    height: 25.h,
                                    width: 55.w,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Chat",
                                        style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            10.vSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Escrowed Crypto",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontWeight: FontWeight.w400, fontSize: 11),
                                ),
                                Text(
                                  "32.54 USDT",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontWeight: FontWeight.w400, fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      10.vSpace,
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                        decoration: BoxDecoration(
                          color: Color(0xff0F0F0F),
                          border: Border.all(color: Color(0xff393737)),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Buy USDT",
                                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            10.vSpace,
                            Divider(
                              height: 1.0,
                              color: Color(0xff393737),
                            ),
                            10.vSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Fiat Amount",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Rs 10,000",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 12, fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            10.vSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Price",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Rs 291.69",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 12, fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            10.vSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Recevive Quantity",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "34.23 USDT",
                                  style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 12, fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      20.vSpace,
                      Text(
                        "Payment Method",
                        style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 11, fontWeight: FontWeight.w400),
                      ),
                      10.vSpace,
                      Divider(
                        height: 1.0,
                        color: Color(0xff393737),
                      ),
                      10.vSpace,
                      Text(
                        "paypal",
                        style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      10.vSpace,
                      Text(
                        "Advertiser’s Terms",
                        style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      10.vSpace,
                      Text(
                        "Third-party party payment not allowed..",
                        style: GoogleFonts.inter(color: Color(0xffD5D5D5), fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      10.vSpace,
                      GradientText(
                        "Read More",
                        gradient: const LinearGradient(
                          colors: [Color(0xffFCA509), Color(0xff880306)],
                        ),
                        style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      100.vSpace,
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(bottomSheetContent(500, _amountController.text, "\$00.00", "\$21.00", "\$23.0120", () {
                            // RoutingService.push(const InputRecoverySuccessScreen());
                          }));
                        },
                        child: Container(
                          height: 40.h,
                          // width: 200.w,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Center(
                            child: Text(
                              "Back Payment Details",
                              style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheetContent(
    double height,
    String amount,
    String tpAmount,
    String pFees,
    String tPayment,
    VoidCallback onTap,
  ) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/modal.png",
          ),
          fit: BoxFit.contain,
        ),
        // gradient: LinearGradient(
        //   colors: [
        //     Color(0xFF2C2C30),
        //     Color(0xFF161618),
        //   ],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Container(height: 4, width: 70, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xff44444A)))],
            ),
            20.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Amount Top up",
                  style: GoogleFonts.inter(color: Color(0xff6C7278), fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ],
            ),
            10.vSpace,
            Text(
              "$amount",
              style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 32),
            ),
            10.vSpace,
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E20),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xff2C2C30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svg/inof.svg"),
                  10.hSpace,
                  Text(
                    "Topup with Stripe will not Cost any fee !",
                    style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            20.vSpace,
            const Divider(
              height: 0.5,
              color: Color(0xFF2C2C30),
            ),
            20.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Up Amount",
                  style: GoogleFonts.inter(fontSize: 14, color: Color(0xff6C7278), fontWeight: FontWeight.w500),
                ),
                Text(
                  tpAmount,
                  style: GoogleFonts.inter(fontSize: 15, color: AppColors.white, fontWeight: FontWeight.w500),
                )
              ],
            ),
            20.vSpace,
            const Divider(
              height: 0.5,
              color: Color(0xFF2C2C30),
            ),
            20.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Platform Fees",
                  style: GoogleFonts.inter(fontSize: 14, color: Color(0xff6C7278), fontWeight: FontWeight.w500),
                ),
                Text(
                  pFees,
                  style: GoogleFonts.inter(fontSize: 15, color: AppColors.white, fontWeight: FontWeight.w500),
                )
              ],
            ),
            20.vSpace,
            const Divider(
              height: 0.5,
              color: Color(0xFF2C2C30),
            ),
            20.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Payment",
                  style: GoogleFonts.inter(fontSize: 14, color: Color(0xff6C7278), fontWeight: FontWeight.w500),
                ),
                Text(
                  tPayment,
                  style: GoogleFonts.inter(fontSize: 15, color: AppColors.white, fontWeight: FontWeight.w500),
                )
              ],
            ),
            20.vSpace,
            GestureDetector(
              onTap: () {
                Get.back();
                Get.back();
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
                    "Back To Home",
                    style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
