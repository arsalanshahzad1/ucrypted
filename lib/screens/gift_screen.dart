import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/app_print.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';

class GiftScreen extends StatefulWidget {
  const GiftScreen({super.key});

  @override
  State<GiftScreen> createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
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
              15.vSpace,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Gift Redeems",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: AppColors.white, fontSize: 28),
                    ),
                  ),
                ],
              ),
              10.vSpace,
              Row(
                children: [
                  // 20.hSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Moves text to the left
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/star.svg"),
                          10.hSpace,
                          Text(
                            "Points",
                            style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                        ],
                      ),
                      5.vSpace,
                      Padding(
                        padding: const EdgeInsets.only(left: 20), // Adjust left padding
                        child: Text(
                          "0",
                          style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w700, fontSize: 38),
                        ),
                      ),
                      5.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Reward Shop ",
                            style: GoogleFonts.inter(color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          2.hSpace,
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.textColor,
                            size: 14,
                          )
                        ],
                      ),
                    ],
                  ),

                  38.hSpace,
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/card.svg"),
                          10.hSpace,
                          Text(
                            "Gift Cards",
                            style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                        ],
                      ),
                      5.vSpace,
                      Text(
                        "0",
                        style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w700, fontSize: 38),
                      ),
                      5.vSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "My Gift Cards ",
                            style: GoogleFonts.inter(color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          2.hSpace,
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.textColor,
                            size: 14,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              20.vSpace,
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Get Rewards",
                      style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 26),
                    ),
                    Row(
                      children: [
                        Text(
                          "More   ",
                          style: GoogleFonts.inter(color: Color(0xff7A808C), fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Color(0xff7A808C),
                          size: 12,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              10.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Explore More",
                    style: GoogleFonts.inter(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              20.verticalSpace,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: buildGiftTokens(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGiftTokens() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF13171A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            children: [
              SvgPicture.asset("assets/svg/incoming.svg"),
              8.hSpace,
              Expanded(
                child: Text(
                  "Make a Deposit and Get Gift Card",
                  style: GoogleFonts.inter(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),

          12.vSpace,

          // Progress Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Progress",
                style: GoogleFonts.inter(color: Color(0xff7E8088), fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  Text(
                    "0",
                    style: GoogleFonts.inter(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "/10 USDT",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),

          8.vSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reward",
                style: GoogleFonts.inter(color: Color(0xff7E8088), fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/svg/card.svg"),
                  8.hSpace,
                  Text(
                    "USDT Trading Fee Rebate Voucher",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),

          8.vSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Time Left to complete Task",
                style: GoogleFonts.inter(color: Color(0xff7E8088), fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Text(
                "02D:00H:30M",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          20.vSpace,
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 34.h,
              width: 78.w,
              // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
              ),
              child: Center(
                child: Text(
                  "Do Task",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
}
