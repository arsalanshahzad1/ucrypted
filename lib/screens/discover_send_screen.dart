import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class DiscoverSendScreen extends StatefulWidget {
  const DiscoverSendScreen({super.key});

  @override
  State<DiscoverSendScreen> createState() => _DiscoverSendScreenState();
}

class _DiscoverSendScreenState extends State<DiscoverSendScreen> {
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
                const SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Send",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
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
                const SizedBox(height: 40),

                // Wallet Selection
                Text(
                  "Select Wallet",
                  style: GoogleFonts.plusJakartaSans(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),

                // BTC Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xff1E1E20),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.orange),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 20,
                                color: Color(0xffECAC31),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "BTC Balance",
                                style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "0.34545 ",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "BTC",
                                style: GoogleFonts.inter(
                                  color: Color(0xffACB5BB),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          exchangeWidget("assets/svg/bscexc.svg"),
                          const SizedBox(height: 8),
                          Text(
                            "21900,84 USD",
                            style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // ETH Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xff1E1E20),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 20,
                                color: Color(0xffBBB9FD),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "ETH Balance",
                                style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "12,345 ",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "ETH",
                                style: GoogleFonts.inter(
                                  color: Color(0xffACB5BB),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          exchangeWidget("assets/svg/ethex.svg"),
                          const SizedBox(height: 8),
                          Text(
                            "37870,88 USD",
                            style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),
                Center(
                  child: Text(
                    "View more",
                    style: GoogleFonts.plusJakartaSans(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 20),
                Divider(
                  height: 1.0,
                  color: Color(0xff2C2C30),
                ),
                const SizedBox(height: 20),
                // Crypto Amount Input
                Text(
                  "Crypto Amount",
                  style: GoogleFonts.plusJakartaSans(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    hintText: "min amount 0,00001 BTC",
                    hintStyle: GoogleFonts.inter(color: Color(0xff6C7278), fontSize: 14, fontWeight: FontWeight.w400),
                    filled: true,
                    fillColor: Color(0xff2C2C30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xff44444A)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Wallet Address Input
                Text(
                  "Wallet Address",
                  style: GoogleFonts.plusJakartaSans(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    hintText: "Enter wallet address",
                    hintStyle: GoogleFonts.inter(color: Color(0xff6C7278), fontSize: 14, fontWeight: FontWeight.w400),
                    filled: true,
                    fillColor: Color(0xff2C2C30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xff44444A)),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(
                        "assets/svg/eye.svg",
                        // height: 20,
                        // width: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    RoutingService.push(const SelectNetwork());
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

  // Dummy exchangeWidget function, replace with your actual implementation
  Widget exchangeWidget(String assetPath) {
    return SizedBox(
      width: 40,
      height: 40,
      child: SvgPicture.asset(assetPath), // Adjust if needed
    );
  }
}

class SelectNetwork extends StatefulWidget {
  const SelectNetwork({super.key});

  @override
  State<SelectNetwork> createState() => _SelectNetworkState();
}

class _SelectNetworkState extends State<SelectNetwork> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: Stack(
        children: [
          // Back button and title
          Positioned(
            top: 60, // Adjust based on your UI
            left: 16,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Select Network",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),

          // Modal-like container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.75, // Adjust height as needed
              decoration: const BoxDecoration(
                  // color: Color(0xFF1A1A1E), // Modal-like background
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 29, 29, 30),
                      Color(0xff161618),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Drag Indicator (Grey bar at the top)
                  Center(
                    child: Container(
                      width: 65.w,
                      height: 4.h,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Color(0xff44444A),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  // Title
                  Text(
                    "Choose Network",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Scrollable list of network cards inside the modal container
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _networkCard("BNB Smart Chain (BEP20)", "15 Block Confirmation", "Min. Deposit > 0.01 USDT", "Est arrival 1 min"),
                          _networkCard("Tron (TRC20)", "1 Block Confirmation", "Min. Deposit > 0.01 USDT", "Est arrival 1 min"),
                          _networkCard("Aptos", "1 Block Confirmation", "Min. Deposit > 0.0000001 USDT", "Est arrival 1 min"),
                          _networkCard("Ethereum (ERC20)", "6 Block Confirmation", "Min. Deposit > 0.001 USDT", "Est arrival 2 min"),
                          _networkCard("BNB Smart Chain (BEP20)", "1 bundle", "Min. Deposit > 0.001 USDT", "Est arrival 2 min"),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Single Network Card Widget
  Widget _networkCard(String title, String confirmation, String minDeposit, String arrival) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12), // Space between cards
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color(0xff1E1E20), // Card color
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xff2C2C30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            confirmation,
            style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 10, fontWeight: FontWeight.w400),
          ),
          Text(
            minDeposit,
            style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 10, fontWeight: FontWeight.w400),
          ),
          Text(
            arrival,
            style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 10, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
