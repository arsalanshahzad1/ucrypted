import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/buy_sell_detail_screen.dart';
import 'package:ucrypted_app/screens/chat_room_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/candle_data.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/gradient_text.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';

class TradingScreen extends StatefulWidget {
  const TradingScreen({super.key});

  @override
  State<TradingScreen> createState() => _TradingScreenState();
}

class _TradingScreenState extends State<TradingScreen> {
  String selectedInterval = '1h';
  int selectedIndex = 0;
  bool showCandle = false;
  bool isTable = false;
  int selectedIndexCustom = 1;

  final data = [
    ["6,414.16", "0.041835", "0.058508", "166,938.50"],
    ["7,169.23", "0.041605", "0.057310", "499.45"],
    ["7,208.80", "0.041377", "0.056189", "437.00"],
    ["5,056408", "0.056687", "0.056408", "25,870.80"],
    ["4,562.13", "0.078669", "0.056213", "7,052.45"],
    ["2,561.02", "0.056767", "0.056102", "4,455.80"],
  ];
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // 200.vSpace,
              if (isTable == false) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("Wallet Balance",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xffACB5BB),
                            )),
                        10.vSpace,
                        Text("\$227.169,85",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 36,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ],
                ),
                20.vSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "My Assets",
                        style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                15.vSpace,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // height: 470.h,
                          width: 300.w,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(color: Color(0xff1E1E20), border: Border.all(color: Color(0xff2C2C30)), borderRadius: BorderRadius.circular(12)),
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
                                        "BTC Balance",
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
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "BTC",
                                            style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 14, fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "21900,84 USD",
                                    style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              // 10.vSpace,
                            ],
                          ),
                        ),
                        20.hSpace,
                        Container(
                          // height: 470.h,
                          width: 330.w,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(color: Color(0xff1E1E20), border: Border.all(color: Color(0xff2C2C30)), borderRadius: BorderRadius.circular(12)),
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
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xffBBB9FD)),
                                      ),
                                      10.hSpace,
                                      Text(
                                        "ETH Balance",
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
                                        "12,3434",
                                        style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            " ETH",
                                            style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 14, fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "21900,84 USD",
                                    style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              // 10.vSpace,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              20.vSpace,
              if (isTable == true) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      // color: Color.fromARGB(255, 42, 42, 42),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Color(0xff505050)),
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Row(
                        children: [
                          Container(
                            height: 35.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Color(0xff505050)),
                            ),
                            child: Center(
                              child: SvgPicture.asset("assets/svg/io.svg"),
                            ),
                          ),
                          10.hSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "KLV/USDT",
                                style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
                              ),
                              Text(
                                "+50.47%",
                                style: GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 12, color: Color(0xff38B781)),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30.h,
                            width: 35.w,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Color(0xff4598D3), border: Border.all(color: Color(0xff505050))),
                            child: Center(
                              child: SvgPicture.asset("assets/svg/e1.svg"),
                            ),
                          ),
                          5.hSpace,
                          Container(
                            height: 30.h,
                            width: 35.w,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: Color(0xff505050))),
                            child: Center(
                              child: SvgPicture.asset("assets/svg/e2.svg"),
                            ),
                          ),
                          5.hSpace,
                          Container(
                            height: 30.h,
                            width: 35.w,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: Color(0xff505050))),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/svg/e3.svg",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
                30.vSpace,
              ],
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Current price",
                              style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xff99A6AFCC)),
                            ),
                            Text(
                              "0.057508",
                              style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xffF7F7F7)),
                            ),
                            Text(
                              "= \$0.057508",
                              style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xff99A6AFCC)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "24h High",
                                  style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xff99A6AFCC)),
                                ),
                                Text(
                                  "0.057508",
                                  style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xffF7F7F7)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "24h Vol(KLV)",
                                  style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xff99A6AFCC)),
                                ),
                                Text(
                                  "5.87M",
                                  style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xffF7F7F7)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      20.vSpace,
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "24h Low",
                                  style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xff99A6AFCC)),
                                ),
                                Text(
                                  "0.04893",
                                  style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xffF7F7F7)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "24h Low",
                                  style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xff99A6AFCC)),
                                ),
                                Text(
                                  "\$ 180.92k",
                                  style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xffF7F7F7)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
                ],
              ),
              10.vSpace,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             showCandle = !showCandle;
              //           });
              //         },
              //         child: SvgPicture.asset("assets/svg/more.svg"))
              //   ],
              // ),
              showCandle
                  ? Column(
                      children: [
                        10.vSpace,
                        SizedBox(
                          // height: 300.h,
                          width: double.infinity,
                          child: SvgPicture.asset(
                            "assets/svg/candle.svg",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        10.vSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your spending",
                                  style: GoogleFonts.poppins(color: Color(0xff838383), fontSize: 11, fontWeight: FontWeight.w400),
                                ),
                                10.vSpace,
                                Text(
                                  "IDR 12.000.000",
                                  style: GoogleFonts.manrope(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 75.w,
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        7.hSpace,
                                        Text(
                                          "Month",
                                          style: GoogleFonts.poppins(
                                            color: Color(0xff0F0F0F),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        7.hSpace,
                                        Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                          color: Color(0xff0F0F0F),
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.vSpace,
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isTable = !isTable;
                            });
                          },
                          child: SizedBox(
                            height: 220.h,
                            width: double.infinity,
                            child: SvgPicture.asset(
                              "assets/svg/bar1.svg",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        10.vSpace,
                        if (isTable == true) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildIndicator("MA"),
                              _buildIndicator("EMA"),
                              _buildIndicator("BOLL"),
                              _buildIndicator("SAR"),
                              _buildIndicator("AVL"),
                              _buildIndicator("MACD"),
                              _buildIndicator("RSI"),
                              _buildIndicator("KDJ"),
                              _buildIndicator("V"),
                            ].map((child) => Expanded(child: Center(child: child))).toList(),
                          ),
                          20.vSpace,
                        ],
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 25.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                                    borderRadius: BorderRadius.circular(6.r),
                                    // border: Border.all(color: Color(0xffEDEDED)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "24H",
                                      style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w700, fontSize: 11, color: Colors.white),
                                    ),
                                  ),
                                ),
                                10.hSpace,
                                Container(
                                  height: 25.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), border: Border.all(color: Color(0xffEDEDED))),
                                  child: Center(
                                    child: Text(
                                      "1W",
                                      style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w700, fontSize: 11, color: Colors.white),
                                    ),
                                  ),
                                ),
                                10.hSpace,
                                Container(
                                  height: 25.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), border: Border.all(color: Color(0xffEDEDED))),
                                  child: Center(
                                    child: Text(
                                      "1M",
                                      style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w700, fontSize: 11, color: Colors.white),
                                    ),
                                  ),
                                ),
                                10.hSpace,
                                Container(
                                  height: 25.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), border: Border.all(color: Color(0xffEDEDED))),
                                  child: Center(
                                    child: Text(
                                      "1Y",
                                      style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w700, fontSize: 11, color: Colors.white),
                                    ),
                                  ),
                                ),
                                10.hSpace,
                                Container(
                                  height: 25.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), border: Border.all(color: Color(0xffEDEDED))),
                                  child: Center(
                                    child: Text(
                                      "ALL",
                                      style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w700, fontSize: 11, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // setState(() {
                                    //   isTable = !isTable;
                                    // });
                                  },
                                  child: Container(
                                    height: 25.h,
                                    width: 27.w,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), border: Border.all(color: Color(0xffEDEDED))),
                                    child: Center(
                                      child: SvgPicture.asset("assets/svg/bars.svg"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
              25.vSpace,
              if (isTable == true) ...[
                Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => selectedIndex = 0),
                          child: Text(
                            "Open orders",
                            style: GoogleFonts.nunito(color: selectedIndex == 0 ? Colors.white : Colors.grey, fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () => setState(() => selectedIndex = 1),
                          child: Text(
                            "Info",
                            style: GoogleFonts.nunito(color: selectedIndex == 1 ? Colors.white : Colors.grey, fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                        const Spacer(),
                        _buildCircle(
                          const Color(0xFFFF545E),
                          const Color(0xFF38B781),
                        ),
                        const SizedBox(width: 8),
                        _buildCircle(const Color(0xFF38B781).withOpacity(0.35), Colors.transparent),
                        const SizedBox(width: 8),
                        _buildCircle(const Color(0xFFFF545E).withOpacity(0.35), Colors.transparent),
                      ],
                    ),
                    5.vSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        20.hSpace,
                        Container(
                          height: 4.h,
                          width: 45.w,
                          decoration: BoxDecoration(color: Color(0xff4598D3)),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 0.2,
                      color: AppColors.grey,
                    ),
                    10.vSpace,
                    // Header Row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Bid", style: GoogleFonts.nunito(color: Color(0xff99A6AFCC), fontSize: 12, fontWeight: FontWeight.w600)),
                          Text("Price", style: GoogleFonts.nunito(color: Color(0xff99A6AFCC), fontSize: 12, fontWeight: FontWeight.w600)),
                          Text("Ask", style: GoogleFonts.nunito(color: Color(0xff99A6AFCC), fontSize: 12, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        customBidRow("6,414.16", "0.041835", "0.058508", "166,938.50"),
                        Positioned(
                          left: 35.w,
                          child: Container(
                            height: 30.h,
                            width: 120.w,
                            decoration: BoxDecoration(color: Color(0xFF38B781).withOpacity(0.2)),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        customBidRow("7,169.23", "0.041605", "0.057310", "499.45"),
                        Positioned(
                          right: 70.w,
                          child: Container(
                            height: 28.h,
                            width: 90.w,
                            decoration: BoxDecoration(color: Color(0xFFFF545E).withOpacity(0.2)),
                          ),
                        )
                      ],
                    ),
                    customBidRow("7,208.80", "0.041377", "0.056189", "437.00"),
                    customBidRow("5,056408", "0.056687", "0.056408", "25,870.80"),
                    customBidRow("4,562.13", "0.078669", "0.056213", "7,052.45"),
                    customBidRow("2,561.02", "0.056767", "0.056102", "4,455.80"),
                    customBidRow("3,585.08", "0.564384", "0.058508", "166,938.50"),
                    customBidRow("4,057310", "0.0764.06", "0.057310", "499.45"),
                    customBidRow("5,056.89", "0.045678", "0.056189", "437.00"),
                    customBidRow("2.056.08", "0.078585", "0.056408", "25,870.80"),
                    customBidRow("1.056.13", "0.036578", "0.056213", "7,052.45"),
                    10.vSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              RoutingService.push(const BuySellDetailScreen());
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xFF38B781)),
                              child: Center(
                                child: Text(
                                  "Buy",
                                  style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.white),
                                ),
                              ),
                            ),
                          )),
                          20.hSpace,
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              RoutingService.push(const BuySellDetailScreen());
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xFFFF545E)),
                              child: Center(
                                child: Text(
                                  "Sell",
                                  style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.white),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    10.vSpace,
                  ],
                ),
              ],
              if (isTable == false) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => setState(() => selectedIndexCustom = 0),
                        child: Text(
                          "Exchange History",
                          style: GoogleFonts.inter(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                        )),
                    30.hSpace,
                    GestureDetector(
                      onTap: () => setState(() => selectedIndexCustom = 1),
                      child: Text(
                        "Transaction History",
                        style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),

                    // Visibility(
                    //     visible: selectedIndexCustom == 1 ? true : false,
                    //     child: Column(
                    //       children: [
                    //         exchangeWidget("assets/svg/bscexc.svg"),
                    //         exchangeWidget("assets/svg/ethex.svg"),
                    //         exchangeWidget("assets/svg/bscexc.svg"),
                    //         exchangeWidget("assets/svg/ethex.svg"),
                    //         exchangeWidget("assets/svg/bscexc.svg"),
                    //       ],
                    //     )),
                  ],
                ),
                8.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 1,
                    // margin: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        // Gradient part
                        Expanded(
                          flex: 4,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFDA6B1A), // orange
                                  Color(0xFFAC2C24), // deep red
                                  // Color(0xFF111114), // fade to dark
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Solid dark gray part
                        Expanded(
                          flex: 4,
                          child: Container(
                            color: Color(0xFF1B1B1F), // dark gray
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                10.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: exchangeWidget("assets/svg/ethex.svg"),
                ),
                20.vSpace,
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator(String label) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: GoogleFonts.spaceGrotesk(
        color: Colors.white.withOpacity(0.5),
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
      ),
    );
  }

  Widget exchangeWidget(String image) {
    return Container(
      // height: 100.h,
      // width: 200.w,
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

  Widget customBidRow(String first, String second, String third, String fourth) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                first,
                style: GoogleFonts.nunito(color: Color(0xffF7F7F7), fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                second,
                style: GoogleFonts.nunito(color: const Color(0xFF38B781), fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                third,
                style: GoogleFonts.nunito(color: const Color(0xFFFF545E), fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              // alignment: Alignment.bottomRight,
              child: Text(
                fourth,
                style: GoogleFonts.nunito(color: Color(0xffF7F7F7), fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircle(Color color, Color halfColor) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: halfColor != Colors.transparent
          ? ClipOval(
              child: Stack(
                children: [
                  Container(color: color),
                  Positioned(
                    top: 10,
                    child: Container(
                      width: 20,
                      height: 10,
                      color: halfColor,
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
