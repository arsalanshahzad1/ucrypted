import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:ucrypted_app/screens/chat_room_screen.dart';
import 'package:ucrypted_app/screens/deposit_crypto_screen.dart';
import 'package:ucrypted_app/screens/discover_block_trade_screen.dart';
import 'package:ucrypted_app/screens/discover_cash_screen.dart';
import 'package:ucrypted_app/screens/discover_p2p_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/gradient_text.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class DiscoverExpressScreen extends StatefulWidget {
  const DiscoverExpressScreen({super.key});

  @override
  State<DiscoverExpressScreen> createState() => _DiscoverExpressScreenState();
}

class _DiscoverExpressScreenState extends State<DiscoverExpressScreen> with SingleTickerProviderStateMixin {
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
  int selectedIndex = 0;
  int? j;

  final List<String> labels = ["Express", "P2P", "Block Trade", "Cash"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  bool isSwapped = false;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/p2pbg.png",
      fit: BoxFit.cover,
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
          padding: EdgeInsets.symmetric(horizontal: ScreenService.isTablet ? 30 : 16),
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
                          // Inner Navigation
                          onTap: () {
                            if (index == 1) {
                              RoutingService.pushReplacement(const DiscoverP2PScreen(
                                fromExpress: false,
                              ));
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
                                          fontSize: ScreenService.isTablet ? 18 : 16,
                                          fontWeight: FontWeight.w500,
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
                                          fontSize: ScreenService.isTablet ? 18 : 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final textPainter = TextPainter(
                                    text: TextSpan(
                                      text: text,
                                      style: GoogleFonts.inter(
                                        fontSize: ScreenService.isTablet ? 18 : 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    maxLines: 1,
                                    textDirection: TextDirection.ltr,
                                  )..layout();

                                  return Container(
                                    width: textPainter.width, // Dynamic width
                                    height: 1,
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
                Visibility(
                    visible: selectedIndex == 0,
                    child: Column(
                      children: [
                        Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: Color(0xff222223),
                            borderRadius: BorderRadius.circular(30),
                          ),
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
                            labelStyle: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: ScreenService.isTablet ? 16 : 14),
                            tabs: const [
                              Tab(text: "Buy"),
                              Tab(text: "Sell"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              convertAndLinkWidget(),
                              convertAndLinkWidget(),
                            ],
                          ),
                        ),
                      ],
                    )),
                Visibility(
                    visible: selectedIndex == 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: p2pDetail(),
                    )),
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
          onTap: () {},
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

  Widget p2pBottomSheet(double height, VoidCallback onTap, BuildContext c) {
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
          // 20.vSpace,
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap: () {
                // Get.back();
                RoutingService.push(const DiscoverP2PScreen(
                  fromExpress: true,
                ));
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
                // Get.back();
                RoutingService.push(const DiscoverP2PScreen(
                  fromExpress: true,
                ));
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
          10.vSpace,
        ],
      ),
    );
  }

