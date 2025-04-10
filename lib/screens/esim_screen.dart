import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/app_print.dart';
import 'package:ucrypted_app/utilities/custom_textfield.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class ESimScreen extends StatefulWidget {
  const ESimScreen({super.key});

  @override
  State<ESimScreen> createState() => _ESimScreenState();
}

class _ESimScreenState extends State<ESimScreen> {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset(
                      "assets/svg/menu-dots.svg",
                      fit: BoxFit.scaleDown,
                    ),
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
                          radius: 15,
                          backgroundImage: AssetImage("assets/images/person.png"),
                        ),
                      ),
                      10.hSpace,
                    ],
                  ),
                ],
              ),
              30.verticalSpace,
              Text(
                "eSIM",
                style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 28),
              ),
              20.vSpace,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.transparent,
                  border: Border.all(color: AppColors.grey),
                ),
                child: TextField(
                  controller: TextEditingController(),
                  cursorColor: Colors.orange,
                  style: GoogleFonts.inter(
                    color: AppColors.white,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    isDense: true,
                    border: InputBorder.none,
                    // suffixIcon: const Icon(Icons.search, color: AppColors.grey),
                    hintText: "Where do you need internet?",
                    hintStyle: GoogleFonts.inter(color: AppColors.grey, fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              20.vSpace,
              Text(
                "Country",
                style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 28),
              ),
              10.vSpace,
              GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 0.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  bool isUSA = index % 2 == 0;
                  return CountryCard(
                    onTap: () {
                      Get.bottomSheet(isScrollControlled: true, bottomSheetContent(600, "\$21.00", "\$23.0120", () {}, context));
                    },
                    countryName: isUSA ? "USA" : "Turkey",
                    rating: "4.6",
                    flagAsset: isUSA ? "assets/images/usaa.png" : "assets/images/turk.png",
                    esimIcon: "assets/svg/esim.svg",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final VoidCallback onTap;
  final String countryName;
  final String rating;
  final String flagAsset;
  final String esimIcon;

  const CountryCard({
    Key? key,
    required this.onTap,
    required this.countryName,
    required this.rating,
    required this.flagAsset,
    required this.esimIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 180.w,
        child: Column(
          children: [
            Container(
              height: 140.h,
              width: 200.w,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12.r),
                  image: const DecorationImage(image: AssetImage("assets/images/re.png"), fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: SvgPicture.asset(
                      "assets/svg/splash-logo.svg",
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/c.svg",
                        height: 30.h,
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SizedBox(width: 10.w),
                      CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage(flagAsset),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        countryName,
                        style: GoogleFonts.inter(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Europe",
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
                    ),
                    Row(
                      children: [
                        Text(
                          rating,
                          style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(width: 2.w),
                        SvgPicture.asset(
                          "assets/svg/star1.svg",
                          height: 14.h,
                          width: 14.w,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  "\$20-1000",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget bottomSheetContent(double height, String title, String subtitle, VoidCallback onTap, BuildContext c) {
  int selectedIndex = 1; // Default selected: "Unlimited"

  final List<String> labels = ["Recommended", "Unlimited", "Fixed"];
  return Container(
    width: double.infinity,
    height: height,
    decoration: const BoxDecoration(
      color: AppColors.disableBtnColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "United States of America",
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Rating 4.6 ",
                    style: GoogleFonts.inter(color: Colors.white),
                  ),
                  SvgPicture.asset(
                    "assets/svg/star1.svg",
                    height: 16,
                    width: 16,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // Get.close(1);
                  showFullWidthDialog(c);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white54),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.mobile_friendly, color: Colors.white, size: 10),
                      const SizedBox(width: 5),
                      Text(
                        "Check compatibility",
                        style: GoogleFonts.inter(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            "Number of Days",
            style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 5),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white54),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Select here", style: GoogleFonts.inter(color: Colors.white, fontSize: 14)),
                const Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "More details on data plan",
                style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
              ),
              const Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
          const SizedBox(height: 10),
          StatefulBuilder(builder: (context, setModalState) {
            return Row(
              children: List.generate(labels.length, (index) {
                bool isSelected = index == selectedIndex;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setModalState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: index < labels.length - 1 ? 5 : 0),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: isSelected
                          ? const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFFCA509), Color(0xFF880306)],
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            )
                          : null,
                      child: Center(
                        child: Text(
                          labels[index],
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              border: const Border(
                top: BorderSide(color: AppColors.grey),
                left: BorderSide(color: AppColors.grey),
                right: BorderSide(color: AppColors.grey),
                bottom: BorderSide.none,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Choose a recommended data only plan", style: GoogleFonts.inter(color: Colors.white, fontSize: 12)),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 75.h,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white54),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("15 Days 2GB", style: GoogleFonts.inter(color: Colors.white, fontSize: 8)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("\$ 50.00", style: GoogleFonts.inter(color: Colors.white, fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 75.h,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          border: GradientBoxBorder(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFFCA509), Color(0xFF880306)],
                            ),
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("15 Days 2GB", style: GoogleFonts.inter(color: Colors.white, fontSize: 8)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("\$ 50.00", style: GoogleFonts.inter(color: Colors.white, fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: AppColors.grey)),
                      child: Row(
                        children: [
                          const Icon(Icons.remove, color: Colors.white),
                          const SizedBox(width: 10),
                          Text("1", style: GoogleFonts.inter(color: Colors.white, fontSize: 18)),
                          const SizedBox(width: 10),
                          const Icon(Icons.add, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total", style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300)),
                    Text("\$20.00", style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                  ],
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    RoutingService.push(const ESimBuyScreen());
                  },
                  child: Container(
                    height: 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Buy Now",
                        style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

void showFullWidthDialog(BuildContext context) {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent, // No default background
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9, // Takes 90% of screen width
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E), // Dark background like the screenshot
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Wrap content properly
          children: [
            // Logo (Replace with your asset)
            SvgPicture.asset("assets/svg/splash-logo.svg", height: 30), // Adjust logo path
            const SizedBox(height: 10),

            // Title
            Text(
              "Check Compatibility",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            SvgPicture.asset("assets/svg/qr.svg"),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Alternatively you can dial *06#. If you have an EID code your phone is eSIM compatible.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(color: AppColors.grey, fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),

            // Buttons
            Column(
              children: [
                _buildGradientButton("I Have Scanned The QR Code", () {
                  Get.back();
                }),
                const SizedBox(height: 10),
                _buildGradientButton("My Device Is Compatible", () {
                  Get.close(2);
                  RoutingService.push(const DeviceCheckerScreen());
                }),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        "Skip This Step",
                        style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.normal),
                      ),
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

void showDeviceDialog(BuildContext context) {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent, // No default background
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9, // Takes 90% of screen width
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/svg/splash-logo.svg", height: 30),
            const SizedBox(height: 20),
            Text(
              "Before you checkout, let’s make sure that your device is eSIM compatible.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Text(
              "Find your device below to see if it is eSIM compatible. If your device is not listed, you will not be able to install an eSIM. Not sure what your device model is? Click here to find out.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
            ),
            10.vSpace,
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.close(0);
                    },
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.transparent, border: Border.all(color: AppColors.white)),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ),
                10.hSpace,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      RoutingService.push(const CompatibleDevicesScreen());
                    },
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFCA509), Color(0xFF880306)],
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Text(
                          "Device Types",
                          style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     _buildGradientButton("", () {
            //       Get.back();
            //     }),
            //     // const SizedBox(height: 10),
            //     _buildGradientButton("Device Types", () {
            //       Get.close(2);
            //       RoutingService.push(const DeviceCheckerScreen());
            //     }),
            //   ],
            // ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildGradientButton(String text, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFCA509), Color(0xFF880306)],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),
    ),
  );
}

class DeviceCheckerScreen extends StatefulWidget {
  const DeviceCheckerScreen({super.key});

  @override
  State<DeviceCheckerScreen> createState() => _DeviceCheckerScreenState();
}

class _DeviceCheckerScreenState extends State<DeviceCheckerScreen> {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset(
                      "assets/svg/menu-dots.svg",
                      fit: BoxFit.scaleDown,
                    ),
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
                          radius: 15,
                          backgroundImage: AssetImage("assets/images/person.png"),
                        ),
                      ),
                      10.hSpace,
                    ],
                  ),
                ],
              ),
              30.verticalSpace,
              const SizedBox(height: 20),

              // Green Check Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: SvgPicture.asset(
                      "assets/svg/success11.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Device Checker",
                    style: GoogleFonts.inter(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Success Message
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Mobile_friendly, Congratulations! Your iPhone Supports ESIM Technology",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Additional Information
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "If your device is network unlocked, you’re all set to install one of our eSIMs on this device.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(color: AppColors.grey, fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(height: 15),

              // Important Notice
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Please note: Certain Apple devices purchased in Asia might not support eSIM. To confirm compatibility, click here.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(color: AppColors.grey, fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(height: 25),

              // Continue With Payment Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: GestureDetector(
                  onTap: () {
                    RoutingService.push(const ESimBuyScreen());
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
                        "Continue With Payment",
                        style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: GestureDetector(
                  onTap: () {
                    RoutingService.push(const CompatibleDevicesScreen());
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
                        "View All Compatible Device",
                        style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Support Contact
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "For any discrepancies or complaints, please contact: support@ucrypted.com. The top-up should reflect in the recipient’s account shortly. If you encounter any issues, feel free to contact our support team.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompatibleDevicesScreen extends StatefulWidget {
  const CompatibleDevicesScreen({super.key});

  @override
  State<CompatibleDevicesScreen> createState() => _CompatibleDevicesScreenState();
}

class _CompatibleDevicesScreenState extends State<CompatibleDevicesScreen> {
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

  final List<String> brands = ["Apple", "Google", "Huawei", "Laptop and Notebook", "Oppo", "Samsung", "Other"];
  String selectedBrand = "Apple";
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset(
                      "assets/svg/menu-dots.svg",
                      fit: BoxFit.scaleDown,
                    ),
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
                          radius: 15,
                          backgroundImage: AssetImage("assets/images/person.png"),
                        ),
                      ),
                      10.hSpace,
                    ],
                  ),
                ],
              ),
              30.verticalSpace,
              Text(
                "eSIM Compatible Devices",
                style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
              ),
              10.vSpace,
              Text(
                "Explore our list of eSIM-compatible devices and enjoy seamless connectivity without the need for a physical SIM card.",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  RoutingService.push(const CompatibleListScreen());
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF212121),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "Apple",
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              10.vSpace,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF212121),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Google",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              10.vSpace,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF212121),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Huawei",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              10.vSpace,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF212121),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Laptop And Notebook",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              10.vSpace,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF212121),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Oppo",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              10.vSpace,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF212121),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Samsung",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              10.vSpace,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF212121),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Samsung",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              10.vSpace,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF212121),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Other",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompatibleListScreen extends StatefulWidget {
  const CompatibleListScreen({super.key});

  @override
  State<CompatibleListScreen> createState() => _CompatibleListScreenState();
}

class _CompatibleListScreenState extends State<CompatibleListScreen> {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset(
                      "assets/svg/menu-dots.svg",
                      fit: BoxFit.scaleDown,
                    ),
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
                          radius: 15,
                          backgroundImage: AssetImage("assets/images/person.png"),
                        ),
                      ),
                      10.hSpace,
                    ],
                  ),
                ],
              ),
              30.verticalSpace,
              Text(
                "eSIM Compatible Devices",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              10.vSpace,
              Text(
                "Explore our list of eSIM-compatible devices and enjoy seamless connectivity without the need for a physical SIM card.",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFCA509), Color(0xFF880306)],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Apple",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              10.vSpace,
              Text(
                "Apple",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "2 months ago, Updated",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                ),
              ),
              10.vSpace,
              Container(
                height: 140.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/ios.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              20.vSpace,
              Text(
                "Important: your phone or device must also be Carrier-Unlocked to use eSIM.",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              10.vSpace,
              Text(
                "List of Apple Devices Compatible With eSIMs:",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              10.vSpace,
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "• iPhone XR\n• iPhone XS\n• iPhone XS Max\n• iPhone 11\n• iPhone 11 Pro\n• iPhone SE 2 (2020)\n• iPhone 12\n• iPhone 12 Mini\n• iPhone 12 Pro\n• iPhone 12 Pro Max\n• iPhone 13\n• iPhone 13 Mini\n• iPhone 13 Pro\n• iPhone 13 Pro Max\n• iPhone SE 3 (2022)\n• iPhone 14\n• iPhone 14 Plus\n• iPhone 14 Pro\n• iPhone 14 Pro Max\n• iPhone 15\n• iPhone 15 Plus\n• iPhone 15 Pro\n• iPhone 15 Pro Max",
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    10.vSpace,
                    Text(
                      "*On iPhone 13, 14, and 15 models, you can have two eSIMs activated at the same time.\n\n* iPhones from mainland China and iPhone devices from Hong Kong and Macao (except for iPhone 13 Mini, iPhone 12 Mini, iPhone SE 2020, and iPhone XS) don’t have eSIM capability.\n\n* iPhone 14, iPhone 14 Plus, iPhone 14 Pro, and iPhone 14 Pro Max are not compatible with physical SIM cards in the USA.",
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    10.vSpace,
                    Text(
                      "iPads with eSIM (only iPads with 4G connectivity):\n\n• iPad Air 5th Gen (model A1822, from 2022)\n• iPad 10th Gen (model A2757, from 2022)\n• iPad 9th Gen (model A2604, from 2021)\n• iPad Mini 6th Gen (model A2568, from 2021)\n• iPad Pro 11” (model A2068, from 2020)\n• iPad Pro 12.9” (model A2069, from 2020)\n• iPad Air (model A2123, from 2019)\n• iPad (model A2198, from 2019)\n• iPad Mini (model A2124, from 2019)",
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    30.vSpace,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ESimBuyScreen extends StatefulWidget {
  const ESimBuyScreen({super.key});

  @override
  State<ESimBuyScreen> createState() => _ESimBuyScreenState();
}

class _ESimBuyScreenState extends State<ESimBuyScreen> {
  @override
  void initState() {
    super.initState();
    // showDeviceDialog(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDeviceDialog(context);
    });
  }

  String? selectedPaymentMethod;
  bool isChecked = false;

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset(
                      "assets/svg/menu-dots.svg",
                      fit: BoxFit.scaleDown,
                    ),
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
                          radius: 15,
                          backgroundImage: AssetImage("assets/images/person.png"),
                        ),
                      ),
                      10.hSpace,
                    ],
                  ),
                ],
              ),
              30.vSpace,
              Text("United States of America", style: GoogleFonts.inter(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w600)),
              20.vSpace,
              Text("Payment Method", style: GoogleFonts.inter(color: AppColors.white, fontSize: 16)),
              10.vSpace,
              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
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
                        "Select Payment Method",
                        style: GoogleFonts.inter(color: Colors.white),
                      ),
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                      items: [
                        "Wallet",
                        "Credit Card",
                      ]
                          .map((method) => DropdownMenuItem(
                                value: method,
                                child: Text(method, style: GoogleFonts.inter(color: Colors.white)),
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
              if (selectedPaymentMethod == "Credit Card") ...[
                20.vSpace,
                Text(
                  "Cardholder Name",
                  style: GoogleFonts.inter(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
                10.vSpace,
                CustomTextField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.name,
                  isPassword: false,
                  hintText: "Enter Cardholder Name",
                ),
                10.vSpace,
                Text(
                  "Expiration Date",
                  style: GoogleFonts.inter(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
                10.vSpace,
                CustomTextField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.datetime,
                  isPassword: false,
                  hintText: "MM/YY",
                ),
                10.vSpace,
                Text(
                  "CVV",
                  style: GoogleFonts.inter(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
                10.vSpace,
                CustomTextField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.number,
                  isPassword: true,
                  hintText: "Enter CVV",
                ),
              ],
              20.vSpace,
              Text(
                "Phone Number",
                style: GoogleFonts.inter(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
              10.vSpace,
              CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.phone,
                isPassword: false,
                hintText: "Enter phone number",
              ),
              10.vSpace,
              Text(
                "Amount",
                style: GoogleFonts.inter(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
              10.vSpace,
              CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
                isPassword: false,
                hintText: "Enter amount",
              ),
              5.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Select an amount between \$20.00 - \$1000.00",
                    style: GoogleFonts.inter(color: Colors.white54, fontSize: 12),
                  ),
                ],
              ),
              15.vSpace,
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: Colors.orange,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "By clicking 'Buy Now', you agree to our Terms and Conditions, including our Cancellation Policy.",
                      style: GoogleFonts.inter(color: AppColors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
              200.vSpace,
              GestureDetector(
                onTap: () {
                  RoutingService.push(const ESimBuySuccessScreen());
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
                      "Next",
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

class ESimBuySuccessScreen extends StatefulWidget {
  const ESimBuySuccessScreen({super.key});

  @override
  State<ESimBuySuccessScreen> createState() => _ESimBuySuccessScreenState();
}

class _ESimBuySuccessScreenState extends State<ESimBuySuccessScreen> {
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
                          radius: 15,
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
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/svg/success1.svg"),
                    ),
                  ),
                ],
              ),
              20.vSpace,
              Text(
                "Your Transactions has been Successfully Proceed!",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              30.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.grey)),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Esim Details",
                              style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      10.vSpace,
                      _transactionRow("Payment Method", "Wallet"),
                      5.vSpace,
                      _transactionRow("Top-up Amount", "\$100.00"),
                      5.vSpace,
                      _transactionRow("Country", "USA"),
                      5.vSpace,
                      _transactionRow("Plan", "5GB(30 Days)"),
                      10.vSpace,
                      const Divider(color: AppColors.grey),
                      20.vSpace,
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
                                  "Download Plan Details",
                                  style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      20.vSpace,
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
                                color: AppColors.white,
                              )),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/svg/email.svg"),
                                10.hSpace,
                                Text(
                                  "Send to email",
                                  style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              30.vSpace,
              Text(
                "For any discrepancies or complaints, please contact: support@ucrypted.com. The top-up should reflect in the recipient's account shortly. If you encounter any issues, feel free to contact our support team.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(color: AppColors.grey, fontWeight: FontWeight.w300, fontSize: 12),
              ),
              10.vSpace,
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
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
