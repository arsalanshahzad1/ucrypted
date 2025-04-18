import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/home_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class DiscoverBuyScreen extends StatefulWidget {
  const DiscoverBuyScreen({super.key});

  @override
  State<DiscoverBuyScreen> createState() => _DiscoverBuyScreenState();
}

class _DiscoverBuyScreenState extends State<DiscoverBuyScreen> {
  String? selectedPaymentMethod;
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/topupbg.png",
      fit: BoxFit.cover,
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
                          "Buy",
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
                  "Select Crypto Currency",
                  style: GoogleFonts.plusJakartaSans(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w500),
                ),
                10.vSpace,
                TextField(
                  readOnly: true, // Makes it non-editable like a dropdown
                  decoration: InputDecoration(
                    hintText: "BTC (Bitcoin)",
                    hintStyle: GoogleFonts.inter(
                      color: Colors.white, // Light grey text color
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    filled: true,
                    fillColor: Color(0xFF2C2C30), // Dark background
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6), // Rounded edges
                      borderSide: BorderSide(
                        color: Color(0xFF44444A), // Subtle border
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: Color(0xFF44444A),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: Color(0xFF333333), // No highlight on focus
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),

                    // 🔹 Prefix Icon (BTC Logo)
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        "assets/svg/eyew3.svg",
                        width: 20,
                        height: 20,
                      ),
                    ),

                    // 🔹 Suffix Icon (Dropdown Arrow)
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFFCCCCCC),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 14,
                  ),
                  cursorColor: Colors.white, // Cursor color
                  onTap: () {
                    // Open dropdown or action when tapped
                  },
                ),
                20.vSpace,
                Text(
                  "Choose payment method",
                  style: GoogleFonts.plusJakartaSans(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w500),
                ),
                10.vSpace,
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C30),
                      border: Border.all(
                        color: Color(0xFF44444A),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        dropdownColor: AppColors.disableBtnColor,
                        value: selectedPaymentMethod,
                        hint: Text(
                          "Select Payment Method",
                          style: GoogleFonts.inter(color: Color(0xff6C7278), fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        icon: Row(
                          children: [
                            Image.asset(
                              "assets/images/drop.png",
                              color: Colors.white,
                            ),
                            5.hSpace,
                          ],
                        ),
                        items: ["Visa", "MasterCard", "PayPal"]
                            .map((method) => DropdownMenuItem(
                                  value: method,
                                  child: Text(method, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12)),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedPaymentMethod = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                20.vSpace,
                Text(
                  "Wallet Address",
                  style: GoogleFonts.plusJakartaSans(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w500),
                ),
                10.vSpace,
                TextField(
                  decoration: InputDecoration(
                    hintText: "X21haskana...",
                    hintStyle: GoogleFonts.inter(
                        color: Color(0xFF6C7278), // Grey text color
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    filled: true,
                    fillColor: Color(0xFF2C2C30), // Dark background
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded edges
                      borderSide: BorderSide(
                        color: Color(0xFF44444A), // Subtle border
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: Color(0xFF44444A),
                        width: 1,
                      ),
                    ),
                    prefixIcon: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(15), // Adjust padding for better alignment
                        child: SvgPicture.asset(
                          "assets/svg/w.svg",
                          width: 15,
                          height: 15,
                          // colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: Color(0xFF333333), // No highlight on focus
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  ),
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 14,
                  ),
                  cursorColor: Colors.white, // Cursor color
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
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Input Amount",
                              hintStyle: GoogleFonts.inter(
                                  color: Color(0xFF6C7278), // Grey text color
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              filled: true,
                              fillColor: Color(0xFF2C2C30), // Dark background
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10), // Rounded edges
                                borderSide: BorderSide(
                                  color: Color(0xFF44444A), // Subtle border
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Color(0xFF44444A),
                                  width: 1,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(15), // Adjust padding for better alignment
                                  child: SvgPicture.asset(
                                    "assets/svg/eyew1.svg",
                                    width: 15,
                                    height: 15,
                                    // colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Color(0xFF333333), // No highlight on focus
                                  width: 1,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                            ),
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 14,
                            ),
                            cursorColor: Colors.white, // Cursor color
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
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Equivalent",
                              hintStyle: GoogleFonts.inter(
                                  color: Color(0xFF6C7278), // Grey text color
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              filled: true,
                              fillColor: Color(0xFF2C2C30), // Dark background
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10), // Rounded edges
                                borderSide: BorderSide(
                                  color: Color(0xFF44444A), // Subtle border
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Color(0xFF44444A),
                                  width: 1,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(15), // Adjust padding for better alignment
                                  child: SvgPicture.asset(
                                    "assets/svg/eyew3.svg",
                                    width: 15,
                                    height: 15,
                                    // colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Color(0xFF333333), // No highlight on focus
                                  width: 1,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                            ),
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 14,
                            ),
                            cursorColor: Colors.white, // Cursor color
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
                      height: 15.h,
                      width: 15.w,
                      color: Color(0xffACB5BB),
                    ),
                    10.hSpace,
                    Text(
                      "Minimun value buy crypto = 0,0001 BTC",
                      style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    RoutingService.push(const BuyDetailScreen());
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

class BuyDetailScreen extends StatefulWidget {
  const BuyDetailScreen({super.key});

  @override
  State<BuyDetailScreen> createState() => _BuyDetailScreenState();
}

class _BuyDetailScreenState extends State<BuyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/topupbg.png",
      fit: BoxFit.cover,
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
                          "Buy",
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
                        color: Color(0xffACB5BB),
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
                  height: 55.h,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
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
                          height: 45.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF222223),
                            border: Border.all(color: const Color(0xFF2C2C30)),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Center(
                            child: Text(
                              "Share",
                              style: GoogleFonts.inter(color: AppColors.white, 
                              fontWeight: FontWeight.w600, fontSize: 14),
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
                          height: 45.h,
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
