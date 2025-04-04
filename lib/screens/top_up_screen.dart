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

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/full.png",
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                        "Topup",
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1, // 1 part
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset("assets/svg/inof.svg"),
                    ),
                  ),
                ],
              ),
              20.vSpace,
              Text(
                "How would you like to top up?",
                style: GoogleFonts.inter(
                  color: AppColors.white,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              15.vSpace,
              Text(
                "Bank Transfer",
                style: GoogleFonts.inter(
                  color: AppColors.grey,
                  fontSize: 16.sp,
                ),
              ),
              30.vSpace,
              settingsItem("assets/images/paypal.png", "Paypal", 0),
              25.vSpace,
              settingsItem("assets/images/jpmorgan.png", "JPMorgan Chase", 1),
              25.vSpace,
              settingsItem("assets/images/wells-fargo.png", "Well Fargo", 2),
              25.vSpace,
              settingsItem("assets/images/us.png", "US Bank", 3),
              25.vSpace,
              settingsItem("assets/images/otherbank.png", "Other Bank", 4),
              25.vSpace,
              Text(
                "Credit/Debit Card",
                style: GoogleFonts.inter(
                  color: AppColors.grey,
                  fontSize: 16,
                ),
              ),
              10.vSpace,
              settingsItem("assets/images/add.png", "Add Bank", 5),
              20.vSpace,
              GestureDetector(
                onTap: () {
                  RoutingService.push(EnterAmountScreen(
                    selectedIndex: selectedIndex,
                  ));
                },
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 18),
                    ),
                  ),
                ),
              ),
              20.vSpace,
            ],
          ),
        ),
      ),
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
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 22, 22, 23),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: selectedIndex == index ? AppColors.textColor : Colors.transparent)),
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 10.w),
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
}

class EnterAmountScreen extends StatefulWidget {
  final int? selectedIndex;
  const EnterAmountScreen({super.key, required this.selectedIndex});

  @override
  State<EnterAmountScreen> createState() => _EnterAmountScreenState();
}

