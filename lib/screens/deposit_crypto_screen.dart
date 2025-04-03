import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class DepositCryptoscreen extends StatefulWidget {
  const DepositCryptoscreen({super.key});

  @override
  State<DepositCryptoscreen> createState() => _DepositCryptoscreenState();
}

class _DepositCryptoscreenState extends State<DepositCryptoscreen> {
  final List<Map<String, String>> trendingItems = [
    {'icon': 'assets/images/b1.png', 'title': 'BTC', 'subtitle': 'Bitcoin'},
    {'icon': 'assets/images/b2.png', 'title': 'ETH', 'subtitle': 'Ethereum'},
    {'icon': 'assets/images/b3.png', 'title': 'USDT', 'subtitle': 'TetherUS'},
    {'icon': 'assets/images/b4.png', 'title': 'BNB', 'subtitle': 'BNB'},
  ];

  final List<Map<String, String>> numberedItems = [
    {'icon': 'assets/images/b5.png', 'title': '1000CAT', 'subtitle': '1000×Simons Cat'},
    {'icon': 'assets/images/b6.png', 'title': '1000CHEEMS', 'subtitle': '1000×Cheems.pet'},
    {'icon': 'assets/images/b7.png', 'title': '1000SATS', 'subtitle': 'PEEPER'},
    {'icon': 'assets/images/b8.png', 'title': '1INCH', 'subtitle': '1 inch'},
    {'icon': 'assets/images/b9.png', 'title': '1 MBABYDOGE', 'subtitle': '1M × BABYDOGE'},
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Select Coin",
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              30.vSpace,
              Container(
                width: double.infinity.w,
                height: 40.h,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF13171A), Color(0xFF2C2C30)],
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                  ),
                  border: Border.all(color: Color(0xff2C2C30)),
                ),
                child: TextField(
                  controller: TextEditingController(),
                  cursorColor: Colors.orange,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    border: InputBorder.none,
                    hintText: "Search Coins",
                    hintStyle: GoogleFonts.inter(
                      color: Color(0xff9C9C9C),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.vSpace,
                  Text(
                    "Trending",
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9C9C9C),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...trendingItems.map((item) => TrendingItem(item)),
                  const SizedBox(height: 12),
                  Text(
                    "1",
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9C9C9C),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...numberedItems.map((item) => TrendingItem(item)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrendingItem extends StatelessWidget {
  final Map<String, String> item;
  const TrendingItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(item['icon']!, width: 32, height: 32),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['title']!,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Text(
                item['subtitle']!,
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
    );
  }
}
