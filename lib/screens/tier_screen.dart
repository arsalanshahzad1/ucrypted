import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class TierScreen extends StatefulWidget {
  const TierScreen({super.key});

  @override
  State<TierScreen> createState() => _TierScreenState();
}

class _TierScreenState extends State<TierScreen> {
  String? selectedPaymentMethod;
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: SvgPicture.asset(
                          "assets/svg/menu-dots.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
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
                ],
              ),
              20.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tier Payment",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "\$25.00",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                "Supporter",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Each contribution brings us closer to\nrevolutionizing the trading experience.",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              20.vSpace,
              Text("Choose Tier", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w400)),
              20.vSpace,
              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.disableBtnColor,
                    border: Border.all(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      dropdownColor: AppColors.disableBtnColor,
                      value: selectedPaymentMethod,
                      hint: Text(
                        "Wallet",
                        style: GoogleFonts.poppins(color: const Color(0xFFCCCCCC), fontWeight: FontWeight.w300, fontSize: 12),
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
                      items: [
                        "Wallet",
                        "Credit Card",
                      ]
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
              25.vSpace,
              Text(
                "Email",
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w400),
              ),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: 'desmond@gmail.com',
                  hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: 13, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              if (selectedPaymentMethod == "Credit Card") ...[
                25.vSpace,
                Text(
                  "Cardholder Name",
                  style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w400),
                ),
                20.vSpace,
                TextField(
                  style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Enter Card holder name',
                    hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: 13, fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                ),
                25.vSpace,
                Text(
                  "Expiration Date",
                  style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w400),
                ),
                20.vSpace,
                TextField(
                  style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Enter Card holder name',
                    hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: 13, fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                ),
                25.vSpace,
                Text(
                  "CVV",
                  style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w400),
                ),
                20.vSpace,
                TextField(
                  style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Enter Card holder name',
                    hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: 13, fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                ),
              ],
              25.vSpace,
              Text(
                "Amount",
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w400),
              ),
              20.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: 'Enter Amount',
                  hintStyle: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: 13, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              20.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    RoutingService.push(const TierScreenSuccess());
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
                        "Confirm Support",
                        style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              20.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    // RoutingService.pushAndRemoveUntil(const HomeScreen());
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(28), border: Border.all(color: Colors.white)),
                    child: Center(
                      child: Text(
                        "Back",
                        style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              30.vSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class TierScreenSuccess extends StatefulWidget {
  const TierScreenSuccess({super.key});

  @override
  State<TierScreenSuccess> createState() => _TierScreenSuccessState();
}

class _TierScreenSuccessState extends State<TierScreenSuccess> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/background1.png",
      child: SingleChildScrollView(
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
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: SvgPicture.asset(
                          "assets/svg/menu-dots.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
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
                ],
              ),
              30.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(color: Color.fromARGB(32, 87, 140, 26), borderRadius: BorderRadius.circular(65)),
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: SvgPicture.asset(
                        "assets/svg/badge.svg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              20.vSpace,
              Text(
                "Your Transaction has been Successfully Processed!",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              30.vSpace,
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Color(0xffCCCCCC))),
                padding: const EdgeInsets.all(26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          decoration: BoxDecoration(
                            color: AppColors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Payment Details",
                            style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 23),
                          ),
                        ),
                      ],
                    ),
                    15.vSpace,
                    _transactionRow("Payment Method", "Wallet"),
                    15.vSpace,
                    _transactionRow("Service", "Support Tier"),
                    15.vSpace,
                    _transactionRow("Billing Type", "prepaid"),
                    15.vSpace,
                    _transactionRow("Account Number", "0400001023123123"),
                    15.vSpace,
                    _transactionRow("Amount", "\$35.00"),
                    15.vSpace,
                    const Divider(color: AppColors.grey),
                    25.vSpace,
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svg/msg.svg"),
                              10.hSpace,
                              Text(
                                "Download Payment Details",
                                style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    25.vSpace,
                    GestureDetector(
                      onTap: () {
                        // RoutingService.pushAndRemoveUntil(const HomeScreen());
                      },
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(
                              color: Color(0xffDADADA),
                            )),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svg/email.svg"),
                              10.hSpace,
                              Text(
                                "Send To Email",
                                style: GoogleFonts.poppins(color: Color(0xffDADADA), fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              30.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "For any discrepancies or complaints, please contact: support@ucrypted.com. The top-up should reflect in the recipient’s account shortly. If you encounter any issues, feel free to contact our support team.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(color: Color(0xffDADADA), fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),
              30.vSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _transactionRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(color: Color(0xffDADADA), fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: Color(0xffFAFAFA),
              fontSize: 12,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
