import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class PProfileScreen extends StatefulWidget {
  const PProfileScreen({super.key});

  @override
  State<PProfileScreen> createState() => _PProfileScreenState();
}

class _PProfileScreenState extends State<PProfileScreen> {
  int i = 4;

  final List<String> _selectedIcons = [
    "assets/svg/home-bottoms.svg",
    "assets/svg/trade-bottoms.svg",
    "assets/svg/convert-bottoms.svg",
    "assets/svg/gift-bottoms.svg",
    "assets/svg/discover-bottoms.svg"
  ];
  final List<String> _unselectedIcons = [
    "assets/svg/home-bottom.svg",
    "assets/svg/trade-bottom.svg",
    "assets/svg/convert-bottom.svg",
    "assets/svg/gift-bottom.svg",
    "assets/svg/discover-bottom.svg"
  ];

  void _onItemTapped(int index) {
    setState(() {
      i = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      bottomNavChild: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 28, 28, 30),
          border: Border(
            top: BorderSide(color: Colors.black, width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: i,
          onTap: _onItemTapped,
          selectedFontSize: 0.0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.white,
          items: List.generate(5, (index) {
            return BottomNavigationBarItem(
              label: "",
              icon: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: SvgPicture.asset(_unselectedIcons[index], width: 60, height: 60),
                  ),
                  25.vSpace,
                ],
              ),
              activeIcon: Column(
                children: [
                  SizedBox(
                    child: SvgPicture.asset(
                      _selectedIcons[index],
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                  ),
                  25.vSpace,
                ],
              ),
            );
          }),
        ),
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.vSpace,
                SizedBox(
                  height: 120.h,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/scene.png",
                    fit: BoxFit.cover,
                  ),
                ),
                20.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Sa***",
                    style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xffD5D5D5)),
                  ),
                ),
                10.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset("assets/images/pak.png"),
                      Text(
                        " Pakistan | Joined on : 03/04/2025",
                        style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 10, color: Color(0xffD5D5D5)),
                      ),
                    ],
                  ),
                ),
                10.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset("assets/images/v1.png"),
                      Text(
                        " ID verified on 03/05/2025",
                        style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xff25C866)),
                      ),
                      10.hSpace,
                      Image.asset("assets/images/v2.png"),
                      Text(
                        " Email",
                        style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xff25C866)),
                      ),
                      10.hSpace,
                      Image.asset("assets/images/v2.png"),
                      Text(
                        " Mobile",
                        style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xff25C866)),
                      ),
                    ],
                  ),
                ),
                10.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(color: const Color(0xFF0F0F0F), borderRadius: BorderRadius.circular(12.r), border: Border.all(color: Color(0xff393737))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My P2P funds",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        const Divider(
                          height: 1.0,
                          color: Color(0xff393737),
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Available", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xffD5D5D5))),
                            Text("32.54 USDT", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xffD5D5D5))),
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Locked", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xffD5D5D5))),
                            Text("10.54 USDT", style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 11, color: Color(0xffD5D5D5))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16.h),

                // Information box
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(color: const Color(0xFF0F0F0F), borderRadius: BorderRadius.circular(12.r), border: Border.all(color: Color(0xff393737))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "information",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        const Divider(
                          height: 1.0,
                          color: Color(0xff393737),
                        ),
                        SizedBox(height: 12.h),
                        infoRow("Total Completed Orders", "1"),
                        infoRow("Completion Rate (%)", "100.00%"),
                        infoRow("Avg. Payment Time", "6m 54s"),
                        infoRow("Positive Reviews (%)", "N/A"),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16.h),

                // Menu Items
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: menuTile("Payment", () {
                    RoutingService.push(const Paymentscreen());
                  }),
                ),
                10.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: menuTile("Setting", () {
                    RoutingService.push(const SettingScreen());
                  }),
                ),
                10.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: menuTile("P2P guide", () {}),
                ),
              ],
            ),
            Positioned(
              child: SizedBox(height: 35.h, width: 35.w, child: Image.asset("assets/images/person.png")),
              top: 130.h,
              left: 10.w,
            ),
            Positioned(
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(color: Color(0xff25C866), borderRadius: BorderRadius.circular(10.r)),
              ),
              top: 155.h,
              left: 35.w,
            ),
          ],
        ),
      ),
    );
  }

  Widget menuTile(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        decoration: BoxDecoration(color: const Color(0xFF0F0F0F), borderRadius: BorderRadius.circular(12.r), border: Border.all(color: Color(0xff393737))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: GoogleFonts.poppins(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w300)),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
          ],
        ),
      ),
    );
  }

  TextStyle labelStyle() => TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: 14.sp,
      );

  TextStyle valueStyle() => TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      );

  Widget infoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.inter(fontSize: 11, color: Color(0xffD5D5D5), fontWeight: FontWeight.w400)),
          Text(value, style: GoogleFonts.inter(fontSize: 11, color: Color(0xffD5D5D5), fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}

class Paymentscreen extends StatefulWidget {
  const Paymentscreen({super.key});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              50.vSpace,
              Stack(
                alignment: Alignment.center,
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
                    "Payment",
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              30.vSpace,
              Container(
                padding: EdgeInsets.all(12.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFF212121),
                    borderRadius: BorderRadius.circular(10.r),
                    border: GradientBoxBorder(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]))),
                child: Column(
                  children: [
                    Text(
                      "Ucrypto doesn’t process your buyers’ payments. Always check your payment account to confirm that you’ve received the full amount.",
                      style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontSize: 12.sp, fontWeight: FontWeight.w400),
                    ),
                    10.vSpace,
                    Text(
                      "Add a payment account under your own name. Using someone else’s account may lead to order cancellation or account suspension.",
                      style: GoogleFonts.poppins(color: Color(0xff8E8E8E), fontSize: 10.sp, fontWeight: FontWeight.w400),
                    ),
                    10.vSpace,
                    Divider(
                      height: 1.0,
                      color: Color(0xff282828),
                    ),
                    10.vSpace,
                    Row(
                      children: [
                        Text(
                          "Add Now",
                          style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontSize: 10.sp, fontWeight: FontWeight.w400),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 14,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              20.vSpace,
              Image.asset(
                "assets/images/f11.png",
                fit: BoxFit.cover,
              ),
              20.vSpace,
              Text(
                "You haven’t added any payment methods",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              20.vSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  "add a payment method using your real name, go to the payment settings and select 'Add Payment Method.' Choose your preferred option (credit/debit card, PayPal, or bank transfer) and enter your real name exactly as it appears on official documents.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontSize: 10.sp, fontWeight: FontWeight.w400),
                ),
              ),
              20.vSpace,
              GestureDetector(
                onTap: () {
                  RoutingService.push(const AddNowScreen());
                },
                child: Container(
                  height: 40.h,
                  width: 250.w,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(
                    child: Text(
                      "Add Now",
                      style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              50.vSpace,
              Stack(
                alignment: Alignment.center,
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
                    "Settings",
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              40.vSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(color: const Color(0xFF0F0F0F), borderRadius: BorderRadius.circular(12), border: Border.all(color: Color(0xff393737))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section 1
                    Text(
                      "Privacy And Security",
                      style: GoogleFonts.inter(
                        color: Color(0xffD5D5D5),
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8),

                    GestureDetector(
                      onTap: () {
                        RoutingService.push(const VCPreferenceScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Verification code preferences",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Alwayss",
                                style: GoogleFonts.inter(
                                  color: Color(0xffD5D5D5),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 14,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Divider(
                      height: 1.0,
                      color: Color(0xff393737),
                    ),
                    16.vSpace,

                    // Section 2
                    Text(
                      "Quick Replies",
                      style: GoogleFonts.inter(
                        color: Color(0xffD5D5D5),
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        RoutingService.push(const AQMessageScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Auto quick massages",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AQMessageScreen extends StatefulWidget {
  const AQMessageScreen({super.key});

  @override
  State<AQMessageScreen> createState() => _AQMessageScreenState();
}

class _AQMessageScreenState extends State<AQMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              50.vSpace,
              Stack(
                alignment: Alignment.center,
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
                    "Auto quick massages ",
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              40.vSpace,
              Container(
                padding: EdgeInsets.all(12.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFF212121),
                    borderRadius: BorderRadius.circular(10.r),
                    border: GradientBoxBorder(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]))),
                child: Column(
                  children: [
                    Text(
                      "Create, edit, or delete the customized replies that you can\nreuse in the chat function. You can create up to 15 of them.",
                      style: GoogleFonts.poppins(color: Color(0xff8E8E8E), fontSize: 10.sp, fontWeight: FontWeight.w400),
                    ),
                    10.vSpace,
                    Divider(
                      height: 1.0,
                      color: Color(0xff282828),
                    ),
                    5.vSpace,
                  ],
                ),
              ),
              30.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(color: Color(0xff272727), borderRadius: BorderRadius.circular(30.r)),
                    child: Image.asset(
                      "assets/images/u_icon.png", // Replace with your icon
                      width: 30.w,
                      height: 30.h,
                      // fit: BoxFit.fill,
                    ),
                  ),
                  8.horizontalSpace,
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF212121),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        "Your account can not receive the payment due to wrong account details or account suspension. Can you please provide the account information again?",
                        style: GoogleFonts.poppins(color: Color(0xffB6B6B6), fontSize: 12.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(color: Color(0xff272727), borderRadius: BorderRadius.circular(30.r)),
                    child: Image.asset(
                      "assets/images/u_icon.png", // Replace with your icon
                      width: 30.w,
                      height: 30.h,
                      // fit: BoxFit.fill,
                    ),
                  ),
                  8.horizontalSpace,
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF212121),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        "I have completed the payment and sent the payment proof. Please confirm that you are processing the order.",
                        style: GoogleFonts.poppins(color: Color(0xffB6B6B6), fontSize: 12.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VCPreferenceScreen extends StatefulWidget {
  const VCPreferenceScreen({super.key});

  @override
  State<VCPreferenceScreen> createState() => _VCPreferenceScreenState();
}

class _VCPreferenceScreenState extends State<VCPreferenceScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.vSpace,
              Stack(
                alignment: Alignment.center,
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
                    "Verification code preferences",
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              20.vSpace,
              Text(
                "Choose how often we ask you for a verification code before you trade. Codes can be sent via email, SMS, or authenticator apps.",
                style: GoogleFonts.poppins(color: Color(0xff8E8E8E), fontSize: 10.sp, fontWeight: FontWeight.w400),
              ),
              10.vSpace,
              Divider(
                height: 1.0,
                color: Color(0xff282828),
              ),
              10.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Always",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xffFAFAFA)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      height: 20.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: const Color.fromARGB(255, 185, 111, 2),
                          size: 15.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              10.vSpace,
              Text(
                "Never",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xffFAFAFA)),
              ),
              10.vSpace,
              Text(
                "Every 4 hours",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xffFAFAFA)),
              ),
              10.vSpace,
              Text(
                "Every 12 hours",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xffFAFAFA)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddNowScreen extends StatefulWidget {
  const AddNowScreen({super.key});

  @override
  State<AddNowScreen> createState() => _AddNowScreenState();
}

class _AddNowScreenState extends State<AddNowScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.vSpace,
              Stack(
                alignment: Alignment.center,
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
                    "Add Payment method",
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              40.vSpace,
              Text(
                "Select Currency",
                style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
              ),
              10.vSpace,
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(isScrollControlled: true, paymentSelectionBottomSheet(700, context));
                },
                child: Container(
                  height: 40.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffCCCCCC),
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select your country currency",
                        style: GoogleFonts.poppins(color: Color(0xffCCCCCC), fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              20.vSpace,
              Text(
                "Payment Method",
                style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
              ),
              10.vSpace,
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(isScrollControlled: true, countrySelectionBottomSheet(700, context));
                },
                child: Container(
                  height: 40.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffCCCCCC),
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select payment method",
                        style: GoogleFonts.poppins(color: Color(0xff696969), fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xff696969),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget countrySelectionBottomSheet(double height, BuildContext c) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        color: Color(0xff212121),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          5.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 3.h,
                width: 100.w,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
              ),
            ],
          ),
          20.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: Colors.white.withOpacity(0.08), // Shattered border base
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.04),
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.06),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/svg/searchh.svg"),
                  SizedBox(width: 10),
                  Text(
                    'Search',
                    style: GoogleFonts.inter(color: Color(0xffCDCDCD), fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          10.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Default Currency",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Color(0xff8E8E8E)),
            ),
          ),
          10.vSpace,
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                height: 1.0,
                color: Color(0xff8E8E8E),
              )),
          10.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10.r,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/pak.png",
                          fit: BoxFit.cover,
                          width: 30.r, // Ensure the image fully fits the avatar
                          height: 30.r,
                        ),
                      ),
                    ),
                    Text(
                      " PKR",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xffFAFAFA)),
                    ),
                  ],
                ),
                Container(
                  height: 20.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: const Color.fromARGB(255, 185, 111, 2),
                      size: 15.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          10.vSpace,
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                height: 1.0,
                color: Color(0xff8E8E8E),
              )),
          10.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Default Currency",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Color(0xff8E8E8E)),
            ),
          ),
          10.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                customRow("assets/images/f1.png"),
                10.vSpace,
                customRow("assets/images/f2.png"),
                10.vSpace,
                customRow("assets/images/f3.png"),
                10.vSpace,
                customRow("assets/images/f4.png"),
                10.vSpace,
                customRow("assets/images/f5.png"),
                10.vSpace,
                customRow("assets/images/f6.png"),
                10.vSpace,
                customRow("assets/images/f7.png"),
                10.vSpace,
                customRow("assets/images/f8.png"),
                10.vSpace,
                customRow("assets/images/f9.png"),
                10.vSpace,
                customRow("assets/images/f10.png"),
                10.vSpace,
                customRow("assets/images/f111.png"),
                10.vSpace,
                customRow("assets/images/f12.png"),
                10.vSpace,
                customRow("assets/images/f13.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customRow(String image) {
    return Row(
      children: [
        CircleAvatar(
          radius: 10.r,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: 30.r, // Ensure the image fully fits the avatar
              height: 30.r,
            ),
          ),
        ),
        10.hSpace,
        Text(
          "Currencies name",
          style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.grey),
        )
      ],
    );
  }

  Widget paymentSelectionBottomSheet(double height, BuildContext c) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        color: Color(0xff212121),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          5.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 3.h,
                width: 100.w,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
              ),
            ],
          ),
          20.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: Colors.white.withOpacity(0.08), // Shattered border base
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.04),
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.06),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/svg/searchh.svg"),
                  SizedBox(width: 10),
                  Text(
                    'Search',
                    style: GoogleFonts.inter(color: Color(0xffCDCDCD), fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          10.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Most Used Payment methods",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Color(0xff8E8E8E)),
            ),
          ),
          10.vSpace,
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                height: 1.0,
                color: Color(0xff8E8E8E),
              )),
          10.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 25.h,
                      width: 4.w,
                      decoration: BoxDecoration(color: Color(0xffF89847), borderRadius: BorderRadius.circular(12.r)),
                    ),
                    10.hSpace,
                    Text(
                      "Palpay",
                      style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontSize: 12, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Container(
                  height: 20.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: const Color.fromARGB(255, 185, 111, 2),
                      size: 15.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          10.vSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                paymentRow("Bank transfer", Color(0xff03BB61)),
                10.vSpace,
                paymentRow("JPMorgan Chase", Color(0xff950094)),
                10.vSpace,
                paymentRow("Wells Fargo", Color(0xff04E1E0)),
                10.vSpace,
                paymentRow("US bank", Color(0xffFED409)),
              ],
            ),
          ),
          10.vSpace,
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                height: 1.0,
                color: Color(0xff8E8E8E),
              )),
          10.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "All Payment methods",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Color(0xff8E8E8E)),
            ),
          ),
          10.vSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [ 
                paymentRow("Sada pay", Color(0xff950094)),
                10.vSpace,
                paymentRow("asypaisa", Color(0xffFC5252)),
                10.vSpace,
                paymentRow("Naya Paisa ", Color(0xffF89847)),
                10.vSpace,
                paymentRow("U paisa", Color(0xffFC5252)),
                10.vSpace,
                paymentRow("Other Bank", Color(0xff04E1E0)),
                10.vSpace,
                paymentRow("Other Bank", Color(0xffFFFFFF)),
                10.vSpace,
                paymentRow("Other Bank", Color(0xff03BB61)),
                10.vSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentRow(String text, Color color) {
    return Row(
      children: [
        Container(
          height: 25.h,
          width: 4.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        10.hSpace,
        Text(
          text,
          style: GoogleFonts.poppins(
            color: Color(0xffFAFAFA),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