  Widget buildBottomSheetContent1(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 300.h,
        decoration: const BoxDecoration(
          color: Color(0xff1E1E20),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(20),
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
                    fontSize: ScreenService.isTablet ? 16 : 14,
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
                  fontSize: ScreenService.isTablet ? 26 : 24,
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
                  fontSize: ScreenService.isTablet ? 16 : 14,
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
                  fontSize: ScreenService.isTablet ? 16 : 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // 20.vSpace,
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: () {
                  // Get.back();
                  RoutingService.push(const DiscoverP2PScreen(
                    fromExpress: true,
                  ));
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
                      style: GoogleFonts.inter(color: Color(0xffFFFFFF), fontWeight: FontWeight.w600, fontSize: ScreenService.isTablet ? 16 : 14),
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
                  // Get.back();
                  RoutingService.push(const DiscoverP2PScreen(
                    fromExpress: true,
                  ));
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
                      style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: ScreenService.isTablet ? 16 : 14),
                    ),
                  ),
                ),
              ),
            ),
            10.vSpace,
          ],
        ),
      ),
    );
  }

  Widget convertAndLinkWidget() {
    return Column(
      children: [
        50.vSpace,
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
                    color: const Color(0xff0000003).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      10.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your Pay",
                            style: GoogleFonts.inter(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: ScreenService.isTablet ? 16 : 14,
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
                                radius: ScreenService.isTablet ? 22 : 20,
                                backgroundColor: Colors.blue,
                                backgroundImage: AssetImage(
                                  isSwapped ? "assets/images/dol.png" : "assets/images/dol1.png",
                                ),
                              ),
                              10.hSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        isSwapped ? "USDC" : "DOLLAR",
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: ScreenService.isTablet ? 24 : 22,
                                          color: Colors.white,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          RoutingService.push(
                                            const DepositCryptoscreen(),
                                          );
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
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: ScreenService.isTablet ? 24 : 22,
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
                15.vSpace,
                Stack(
                  children: [
                    // Gradient layer 1
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
                    // Gradient layer 2
                    Container(
                      height: 110.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: RadialGradient(
                          center: Alignment.topRight,
                          radius: 1.0,
                          colors: [
                            Colors.green.withOpacity(0.2),
                            Colors.transparent,
                          ],
                          stops: const [0.2, 1.0],
                        ),
                      ),
                    ),
                    // Actual content
                    Container(
                      height: 110.h,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          20.vSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "You Receive",
                                style: GoogleFonts.inter(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: ScreenService.isTablet ? 16 : 14,
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
                                    radius: ScreenService.isTablet ? 22 : 20,
                                    backgroundColor: Colors.blue.withOpacity(.6),
                                    backgroundImage: AssetImage(
                                      isSwapped ? "assets/images/dol1.png" : "assets/images/dol.png",
                                    ),
                                  ),
                                  10.hSpace,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            isSwapped ? "DOLLAR" : "USDC",
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontSize: ScreenService.isTablet ? 24 : 22,
                                              color: Colors.white,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              RoutingService.push(
                                                const DepositCryptoscreen(),
                                              );
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
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: ScreenService.isTablet ? 24 : 22,
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
            // Convert icon
            Positioned(
              top: 95.h,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSwapped = !isSwapped;
                    });
                  },
                  child: SvgPicture.asset(
                    "assets/svg/convert.svg",
                    height: 48.h,
                    width: 48.w,
                  ),
                ),
              ),
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
                    style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w700, fontSize: ScreenService.isTablet ? 18 : 16),
                  ),
                  Row(
                    children: [
                      Text(
                        "USDC",
                        style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 16 : 14),
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
                            style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 13 : 11),
                          ),
                          10.vSpace,
                          Text(
                            "Quantity 5.14 USDT",
                            style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 13 : 11),
                          ),
                        ],
                      ),
                      Text(
                        "03/01/2025, 19:53",
                        style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 13 : 11),
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
                    style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 13 : 11),
                  ),
                  Row(
                    children: [
                      GradientText(
                        "Completed",
                        style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: ScreenService.isTablet ? 16 : 14),
                        gradient: LinearGradient(colors: [
                          Color(0xffFCA509),
                          Color(0xff880306),
                        ]),
                      ),
                      5.hSpace,
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: ScreenService.isTablet ? 16 : 14,
                        color: Color(0xff7E8088),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        40.vSpace,
        GestureDetector(
          onTap: () {
            !ScreenService.isTablet
                ? Get.bottomSheet(
                    p2pBottomSheet(400.h, () {
                      // RoutingService.push(const InputRecoverySuccessScreen());
                    }, context),
                  )
                : showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    constraints: BoxConstraints(
                        // maxHeight: 1000,
                        ),
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff1E1E20),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: buildBottomSheetContent1(context), // replace this with your Column/Widgets
                        ),
                      );
                    },
                  );
          },
          child: Container(
            height: ScreenService.isTablet ? 60 : 50,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color.fromARGB(255, 28, 28, 29), Color.fromARGB(255, 53, 50, 50)]),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Center(
              child: Text(
                "Select payment method",
                style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: ScreenService.isTablet ? 16 : 14),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRow(String title, String value, IconData? trailingIcon, bool i) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.inter(color: Color(0xff7E8088), fontSize: 14, fontWeight: FontWeight.w400),
            ),
            4.hSpace,
            !i ? const Icon(Icons.help_outline, color: Colors.grey, size: 14) : SizedBox.shrink(),
          ],
        ),
        Row(
          children: [
            Text(
              value,
              style: GoogleFonts.inter(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
            ),
            if (trailingIcon != null) ...[
              6.hSpace,
              Icon(trailingIcon, color: Colors.grey, size: 12),
            ],
          ],
        ),
      ],
    );
  }
}

