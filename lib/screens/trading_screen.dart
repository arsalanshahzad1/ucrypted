import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/buy_sell_detail_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/candle_data.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';

class TradingScreen extends StatefulWidget {
  const TradingScreen({super.key});

  @override
  State<TradingScreen> createState() => _TradingScreenState();
}

class _TradingScreenState extends State<TradingScreen> {
  String selectedInterval = '1h';
  int selectedIndex = 0;
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
              // 200.vSpace,
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
              150.vSpace,
              SizedBox(
                // height: 300.h,
                width: double.infinity,
                child: SvgPicture.asset(
                  "assets/svg/candle.svg",
                  fit: BoxFit.fitWidth,
                ),
              ),
              // SizedBox(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       '15min',
              //       '1h',
              //       '1d',
              //       '1w',
              //       '1m',
              //     ]
              //         .map((interval) => GestureDetector(
              //               onTap: () => setState(() => selectedInterval = interval),
              //               child: Column(
              //                 children: [
              //                   Text(
              //                     interval,
              //                     style: GoogleFonts.inter(
              //                       color: selectedInterval == interval ? Colors.white : Colors.grey,
              //                     ),
              //                   ),
              //                   if (selectedInterval == interval)
              //                     Container(
              //                       margin: const EdgeInsets.only(top: 4),
              //                       height: 2,
              //                       width: 20,
              //                       color: Colors.blue,
              //                     ),
              //                   5.vSpace,
              //                 ],
              //               ),
              //             ))
              //         .toList(),
              //   ),
              // ),
              // SizedBox(
              //   height: 200,
              //   width: double.infinity,
              //   child: InteractiveChart(
              //     style: ChartStyle(
              //       priceGainColor: const Color(0xFF38B781),
              //       priceLossColor: const Color(0xFFFF545E),
              //       volumeColor: Colors.grey.withOpacity(0.8),
              //       priceGridLineColor: Colors.white24,
              //       priceLabelStyle: GoogleFonts.inter(color: Colors.white70),
              //       timeLabelStyle: GoogleFonts.inter(
              //         color: Colors.transparent,
              //       ),
              //       selectionHighlightColor: Colors.white.withOpacity(0.2),
              //       overlayBackgroundColor: Colors.black.withOpacity(0.6),
              //       overlayTextStyle: GoogleFonts.inter(color: Colors.white70),
              //       timeLabelHeight: 32,
              //       volumeHeightFactor: 0.2,
              //     ),
              //     candles: CandleDataLocal().data,
              //   ),
              // ),
              20.vSpace,
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
                  _buildCircle(const Color(0xFF38B781), Colors.transparent),
                  const SizedBox(width: 8),
                  _buildCircle(const Color(0xFFFF545E), Colors.transparent),
                ],
              ),
              5.vSpace,
              const Divider(
                height: 0.2,
                color: AppColors.grey,
              ),
              10.vSpace,
              // Header Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Bid", style: GoogleFonts.nunito(color: Color(0xff99A6AFCC), fontSize: 12, fontWeight: FontWeight.w600)),
                    Text("Price", style: GoogleFonts.nunito(color: Color(0xff99A6AFCC), fontSize: 12, fontWeight: FontWeight.w600)),
                    Text("Ask", style: GoogleFonts.nunito(color: Color(0xff99A6AFCC), fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              customBidRow(),
              customBidRow(),
              customBidRow(),
              customBidRow(),
              customBidRow(),
              customBidRow(),
              customBidRow(),
              customBidRow(),
              10.vSpace,
              Row(
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
              10.vSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget customBidRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "62,4146",
                style: GoogleFonts.nunito(color: Color(0xffF7F7F7), fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "0.12120",
                style: GoogleFonts.nunito(color: const Color(0xFF38B781), fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "0.012121",
                style: GoogleFonts.nunito(color: const Color(0xFFFF545E), fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "499,1212",
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
