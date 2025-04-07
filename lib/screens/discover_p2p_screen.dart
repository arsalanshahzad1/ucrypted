import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
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