class P2PConfirmScreen extends StatefulWidget {
  const P2PConfirmScreen({super.key});

  @override
  State<P2PConfirmScreen> createState() => _P2PConfirmScreenState();
}

class _P2PConfirmScreenState extends State<P2PConfirmScreen> {
  int selectedIndex = 0;
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

  final List<String> labels = ["Express", "P2P", "Block Trade", "Cash"];
  int j = 0;

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
      ),
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
                          // Inner Navigation
                          onTap: () {
                            if (j == 1) {
                              RoutingService.pushReplacement(const DiscoverP2PScreen(
                                fromExpress: false,
                              ));
                            } else if (j == 2) {
                              RoutingService.pushReplacement(const DiscoverBlockTradeScreen());
                            } else if (j == 3) {
                              RoutingService.pushReplacement(const DiscoverCashScreen());
                            } else {
                              setState(() {
                                j = index;
                              });
                            }
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 0),
                                child: j == index
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
                                      gradient: j == index
                                          ? const LinearGradient(
                                              colors: [Color(0xffFCA509), Color(0xff880306)],
                                            )
                                          : null,
                                      color: j == index ? null : const Color(0xff666666),
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
                5.vSpace,
                _buildToggleContainer(),
                // _buildCustomUnderline(),
                const SizedBox(height: 20),
                if (selectedIndex == 0) ...[
                  Column(
                    children: [
                      customWidget("Completed", () {
                        RoutingService.pushReplacement(const ExpressNoAdScreen());
                      }),
                      10.vSpace,
                      customWidget("Completed", () {
                        RoutingService.pushReplacement(const ExpressNoAdScreen());
                      }),
                      10.vSpace,
                      customWidget("Completed", () {
                        RoutingService.pushReplacement(const ExpressNoAdScreen());
                      })
                    ],
                  ),
                ],
                if (selectedIndex == 1) ...[
                  Column(
                    children: [
                      customWidget("Pending", () {
                        RoutingService.pushReplacement(const ExpressNoAdScreen());
                      }),
                      10.vSpace,
                      customWidget("Pending", () {
                        RoutingService.pushReplacement(const ExpressNoAdScreen());
                      }),
                    ],
                  ),
                ],
                if (selectedIndex == 2) ...[
                  Column(
                    children: [
                      customWidget("Canceled", () {
                        RoutingService.pushReplacement(const ExpressNoAdScreen());
                      })
                    ],
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(3, (index) {
        String text = index == 0
            ? "Completed"
            : index == 1
                ? "Pending"
                : "Canceled";

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
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
                          colors: [
                            Color(0xffCCCCCC),
                            Color(0xff666666),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff666666),
                        ),
                      ),
              ),
              // Dynamic underline width
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
                    width: textPainter.width, // Dynamic width based on text
                    height: 2,
                    margin: const EdgeInsets.only(top: 4),
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
    );
  }

  Widget _buildCustomUnderline() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Stack(
        children: [
          // Grey inactive underlines
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: 50,
                height: 2,
                color: const Color(0xff666666),
              );
            }),
          ),
          // Animated active underline
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: selectedIndex * 80.0, // Moves underline based on selection
            child: Container(
              width: 50,
              height: 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xffFCA509), Color(0xff880306)]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customWidget(String status, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                      status,
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
    );
  }
}

class ExpressNoAdScreen extends StatefulWidget {
  const ExpressNoAdScreen({super.key});

