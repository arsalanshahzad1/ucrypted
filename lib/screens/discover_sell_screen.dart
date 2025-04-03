import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/home_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/custom_textfield.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class DiscoverSellScreen extends StatefulWidget {
  const DiscoverSellScreen({super.key});

  @override
  State<DiscoverSellScreen> createState() => _DiscoverSellScreenState();
}

class _DiscoverSellScreenState extends State<DiscoverSellScreen> {
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
                    Expanded(
                      flex: 1,
                      child: Align(
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
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Sell",
                          style: GoogleFonts.inter(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset("assets/svg/inof.svg"),
                      ),
                    ),
                  ],
                ),
                40.vSpace,
                Text(
                  "Crypto Ammount",
                  style: GoogleFonts.plusJakartaSans(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w500),
                ),
                10.vSpace,
                CustomTextField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                  isPassword: false,
                  hintText: "min amount 0,00001 BTC",
                ),
                20.vSpace,
                Text(
                  "Wallet Password",
                  style: GoogleFonts.plusJakartaSans(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w500),
                ),
                10.vSpace,
                CustomTextField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                  isPassword: true,
                  hintText: "enter you wallet password",
                ),
                30.verticalSpace,
                const Divider(
                  height: 1.0,
                  color: AppColors.disableBtnColor,
                ),
                30.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Exchage Operation",
                            style: GoogleFonts.plusJakartaSans(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          10.vSpace,
                          CustomTextField(
                            controller: TextEditingController(),
                            keyboardType: TextInputType.emailAddress,
                            isPassword: true,
                            hintText: "Input amount",
                          ),
                        ],
                      ),
                    ),
                    10.hSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Equivalent Amount",
                            style: GoogleFonts.plusJakartaSans(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          10.vSpace,
                          CustomTextField(
                            controller: TextEditingController(),
                            keyboardType: TextInputType.emailAddress,
                            isPassword: true,
                            hintText: "Equivalent ",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                30.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/inof.svg",
                      height: 20,
                      width: 20,
                    ),
                    10.hSpace,
                    Text(
                      "Minimun value Sell crypto = 0,0001 BTC",
                      style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    RoutingService.push(const SellDetailScreen());
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
                        "Continue",
                        style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                  ),
                ),
                20.vSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SellDetailScreen extends StatefulWidget {
  const SellDetailScreen({super.key});

  @override
  State<SellDetailScreen> createState() => _SellDetailScreenState();
}

class _SellDetailScreenState extends State<SellDetailScreen> {
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
                    Expanded(
                      flex: 1,
                      child: Align(
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
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Sell",
                          style: GoogleFonts.inter(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset("assets/svg/inof.svg"),
                      ),
                    ),
                  ],
                ),
                80.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/code.svg",
                      height: 250.h,
                      width: 250.w,
                    ),
                  ],
                ),
                20.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "WLT12412QWRFSDADASD",
                      style: GoogleFonts.inter(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    10.hSpace,
                    SvgPicture.asset(
                      "assets/svg/clipoboard.svg",
                      height: 20.h,
                      width: 20.w,
                    ),
                  ],
                ),
                20.vSpace,
                Container(
                  height: 60.h,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C30),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/svg/inof.svg"),
                      10.hSpace,
                      Expanded(
                        child: Text(
                          "Copy this code and send it to your friends to receive crypto payments",
                          style: GoogleFonts.inter(
                            color: AppColors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          RoutingService.pushAndRemoveUntil(const HomeScreen());
                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2C2C30),
                            border: Border.all(color: const Color(0xFF2C2C30)),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Center(
                            child: Text(
                              "Share",
                              style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                    10.hSpace,
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          RoutingService.pushAndRemoveUntil(const HomeScreen());
                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Center(
                            child: Text(
                              "Print",
                              style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                20.vSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
