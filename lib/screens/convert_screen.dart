import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/chat_room_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class ConvertScreen extends StatefulWidget {
  const ConvertScreen({super.key});

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> with SingleTickerProviderStateMixin {
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
          padding: EdgeInsets.symmetric(horizontal: ScreenService.isTablet ? 30 : 16),
          child: Column(
            children: [
              5.vSpace,
              Row(
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 26,
                  ),
                  5.hSpace,
                  Expanded(
                    child: Text(
                      "Market Trade",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: AppColors.white, fontSize: ScreenService.isTablet ? 28 : 26),
                    ),
                  ),
                ],
              ),
              10.vSpace,
              Container(
                height: 45.h,
                decoration: BoxDecoration(
                  color: AppColors.disableBtnColor.withOpacity(0.5),
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
                    Tab(text: "Convert & Link"),
                    Tab(text: "Limit order"),
                  ],
                ),
              ),
              // Tab Views
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    convertAndLinkWidget(),
                    convertAndLinkWidget1(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Row for the first 3 items
  Widget _buildRow(String title, String value, IconData? trailingIcon, bool i) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.inter(color: Color(0xff7E8088), fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
            ),
            4.hSpace,
            !i ? const Icon(Icons.help_outline, color: Colors.grey, size: 14) : SizedBox.shrink(),
          ],
        ),
        Row(
          children: [
            Text(
              value,
              style: GoogleFonts.inter(color: Colors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
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

  Widget convertAndLinkWidget() {
    return Column(
      children: [
        30.vSpace,
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
                    borderRadius: BorderRadius.circular(10),
                    gradient: RadialGradient(
                      center: Alignment.bottomRight,
                      radius: 1.0,
                      colors: [
                        Colors.green.withOpacity(0.2),
                        Colors.transparent,
                      ],
                      stops: const [0.2, 1.0],
                    ),
                  ),
                  child: Column(
                    children: [
                      10.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pay",
                            style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 16 : 14),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("assets/svg/purse.svg"),
                                  5.hSpace,
                                  Text(
                                    "5,778",
                                    style: GoogleFonts.poppins(color: AppColors.grey, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 16 : 14),
                                  ),
                                ],
                              ),
                              10.hSpace,
                              Text(
                                "MAX",
                                style: GoogleFonts.inter(color: Colors.green, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 16 : 14),
                              )
                            ],
                          ),
                        ],
                      ),
                      10.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xff0082FE),
                              ),
                              10.hSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "ETH",
                                        style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: ScreenService.isTablet ? 24 : 22, color: Colors.white),
                                      ),
                                      // 10.hSpace,
                                      Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Ethereum",
                                    style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 14 : 12, color: AppColors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "1",
                                style: GoogleFonts.poppins(color: Colors.white, fontSize: ScreenService.isTablet ? 24 : 22, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "\$1.876.24",
                                style: GoogleFonts.inter(fontWeight: FontWeight.w400, color: Colors.white, fontSize: ScreenService.isTablet ? 14 : 12),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                15.vSpace,
                Container(
                  height: 110.h,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: RadialGradient(
                      center: Alignment.topLeft,
                      radius: 1.0,
                      colors: [
                        Colors.blue.withOpacity(0.2),
                        Colors.transparent,
                      ],
                      stops: const [0.2, 1.0],
                    ),
                  ),
                  child: Column(
                    children: [
                      20.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Receive",
                            style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 16 : 14),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("assets/svg/purse.svg"),
                                  5.hSpace,
                                  Text(
                                    "0,031025",
                                    style: GoogleFonts.poppins(color: AppColors.grey, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 16 : 14),
                                  ),
                                ],
                              ),
                            ],
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
                                backgroundColor: Color(0xff0082FE),
                              ),
                              10.hSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "USDC",
                                        style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: ScreenService.isTablet ? 24 : 22, color: Colors.white),
                                      ),
                                      // 10.hSpace,
                                      Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Ethereum",
                                    style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 14 : 12, color: AppColors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "1,038633",
                                style: GoogleFonts.poppins(color: Colors.white, fontSize: ScreenService.isTablet ? 24 : 22, fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\$1,03",
                                    style: GoogleFonts.poppins(color: AppColors.grey, fontSize: ScreenService.isTablet ? 14 : 12, fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    " (+0,69)",
                                    style: GoogleFonts.poppins(color: Colors.green, fontSize: ScreenService.isTablet ? 14 : 12, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 95.h,
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
        GestureDetector(
          onTap: () {},
          child: Container(
            height: ScreenService.isTablet ? 40.h : 45,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF09A648),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Center(
              child: Text(
                "Approve",
                style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: ScreenService.isTablet ? 18 : 16),
              ),
            ),
          ),
        ),
        40.vSpace,
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
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Reference",
                            style: GoogleFonts.inter(color: Color(0xff7E8088), fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                          ),
                          4.hSpace,
                          const Icon(Icons.help_outline, color: Colors.grey, size: 14),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "1 ETH = 1.876,515984 USDC",
                        style: GoogleFonts.inter(color: Colors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                      ),
                      5.hSpace,
                      SvgPicture.asset(
                        "assets/svg/CONW.svg",
                      )
                    ],
                  ),
                ],
              ),
              10.vSpace,
              _buildRow("Estimated network charges", "\$3,71 (1 Min)", null, true),
              12.vSpace,
              _buildRow("Acceptable slippage", "1%", Icons.arrow_forward_ios, false),
              12.vSpace,
              _buildRoutingRow(),
            ],
          ),
        ),
      ],
    );
  }

  Widget convertAndLinkWidget1() {
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
                    borderRadius: BorderRadius.circular(10),
                    gradient: RadialGradient(
                      center: Alignment.bottomRight,
                      radius: 1.0,
                      colors: [
                        Colors.green.withOpacity(0.2),
                        Colors.transparent,
                      ],
                      stops: const [0.2, 1.0],
                    ),
                  ),
                  child: Column(
                    children: [
                      10.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pay",
                            style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 16 : 14),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("assets/svg/purse.svg"),
                                  5.hSpace,
                                  Text(
                                    "5,778",
                                    style: GoogleFonts.poppins(color: AppColors.grey, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 16 : 14),
                                  ),
                                ],
                              ),
                              10.hSpace,
                              Text(
                                "MAX",
                                style: GoogleFonts.inter(color: Colors.green, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 16 : 14),
                              )
                            ],
                          ),
                        ],
                      ),
                      10.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue,
                              ),
                              10.hSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "ETH",
                                        style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: ScreenService.isTablet ? 24 : 22, color: Colors.white),
                                      ),
                                      // 10.hSpace,
                                      Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Ethereum",
                                    style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 14 : 12, color: AppColors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "1",
                                style: GoogleFonts.poppins(color: Colors.white, fontSize: ScreenService.isTablet ? 24 : 22, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "\$1.876.24",
                                style: GoogleFonts.inter(fontWeight: FontWeight.w400, color: Colors.white, fontSize: ScreenService.isTablet ? 24 : 12),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                15.vSpace,
                Container(
                  height: 110.h,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: RadialGradient(
                      center: Alignment.topLeft,
                      radius: 1.0,
                      colors: [
                        Colors.blue.withOpacity(0.2),
                        Colors.transparent,
                      ],
                      stops: const [0.2, 1.0],
                    ),
                  ),
                  child: Column(
                    children: [
                      20.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Receive",
                            style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 16 : 14),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("assets/svg/purse.svg"),
                                  5.hSpace,
                                  Text(
                                    "0,031025",
                                    style: GoogleFonts.poppins(color: AppColors.grey, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 16 : 14),
                                  ),
                                ],
                              ),
                            ],
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
                              ),
                              10.hSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "USDC",
                                        style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: ScreenService.isTablet ? 24 : 22, color: Colors.white),
                                      ),
                                      // 10.hSpace,
                                      Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Ethereum",
                                    style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 14 : 12, color: AppColors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "1,038633",
                                style: GoogleFonts.poppins(color: Colors.white, fontSize: ScreenService.isTablet ? 24 : 22, fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\$1,03",
                                    style: GoogleFonts.poppins(color: AppColors.grey, fontSize: ScreenService.isTablet ? 14 : 12, fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    " (+0,69)",
                                    style: GoogleFonts.poppins(color: Colors.green, fontSize: ScreenService.isTablet ? 14 : 12, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 95.h,
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
        // GestureDetector(
        //   onTap: () {},
        //   child: Container(
        //     height: 45,
        //     width: double.infinity,
        //     decoration: BoxDecoration(
        //       color: const Color(0xFF09A648),
        //       borderRadius: BorderRadius.circular(28),
        //     ),
        //     child: Center(
        //       child: Text(
        //         "Approve",
        //         style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 16),
        //       ),
        //     ),
        //   ),
        // ),
        // 40.vSpace,

        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(15), border: Border.all(color: Color(0xff393737))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sell WETH at exchange rate (-99,93%)",
                    style: GoogleFonts.inter(color: Color(0xff7E8088), fontSize: ScreenService.isTablet ? 14 : 11, fontWeight: FontWeight.w400),
                  ),
                  4.hSpace,
                  Text(
                    "Use market price",
                    style: GoogleFonts.poppins(color: Color(0xff25C866), fontSize: ScreenService.isTablet ? 14 : 11, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              10.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "1,25",
                    style: GoogleFonts.inter(color: Colors.white, fontSize: ScreenService.isTablet ? 18 : 16, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      Text(
                        "USDC",
                        style: GoogleFonts.poppins(color: Colors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                      ),
                      5.hSpace,
                      SvgPicture.asset("assets/svg/con.svg"),
                    ],
                  ),
                ],
              ),
              3.vSpace,
              Divider(
                height: 1.0,
                color: Color(0xff393737),
              ),
              5.vSpace,
              Row(
                children: [
                  Text(
                    "USMarket: 1 WETH = 1.870,921609 USDCDC",
                    style: GoogleFonts.inter(color: Color(0xff7E8088), fontSize: ScreenService.isTablet ? 14 : 11, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              10.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Due later",
                    style: GoogleFonts.inter(color: Color(0xff7E8088), fontSize: ScreenService.isTablet ? 14 : 11, fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Text(
                        "1 Day",
                        style: GoogleFonts.poppins(color: Colors.white, fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
                      ),
                      5.hSpace,
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff7E8088),
                        size: 14,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Spacer(),
        Divider(
          height: 1.0,
          color: Color(0xff393737),
        ),
        10.vSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "ETH/USDC",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: ScreenService.isTablet ? 18 : 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Text(
                  " 1.876,251425 ",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: ScreenService.isTablet ? 16 : 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "  -2,62   ",
                  style: GoogleFonts.poppins(
                    color: Color(0xffD33535),
                    fontSize: ScreenService.isTablet ? 16 : 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                  size: 14,
                )
              ],
            ),
          ],
        ),
        10.vSpace,
      ],
    );
  }

  Widget _buildRoutingRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "X Routing",
              style: GoogleFonts.inter(color: Color(0xff7E8088), fontSize: ScreenService.isTablet ? 16 : 14, fontWeight: FontWeight.w400),
            ),
            4.hSpace,
            const Icon(Icons.help_outline, color: Colors.grey, size: 14),
          ],
        ),
        Row(
          children: [
            _buildDot(true),
            const Icon(Icons.arrow_right, color: Colors.grey, size: 22),
            _buildDot(true),
            8.hSpace,
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 12),
          ],
        ),
      ],
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: 12.w,
      height: 12.h,
      decoration: BoxDecoration(
        color: isActive ? Color(0xff0082FE) : Colors.grey[600],
        shape: BoxShape.circle,
      ),
    );
  }
}
