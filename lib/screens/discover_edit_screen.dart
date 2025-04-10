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

class DiscoverEditScreen extends StatefulWidget {
  const DiscoverEditScreen({super.key});

  @override
  State<DiscoverEditScreen> createState() => _DiscoverEditScreenState();
}

class _DiscoverEditScreenState extends State<DiscoverEditScreen> {
  String selectedCrypto = "BTC Wallet";
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
                          "Edit Wallet",
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
                  "Select Coin/Crypto",
                  style: GoogleFonts.plusJakartaSans(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w500),
                ),
                10.vSpace,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(color: const Color(0xFF2C2C30), borderRadius: BorderRadius.circular(8), border: Border.all(color: Color(0xff44444A))),
                  child: DropdownButtonFormField<String>(
                    value: selectedCrypto,
                    decoration: const InputDecoration(border: InputBorder.none),
                    dropdownColor: const Color(0xFF161618),
                    icon: Image.asset("assets/images/drop.png"),
                    style: GoogleFonts.plusJakartaSans(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                    items: ["BTC Wallet", "ETH Wallet", "BNB Wallet"]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCrypto = value!;
                      });
                    },
                  ),
                ),
                25.vSpace,
                Text(
                  "Connect API",
                  style: GoogleFonts.plusJakartaSans(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w500),
                ),
                10.vSpace,
                Container(
                  decoration: BoxDecoration(color: const Color(0xFF2C2C30), borderRadius: BorderRadius.circular(8), border: Border.all(color: Color(0xff44444A))),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          style: GoogleFonts.inter(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                            hintText: "Aw1121jh3112xkaias12kl98s",
                            hintStyle: GoogleFonts.inter(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.copy,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                15.vSpace,
                Row(
                  children: [
                    const Icon(Icons.info_outline, color: Color(0xffACB5BB), size: 16),
                    const SizedBox(width: 6),
                    Text(
                      "Get the API from your bank wallet or digital wallet",
                      style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "Enter Wallet Name",
                  style: GoogleFonts.plusJakartaSans(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w500),
                ),
                10.vSpace,
                Container(
                  decoration: BoxDecoration(color: const Color(0xFF2C2C30), borderRadius: BorderRadius.circular(8), border: Border.all(color: Color(0xff44444A))),
                  child: TextField(
                    style: GoogleFonts.inter(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      hintText: "https://walletapp/yourname.co...",
                      hintStyle: GoogleFonts.inter(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                20.vSpace,
                Row(
                  children: [
                    const Icon(Icons.info_outline, color: Color(0xffACB5BB), size: 16),
                    const SizedBox(width: 6),
                    Text(
                      "Get address from your digital wallet or bank account",
                      style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
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
                              "Cancel",
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
                          height: 45.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Center(
                            child: Text(
                              "Save",
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