  @override
  State<ExpressNoAdScreen> createState() => _ExpressNoAdScreenState();
}

class _ExpressNoAdScreenState extends State<ExpressNoAdScreen> with SingleTickerProviderStateMixin {
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
  int selectedIndex = 0;
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
      ),
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
                          // Inner Navigation
                          onTap: () {
                            if (index == 1) {
                              RoutingService.pushReplacement(const DiscoverP2PScreen(
                                fromExpress: false,
                              ));
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
                70.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      // height: 50.h,
                      // width: 50.w,
                      child: SvgPicture.asset("assets/svg/ssg1.svg"),
                    ),
                  ],
                ),
                20.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientText(
                      "No Ads Found",
                      gradient: const LinearGradient(
                        colors: [Color(0xffFCA509), Color(0xff880306)],
                      ),
                      style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                10.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create an ad to buyu or sell srypto",
                      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xffFAFAFA)),
                    ),
                  ],
                ),
                20.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        RoutingService.pushReplacement(const ChatListing());
                      },
                      child: SizedBox(
                        // height: 50.h,
                        // width: 50.w,
                        child: SvgPicture.asset("assets/svg/ssg2.svg"),
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
}

class ChatListing extends StatefulWidget {
  const ChatListing({super.key});

  @override
  State<ChatListing> createState() => _ChatListingState();
}