class _EnterAmountScreenState extends State<EnterAmountScreen> {
  final TextEditingController _amountController = TextEditingController(text: "\$227.00");
  int? selectedAmount;
  List<int> amounts = [50, 100, 500, 1000];
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/full.png",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
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
                            "Topup",
                            style: GoogleFonts.inter(
                              color: AppColors.white,
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
                  20.vSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "How much would you want to Topup ?",
                        style: GoogleFonts.inter(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  20.vSpace,
                  TextField(
                    controller: _amountController,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                  20.vSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: amounts.map((amount) => _buildAmountButton(amount)).toList(),
                  ),
                  30.vSpace,
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xff1E1E20),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        2.vSpace,
                        const Icon(Icons.info_outline, color: Colors.white60, size: 20),
                        10.hSpace,
                        Expanded(
                          child: Text(
                            "Enter the amount you wish to add to your account balance. The min top-up amount is \$50, and the max is \$10,000.",
                            style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  30.vSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Selected Bank Transfer", style: GoogleFonts.inter(color: Colors.white70, fontSize: 14)),
                  ),
                  10.vSpace,
                  Container(
                    decoration: BoxDecoration(color: const Color(0xFF1E1E20), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.transparent)),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: const Color(0xFF44444A)),
                            child: Image.asset(
                              _getImagePath(widget.selectedIndex ?? -1),
                            )),
                        15.hSpace,
                        Expanded(
                          child: Text(
                            _getTitle(widget.selectedIndex ?? -1),
                            style: GoogleFonts.inter(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  Get.bottomSheet(bottomSheetContent(500, _amountController.text, "\$00.00", "\$21.00", "\$23.0120", () {
                    // RoutingService.push(const InputRecoverySuccessScreen());
                  }));
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFCA509), Color(0xFF880306)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(
                    child: Text("Continue", style: GoogleFonts.inter(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ),
            ),
            // 30.vSpace,
            // 100.vSpace,
          ],
        ),
      ),
    );
  }

  String _getImagePath(int index) {
    switch (index) {
      case 0:
        return "assets/images/paypal.png";
      case 1:
        return "assets/images/jpmorgan.png";
      case 2:
        return "assets/images/wells-fargo.png";
      case 3:
        return "assets/images/us.png";
      case 4:
        return "assets/images/otherbank.png";
      case 5:
        return "assets/images/add.png";
      default:
        return "assets/images/add.png";
    }
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return "Paypal";
      case 1:
        return "JPMorgan Chase";
      case 2:
        return "Well Fargo";
      case 3:
        return "US Bank";
      case 4:
        return "Other Bank";
      case 5:
        return "Add Bank";
      default:
        return "-";
    }
  }

  Widget _buildAmountButton(int amount) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAmount = amount;
          _amountController.text = amount.toStringAsFixed(2);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          height: 40.h,
          width: 70.w,
          // padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: selectedAmount == amount ? Color(0xff2C2C30) : Colors.transparent,
            ),
            color: selectedAmount == amount ? null : const Color(0xFF161618), // Default color if gradient isn't applied
            gradient: selectedAmount == amount
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFCA509),
                      Color(0xFF880306),
                    ],
                  )
                : const LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF2C2C30),
                      Color(0xFF161618),
                    ],
                  ),
          ),
          child: Center(
            child: Text(
              "\$$amount",
              style: GoogleFonts.inter(
                color: selectedAmount == amount ? Colors.white : Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheetContent(
    double height,
    String amount,
    String tpAmount,
    String pFees,
    String tPayment,
    VoidCallback onTap,
  ) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF2C2C30),
            Color(0xFF161618),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Container(height: 4, width: 70, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xff44444A)))],
            ),
            20.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Amount Top up",
                  style: GoogleFonts.inter(color: Color(0xff6C7278), fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ],
            ),
            10.vSpace,
            Text(
              "$amount",
              style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 32),
            ),
            10.vSpace,
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E20),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xff2C2C30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svg/inof.svg"),
                  10.hSpace,
                  Text(
                    "Topup with Stripe will not Cost any fee !",
                    style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            20.vSpace,
            const Divider(
              height: 0.5,
              color: Color(0xFF2C2C30),
            ),
            20.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Up Amount",
                  style: GoogleFonts.inter(fontSize: 14, color: Color(0xff6C7278), fontWeight: FontWeight.w500),
                ),
                Text(
                  tpAmount,
                  style: GoogleFonts.inter(fontSize: 15, color: AppColors.white, fontWeight: FontWeight.w500),
                )
              ],
            ),
            20.vSpace,
            const Divider(
              height: 0.5,
              color: Color(0xFF2C2C30),
            ),
            20.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Platform Fees",
                  style: GoogleFonts.inter(fontSize: 14, color: Color(0xff6C7278), fontWeight: FontWeight.w500),
                ),
                Text(
                  pFees,
                  style: GoogleFonts.inter(fontSize: 15, color: AppColors.white, fontWeight: FontWeight.w500),
                )
              ],
            ),
            20.vSpace,
            const Divider(
              height: 0.5,
              color: Color(0xFF2C2C30),
            ),
            20.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Payment",
                  style: GoogleFonts.inter(fontSize: 14, color: Color(0xff6C7278), fontWeight: FontWeight.w500),
                ),
                Text(
                  tPayment,
                  style: GoogleFonts.inter(fontSize: 15, color: AppColors.white, fontWeight: FontWeight.w500),
                )
              ],
            ),
            20.vSpace,
            GestureDetector(
              onTap: () {
                RoutingService.push(const TopUpSuccessScreen());
              },
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Center(
                  child: Text(
                    "Confirm",
                    style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopUpSuccessScreen extends StatefulWidget {
  const TopUpSuccessScreen({super.key});

  @override
  State<TopUpSuccessScreen> createState() => _TopUpSuccessScreenState();
}

class _TopUpSuccessScreenState extends State<TopUpSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/bg1.png",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                  ],
                ),
              ],
            ),
            20.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(color: Color.fromARGB(32, 87, 140, 26), borderRadius: BorderRadius.circular(90)),
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: SvgPicture.asset(
                      "assets/svg/success.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
            20.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Top-up Successful",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            10.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You've added \$227.00 to your wallet.",
                  style: GoogleFonts.inter(
                    color: Color(0xff6C7278),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            20.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _actionButton("Share"),
                20.hSpace,
                _actionButton("Print"),
              ],
            ),
            20.vSpace,
            Container(
              decoration: BoxDecoration(color: Color(0xff1E1E20), borderRadius: BorderRadius.circular(12), border: Border.all(color: Color(0xff2C2C30))),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _transactionRow1("From", "assets/svg/paypal.svg", "US bank"),
                  10.vSpace,
                  _transactionRow("Transaction ID", "", "#1213213121"),
                  10.vSpace,
                  _transactionRow("Date & Time", "", "12 Jan 2024 03.20 am"),
                  10.vSpace,
                  _transactionRow("Nominal", "", "\$227.00"),
                  10.vSpace,
                  _transactionRow("Tax", "", "\$1.00"),
                  10.vSpace,
                  const Divider(color: Color(0xff2C2C30)),
                  10.vSpace,
                  _transactionRow("Total payment", "", "\$228.00", isBold: true),
                  10.vSpace,
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                RoutingService.pushAndRemoveUntil(const HomeScreen());
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFCA509), Color(0xFF880306)],
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Center(
                  child: Text(
                    "Go to Home",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            20.vSpace,
          ],
        ),
      ),
    );
  }

  Widget _actionButton(String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF2C2C30),
              Color(0xFF161618),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget _transactionRow(String label, String iconPath, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          if (iconPath.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SvgPicture.asset(iconPath, height: 20, width: 20),
            ),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(color: const Color(0xFF6C7278), fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _transactionRow1(String label, String iconPath, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(color: const Color(0xFF6C7278), fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          if (iconPath.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SvgPicture.asset(iconPath, height: 25, width: 25),
            ),
          Text(
            value,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
