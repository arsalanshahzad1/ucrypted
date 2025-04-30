import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/chat_room_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/screens/tier_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class CompaignScreen extends StatefulWidget {
  const CompaignScreen({super.key});

  @override
  State<CompaignScreen> createState() => _CompaignScreenState();
}

class _CompaignScreenState extends State<CompaignScreen> {
  int _selectedIndex = 4;

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
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/tier.png",
      fit: BoxFit.fill,
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
          currentIndex: _selectedIndex,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.vSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenService.isTablet ? 30 : 16),
              child: Row(
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
                        onTap: () {
                          RoutingService.push(const ChatRoomScreen());
                        },
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
            ),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Transforming Digital Assets into Everyday Cash",
                style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 25 : 23, color: Colors.white),
              ),
            ),
            10.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Ucrypted Global Exchange makes cryptocurrency as easy to use as cash. Pay bills, shop, and connect globally, all with the power of digital assets. Join us in revolutionizing the way the world handles money.",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: ScreenService.isTablet ? 18 : 16, color: Colors.white),
              ),
            ),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/trackpg.png"), fit: BoxFit.fill),

                  // color: Colors.transparent, // Background color
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.2)), // Border effect
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: SvgPicture.asset("assets/svg/track.svg"),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    //   decoration: BoxDecoration(
                    //     color: Colors.transparent,
                    //     borderRadius: BorderRadius.circular(20),
                    //     border: Border.all(color: Colors.orangeAccent),
                    //   ),
                    //   child: Text(
                    //     "Track Our Progress",
                    //     style: GoogleFonts.poppins(
                    //       fontSize: 12,
                    //       fontWeight: FontWeight.w500,
                    //       color: Colors.orangeAccent,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 12),
                    Text(
                      "Together, We're Changing The World Of Money",
                      style: GoogleFonts.poppins(
                        fontSize: ScreenService.isTablet ? 18 : 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 40.h,
                      width: double.infinity,
                      child: SvgPicture.asset(
                        "assets/svg/bar.svg",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "80.000€ Raised",
                          style: GoogleFonts.poppins(
                            fontSize: ScreenService.isTablet ? 14 : 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: ScreenService.isTablet ? 34 : 32,
                          height: ScreenService.isTablet ? 34 : 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                          ),
                          child: Icon(Icons.arrow_outward, color: Colors.white, size: ScreenService.isTablet ? 18 : 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  RoutingService.push(const TierScreenSuccess());
                },
                child: Container(
                  height: 44.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color.fromARGB(255, 176, 4, 7)]),
                    borderRadius: BorderRadius.circular(ScreenService.isTablet ? 32 : 28),
                  ),
                  child: Center(
                    child: Text(
                      "Confirm Support",
                      style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: ScreenService.isTablet ? 20 : 18),
                    ),
                  ),
                ),
              ),
            ),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 160.h,
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xff363636), borderRadius: BorderRadius.circular(1.r)),
                child: Center(
                  child: Text(
                    "Video Will be here.",
                    style: GoogleFonts.inter(color: Color(0xffFAFAFA), fontWeight: FontWeight.w500, fontSize: ScreenService.isTablet ? 26 : 24),
                  ),
                ),
              ),
            ),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Introduction",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: ScreenService.isTablet ? 20 : 18,
                  color: Colors.white,
                ),
              ),
            ),
            10.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: ScreenService.isTablet ? 16 : 14,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: "Hello! We are the team behind ",
                    ),
                    TextSpan(
                      text: "Ucrypted Global Exchange",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenService.isTablet ? 16 : 14,
                      ), // Bold
                    ),
                    TextSpan(
                      text:
                          ", a platform designed to bring cryptocurrency into everyday transactions. Our mission is to make digital assets practical and accessible whether for paying bills, shopping, or connecting globally. We believe cryptocurrency should be as easy to use as cash, and with your support, we can make that vision a reality. Together, we can revolutionize the way the world interacts with money.",
                    ),
                  ],
                ),
              ),
            ),
            10.vSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // RoutingService.pushAndRemoveUntil(const HomeScreen());
                    },
                    child: Container(
                      height: ScreenService.isTablet ? 45.h : 50.h,
                      width: 120.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(ScreenService.isTablet ? 32 : 28), border: Border.all(color: Color(0xffFFFFFF))),
                      child: Center(
                        child: Text(
                          "About Us",
                          style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: ScreenService.isTablet ? 20 : 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Color(0xff363636), borderRadius: BorderRadius.circular(1.r)),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/man.png",
                      height: ScreenService.isTablet ? 100 : 80, // Adjust based on your image size
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "What We Need & What You Get",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: ScreenService.isTablet ? 20 : 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "At Ucrypted, we’re on a mission to build the next-generation Global Exchange, one that redefines the way the world engages with secure, transparent, and efficient financial trading. To achieve this, we are raising €500,000. This funding will enable us to finalize the platform's development and bring our vision to life.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: ScreenService.isTablet ? 16 : 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "What We Need",
                style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: ScreenService.isTablet ? 25 : 23, color: Color(0xffFAFAFA)),
              ),
            ),
            10.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "We believe in creating value for those who invest in our journey. Here’s how your contributions will directly benefit you.",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: ScreenService.isTablet ? 18 : 16, color: Colors.white),
              ),
            ),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Enables horizontal scrolling
                child: Row(
                  children: [
                    _buildCard(
                      title: "Platform Development",
                      bulletPoints: [
                        "Finalizing the design and functionality of the Ucrypted Global Exchange.",
                        "Building an intuitive and seamless user interface.",
                        "Ensuring high-speed and reliable transaction processing for a world-class trading experience.",
                      ],
                    ),
                    const SizedBox(width: 16),
                    _buildCard(
                      title: "Legal Compliance",
                      bulletPoints: [
                        "Navigating the complexities of international regulatory jurisdictions.",
                        "Securing necessary licensing and compliance with GDPR, MiFID II, and other regulations.",
                        "Partnering with top-tier legal firms to ensure full regulatory compliance.",
                      ],
                    ),
                    const SizedBox(width: 16),
                    _buildCard(
                      title: "Legal Compliance",
                      bulletPoints: [
                        "Navigating the complexities of international regulatory jurisdictions.",
                        "Securing necessary licensing and compliance with GDPR, MiFID II, and other regulations.",
                        "Partnering with top-tier legal firms to ensure full regulatory compliance.",
                      ],
                    ),
                  ],
                ),
              ),
            ),
            20.vSpace,
            Container(
              color: Color(0xff363636),
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "What We Need",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: ScreenService.isTablet ? 25 : 23, color: Color(0xffFAFAFA)),
                    ),
                  ),
                  10.vSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "We believe in creating value for those who invest in our journey. Here’s how your contributions will directly benefit you.",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: ScreenService.isTablet ? 18 : 16, color: Colors.white),
                    ),
                  ),
                  20.vSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal, // Enables horizontal scrolling
                      child: Row(
                        children: [
                          _buildCard2(
                            title: "Exclusive Early Access",
                            bulletPoints: [
                              "Be among the first to access the Ucrypted Global Exchange before its public release.",
                              "Exclusive insights into the platform’s functionalities and early features.",
                            ],
                            icon: "assets/svg/search1.svg",
                          ),
                          const SizedBox(width: 16),
                          _buildCard2(
                              title: "Exclusive Early Access",
                              bulletPoints: [
                                "Be among the first to access the Ucrypted Global Exchange before its public release.",
                                "Exclusive insights into the platform’s functionalities and early features.",
                              ],
                              icon: "assets/svg/search22.svg"),
                          const SizedBox(width: 16),
                          _buildCard2(
                              title: "Exclusive Early Access",
                              bulletPoints: [
                                "Be among the first to access the Ucrypted Global Exchange before its public release.",
                                "Exclusive insights into the platform’s functionalities and early features.",
                              ],
                              icon: "assets/svg/search22.svg"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      20.hSpace,
                      Image.asset(
                        "assets/images/sec.png",
                        height: 120.h,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Shape the Future of Finance with Ucrypted",
                    style: GoogleFonts.inter(
                      fontSize: ScreenService.isTablet ? 25 : 23,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "The world is moving towards decentralized, secure, and user-centric financial systems. Ucrypted is positioned to lead this transformation, but we need your support to make this vision a reality. Every contribution brings us closer to launching a platform that empowers individuals and businesses globally. Together, we can shape the future of secure and innovative trading. Join us on this transformative journey!",
                    style: GoogleFonts.poppins(
                      fontSize: ScreenService.isTablet ? 18 : 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "our Tier",
                    style: GoogleFonts.poppins(
                      fontSize: ScreenService.isTablet ? 25 : 23,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Your support helps build a secure, user-friendly, and globally compliant financial trading platform. Choose the tier that resonates with you and unlock exclusive rewards while contributing to a revolutionary exchange.",
                    style: GoogleFonts.poppins(
                      fontSize: ScreenService.isTablet ? 18 : 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  20.vSpace,
                  GestureDetector(
                    onTap: () {
                      RoutingService.push(const TierScreenSuccess());
                    },
                    child: Container(
                      height: 44.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                        borderRadius: BorderRadius.circular(ScreenService.isTablet ? 32 : 28),
                      ),
                      child: Center(
                        child: Text(
                          "Confirm Support",
                          style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: ScreenService.isTablet ? 20 : 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            20.vSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, // Enables horizontal scrolling
                    child: Row(
                      children: [
                        _buildCard3(
                            title: "Exclusive Early Access",
                            bulletPoints: [
                              "Be among the first to access the Ucrypted Global Exchange before its public release.",
                              "Exclusive insights into the platform’s functionalities and early features.",
                            ],
                            svg: "assets/svg/badge.svg"),
                        const SizedBox(width: 16),
                        _buildCard3(
                            title: "Exclusive Early Access",
                            bulletPoints: [
                              "Be among the first to access the Ucrypted Global Exchange before its public release.",
                              "Exclusive insights into the platform’s functionalities and early features.",
                            ],
                            svg: "assets/svg/badge22.svg"),
                        const SizedBox(width: 16),
                        _buildCard3(
                            title: "Exclusive Early Access",
                            bulletPoints: [
                              "Be among the first to access the Ucrypted Global Exchange before its public release.",
                              "Exclusive insights into the platform’s functionalities and early features.",
                            ],
                            svg: "assets/svg/badge22.svg"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            20.vSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xff212121),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.2)), // Border effect
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Join The Movement,\nStay In The Loop!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: ScreenService.isTablet ? 20 : 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFAFAFA),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Be Part Of Something Bigger! Stay Connected With Our Mission, Campaigns, And Exclusive Updates. Subscribe To Our Newsletter And Follow Us On Social Media To Spread Awareness And Foster Engagement. Together, We Can Build A Thriving Community And Drive Meaningful Change. Let's Make An Impact!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: ScreenService.isTablet ? 12 : 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffEBEBEB),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 37.h, // Set fixed height to match the button
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xffFAFAFA)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              style: GoogleFonts.poppins(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Enter your Email",
                                hintStyle: GoogleFonts.poppins(
                                  color: const Color(0xffBCBCBC),
                                  fontSize: ScreenService.isTablet ? 14 : 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                filled: false,
                                border: InputBorder.none, // Remove default border
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 37.h, // Set fixed height to match the button
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 252, 139, 9),
                                  Color(0xFF880306),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Subscribe Now",
                              style: GoogleFonts.poppins(
                                fontSize: ScreenService.isTablet ? 14 : 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Follow Us on Social Media",
                      style: GoogleFonts.poppins(
                        fontSize: ScreenService.isTablet ? 14 : 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFAFAFA),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon("assets/svg/fb1.svg"),
                        5.hSpace,
                        _buildSocialIcon("assets/svg/tb1.svg"),
                        5.hSpace,
                        _buildSocialIcon("assets/svg/insta.svg"),
                        5.hSpace,
                        _buildSocialIcon("assets/svg/yb1.svg"),
                        5.hSpace,
                        _buildSocialIcon("assets/svg/lb1.svg"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            20.vSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SvgPicture.asset(
        assetPath,
        height: ScreenService.isTablet ? 26 : 24,
        width: ScreenService.isTablet ? 26 : 24,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }

  Widget _buildCard({required String title, required List<String> bulletPoints}) {
    return Container(
      width: ScreenService.isTablet ? 310 : 300, // Fixed width for each card
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: ScreenService.isTablet ? 30 : 20),
      decoration: BoxDecoration(
        color: Color(0xff212121), // Background color
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color.fromARGB(255, 123, 120, 120).withOpacity(0.2)), // Border effect
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30.h,
            width: ScreenService.isTablet ? 25.w : 30.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/svg/web.svg",
                height: ScreenService.isTablet ? 20 : 10,
                width: ScreenService.isTablet ? 20 : 10,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xffFAFAFA),
            ),
          ),
          const SizedBox(height: 12),
          ...bulletPoints.map((point) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "• ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xffEBEBEB),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Color(0xffEBEBEB),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildCard2({required String title, required List<String> bulletPoints, required String icon}) {
    return Container(
      width: 250, // Fixed width for each card
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      decoration: BoxDecoration(
        color: Color(0xff212121), // Background color
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Color(0xff505050)), // Border effect
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30.h,
            width: ScreenService.isTablet ? 25.w : 30.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                height: 20,
                width: 20,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xffFAFAFA),
            ),
          ),
          const SizedBox(height: 12),
          ...bulletPoints.map((point) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "• ",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xffEBEBEB),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point,
                        style: GoogleFonts.poppins(
                          fontSize: ScreenService.isTablet ? 12 : 10,
                          color: Color(0xffEBEBEB),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildCard3({required String title, required List<String> bulletPoints, String? svg}) {
    return Container(
      width: 300,
      padding: const EdgeInsets.only(left: 10, right: 20, top: 8, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xffEBEBEB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                svg!,
                height: 55.h,
                width: 55.w,
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: const Icon(Icons.arrow_outward, color: Colors.white, size: 16),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  "Supporter",
                  style: GoogleFonts.poppins(
                    fontSize: ScreenService.isTablet ? 18 : 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFAFAFA),
                  ),
                ),
              ),
              Text(
                "€25",
                style: GoogleFonts.poppins(
                  fontSize: ScreenService.isTablet ? 18 : 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffFAFAFA),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...bulletPoints.map((point) => Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "• ",
                      style: GoogleFonts.poppins(
                        fontSize: ScreenService.isTablet ? 14 : 12,
                        color: Color(0xffEBEBEB),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Personalized Thank You Email from the Ucrypted team.",
                        style: GoogleFonts.poppins(
                          fontSize: ScreenService.isTablet ? 14 : 12,
                          color: Color(0xffEBEBEB),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