class _ChatListingState extends State<ChatListing> with SingleTickerProviderStateMixin {
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
  int selectedIndex = 0;
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
      ),
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
                          // Inner Navigation
                          onTap: () {
                            if (index == 1) {
                              RoutingService.pushReplacement(const DiscoverP2PScreen(
                                fromExpress: false,
                              ));
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 50.h,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.08), // Shattered border base
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
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/svg/searchh.svg"),
                        SizedBox(width: 10),
                        Text(
                          'Search',
                          style: GoogleFonts.inter(color: Color(0xffCDCDCD), fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                30.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      RoutingService.push(const ChatDetailing());
                    },
                    child: Column(
                      children: [
                        chatTile1("Jhon Doe", "Order Message ( Seller received payment.", "Just now"),
                        10.vSpace,
                        chatTile("Chris", "Order Message ( Seller received payment.", "25 min Ago"),
                        10.vSpace,
                        chatTile("Williams", "Order Message ( Seller received payment.", "5h ago"),
                        10.vSpace,
                        chatTile("Alex", "Order Message ( Seller received payment.", "Yesterday"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget chatTile1(String titile, String msg, String timeAgo) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            border: GradientBoxBorder(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFCA509), Color(0xFF880306)],
              ),
              width: 0.9,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 17.r,
                      backgroundImage: AssetImage("assets/images/person.png"),
                    ),
                    16.hSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titile,
                          style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          msg,
                          style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 10, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GradientText(
                    timeAgo,
                    gradient: LinearGradient(colors: [
                      Color(0xffCCCCCC),
                      Color(0xff666666),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 228, 145, 12).withOpacity(0.3), // Light orange glow
                  Color.fromARGB(0, 56, 54, 50),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget chatTile(String titile, String msg, String timeAgo) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                radius: 17.r,
                backgroundImage: AssetImage("assets/images/person.png"),
              ),
              16.hSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titile,
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    msg,
                    style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GradientText(
              timeAgo,
              gradient: LinearGradient(colors: [
                Color(0xffCCCCCC),
                Color(0xff666666),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 10, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}

class ChatDetailing extends StatefulWidget {
  const ChatDetailing({super.key});

  @override
  State<ChatDetailing> createState() => _ChatDetailingState();
}

class _ChatDetailingState extends State<ChatDetailing> with SingleTickerProviderStateMixin {
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
  int selectedIndex = 0;
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
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
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
                          // Inner Navigation
                          onTap: () {
                            if (index == 1) {
                              RoutingService.pushReplacement(const DiscoverP2PScreen(
                                fromExpress: false,
                              ));
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
                                    width: textPainter.width,
                                    height: 2,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    height: 1.0,
                    color: Color(0xff212121),
                  ),
                ),
                20.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _buildBorderedBox(
                    title: 'You have a buy order awaiting your payment',
                    subtitle: 'You have a buy order awaiting your payment',
                    buttonText: 'Pay now',
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    RoutingService.push(const PersonalProfile());
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage("assets/images/person.png"),
                      ),
                      7.hSpace,
                      Text("Trader-Name",
                          style: GoogleFonts.poppins(
                            color: Color(0xff8E8E8E),
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 30),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFF212121),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("No third-party payments are accepted. ",
                            style: GoogleFonts.poppins(
                              color: Color(0xff8E8E8E),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            )),
                        10.vSpace,
                        Divider(
                          height: 1.0,
                          color: Color(0xff282828),
                        ),
                        10.vSpace,
                        Text("This is an automated message",
                            style: GoogleFonts.poppins(
                              color: Color(0xff8E8E8E),
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            )),
                      ],
                    ),
                  ),
                ),
                10.vSpace,
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 25),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF212121),
                        ),
                        child: Row(
                          children: [
                            Text("No third-party payments are accepted. ",
                                style: GoogleFonts.poppins(
                                  color: Color(0xff8E8E8E),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                )),
                            SizedBox(height: 15.h, width: 15.w, child: SvgPicture.asset("assets/svg/double.svg"))
                          ],
                        ),
                      ),
                      10.hSpace,
                      Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: const Color(0xFF212121),
                        ),
                        child: Center(
                          child: Text("S",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                10.vSpace,
                GestureDetector(
                  onTap: () {
                    RoutingService.push(const PersonalProfile());
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage("assets/images/person.png"),
                      ),
                      7.hSpace,
                      Text("Trader-Name",
                          style: GoogleFonts.poppins(
                            color: Color(0xff8E8E8E),
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 30),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFF212121),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("uiux.shah”gmail.com",
                            style: GoogleFonts.poppins(
                              color: Color(0xff8E8E8E),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            )),
                        10.vSpace,
                        Text("Paypal Acount send payment here.",
                            style: GoogleFonts.poppins(
                              color: Color(0xff8E8E8E),
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            )),
                      ],
                    ),
                  ),
                ),
                10.vSpace,
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF212121),
                        ),
                        child: Row(
                          children: [
                            Text("ok ",
                                style: GoogleFonts.poppins(
                                  color: Color(0xff8E8E8E),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                )),
                            SizedBox(height: 15.h, width: 15.w, child: SvgPicture.asset("assets/svg/double.svg"))
                          ],
                        ),
                      ),
                      10.hSpace,
                      Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: const Color(0xFF212121),
                        ),
                        child: Center(
                          child: Text("S",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                10.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _buildBorderedBox(
                    title: 'Order paid. Pending confirmation from the seller.',
                    subtitle: 'You should receive the crypto within 01:27.',
                    buttonText: 'view details',
                  ),
                ),
                10.vSpace,
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF212121),
                        ),
                        child: Row(
                          children: [
                            Text("ok ",
                                style: GoogleFonts.poppins(
                                  color: Color(0xff8E8E8E),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                )),
                            SizedBox(height: 15.h, width: 15.w, child: SvgPicture.asset("assets/svg/double.svg"))
                          ],
                        ),
                      ),
                      10.hSpace,
                      Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: const Color(0xFF212121),
                        ),
                        child: Center(
                          child: Text("S",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _buildBorderedBox(
                    title: 'Seller received payment. Order is complete.',
                    subtitle: 'the assets are now in your funding account.',
                    buttonText: 'view Assets',
                  ),
                ),
                100.vSpace
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBorderedBox({required String title, required String subtitle, required String buttonText}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: GradientBoxBorder(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFCA509), Color(0xFF880306)],
          ),
          width: 0.9,
        ),
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF212121),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.poppins(
                color: Color(0xffFAFAFA),
                fontWeight: FontWeight.w400,
                fontSize: 12,
              )),
          const SizedBox(height: 4),
          Text(subtitle,
              style: GoogleFonts.poppins(
                color: Color(0xff8E8E8E),
                fontWeight: FontWeight.w400,
                fontSize: 10,
              )),
          10.vSpace,
          Divider(
            height: 1.0,
            color: Color(0xff282828),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(buttonText,
                  style: GoogleFonts.poppins(
                    color: Color(0xffFAFAFA),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  )),
              const SizedBox(width: 4),
              const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.white)
            ],
          )
        ],
      ),
    );
  }
}

class PersonalProfile extends StatefulWidget {
  const PersonalProfile({super.key});

  @override
  State<PersonalProfile> createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> with SingleTickerProviderStateMixin {
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
  int selectedIndex = 0;
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
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.vSpace,
                  SizedBox(
                    height: 120.h,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/scene.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  20.vSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Sa***",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xffD5D5D5)),
                    ),
                  ),
                  10.vSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Image.asset("assets/images/pak.png"),
                        Text(
                          " Pakistan | Joined on : 03/04/2025",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 10, color: Color(0xffD5D5D5)),
                        ),
                      ],
                    ),
                  ),
                  10.vSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Image.asset("assets/images/v1.png"),
                        Text(
                          " ID verified on 03/05/2025",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xff25C866)),
                        ),
                        10.hSpace,
                        Image.asset("assets/images/v2.png"),
                        Text(
                          " Email",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xff25C866)),
                        ),
                        10.hSpace,
                        Image.asset("assets/images/v2.png"),
                        Text(
                          " Mobile",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xff25C866)),
                        ),
                      ],
                    ),
                  ),
                  10.vSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(color: const Color(0xFF0F0F0F), borderRadius: BorderRadius.circular(12.r), border: Border.all(color: Color(0xff393737))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My P2P funds",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          const Divider(
                            height: 1.0,
                            color: Color(0xff393737),
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Available", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xffD5D5D5))),
                              Text("32.54 USDT", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xffD5D5D5))),
                            ],
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Locked", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xffD5D5D5))),
                              Text("10.54 USDT", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xffD5D5D5))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Information box
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(color: const Color(0xFF0F0F0F), borderRadius: BorderRadius.circular(12.r), border: Border.all(color: Color(0xff393737))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "information",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          const Divider(
                            height: 1.0,
                            color: Color(0xff393737),
                          ),
                          SizedBox(height: 12.h),
                          infoRow("Total Completed Orders", "1"),
                          infoRow("Completion Rate (%)", "100.00%"),
                          infoRow("Avg. Payment Time", "6m 54s"),
                          infoRow("Positive Reviews (%)", "N/A"),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Menu Items
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: menuTile("Payment", () {
                      // RoutingService.push(const Paymentscreen());
                    }),
                  ),
                  10.vSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: menuTile("Become a Super merchant", () {
                      // RoutingService.push(const Paymentscreen());
                    }),
                  ),
                  10.vSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: menuTile("Setting", () {
                      // RoutingService.push(const SettingScreen());
                    }),
                  ),
                  10.vSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: menuTile("P2P guide", () {}),
                  ),
                ],
              ),
              Positioned(
                child: SizedBox(height: 35.h, width: 35.w, child: Image.asset("assets/images/person.png")),
                top: 130.h,
                left: 10.w,
              ),
              Positioned(
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(color: Color(0xff25C866), borderRadius: BorderRadius.circular(10.r)),
                ),
                top: 155.h,
                left: 35.w,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.inter(fontSize: 11, color: Color(0xffD5D5D5), fontWeight: FontWeight.w400)),
          Text(value, style: GoogleFonts.inter(fontSize: 11, color: Color(0xffD5D5D5), fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

  Widget menuTile(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        decoration: BoxDecoration(color: const Color(0xFF0F0F0F), borderRadius: BorderRadius.circular(12.r), border: Border.all(color: Color(0xff393737))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: GoogleFonts.poppins(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w300)),
            SizedBox(
              height: 12.h,
              width: 12.w,
              child: SvgPicture.asset("assets/svg/dr.svg"),
            )
          ],
        ),
      ),
    );
  }
}
