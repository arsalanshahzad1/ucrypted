import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/home_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class UtilityPaymentScreen extends StatefulWidget {
  const UtilityPaymentScreen({super.key});

  @override
  State<UtilityPaymentScreen> createState() => _UtilityPaymentScreenState();
}

class _UtilityPaymentScreenState extends State<UtilityPaymentScreen> {
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
      backgroundImage: "assets/images/background1.png",
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
              Text(
                "Utility Bills",
                style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 28),
              ),
              20.vSpace,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.transparent,
                  border: Border.all(color: Color(0xffB6B6B6)),
                ),
                child: TextField(
                  controller: TextEditingController(),
                  cursorColor: Colors.orange,
                  style: GoogleFonts.inter(
                    color: AppColors.white,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    isDense: true,
                    border: InputBorder.none,
                    // suffixIcon: const Icon(Icons.search, color: AppColors.grey),
                    hintText: "Where do you need internet?",
                    hintStyle: GoogleFonts.inter(color: AppColors.grey, fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              20.vSpace,
              20.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Electricity",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      RoutingService.push(const PayBill());
                    },
                    child: Text(
                      "See all",
                      style: GoogleFonts.poppins(color: Color.fromARGB(139, 250, 250, 250), fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                ],
              ),
              10.vSpace,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CountryCard(
                      onTap: () {},
                      countryName: "National Power",
                      rating: "4.6",
                      cardName: "Electricity Bill",
                      flagAsset: "assets/images/np.png",
                      esimIcon: "assets/svg/esim.svg",
                      baseName: "National Power",
                      c: "assets/svg/ebill.svg",
                    ),
                    20.hSpace,
                    CountryCard(
                      onTap: () {},
                      countryName: "National Power",
                      rating: "4.6",
                      cardName: "Electricity Bill",
                      flagAsset: "assets/images/np.png",
                      esimIcon: "assets/svg/esim.svg",
                      baseName: "National Power",
                      c: "assets/svg/ebill.svg",
                    ),
                  ],
                ),
              ),
              20.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Water",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      // RoutingService.push(const SportsScreen());
                    },
                    child: Text(
                      "See all",
                      style: GoogleFonts.poppins(color: Color.fromARGB(139, 250, 250, 250), fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                ],
              ),
              10.vSpace,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CountryCard(
                      onTap: () {},
                      countryName: "Private Water",
                      rating: "4.6",
                      cardName: "Sports card",
                      flagAsset: "assets/images/np.png",
                      esimIcon: "assets/svg/esim.svg",
                      baseName: "National Power",
                      c: "assets/svg/ebill.svg",
                    ),
                    20.hSpace,
                    CountryCard(
                      onTap: () {},
                      countryName: "Private Water",
                      rating: "4.6",
                      cardName: "Sports card",
                      flagAsset: "assets/images/np.png",
                      esimIcon: "assets/svg/esim.svg",
                      baseName: "National Power",
                      c: "assets/svg/ebill.svg",
                    ),
                  ],
                ),
              ),
              20.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gas",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      // RoutingService.push(const TechScreen());
                    },
                    child: Text(
                      "See all",
                      style: GoogleFonts.poppins(color: Color.fromARGB(139, 250, 250, 250), fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                ],
              ),
              10.vSpace,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CountryCard(
                      onTap: () {},
                      countryName: "Mega Gas",
                      rating: "4.6",
                      cardName: "Electricity Bill",
                      flagAsset: "assets/images/np.png",
                      esimIcon: "assets/svg/esim.svg",
                      baseName: "National Power",
                      c: "assets/svg/gass.svg",
                    ),
                    20.hSpace,
                    CountryCard(
                      onTap: () {},
                      countryName: "Mega Gas",
                      rating: "4.6",
                      cardName: "Electricity Bill",
                      flagAsset: "assets/images/np.png",
                      esimIcon: "assets/svg/esim.svg",
                      baseName: "National Power",
                      c: "assets/svg/gass.svg",
                    ),
                  ],
                ),
              ),
              20.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Internet",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      // RoutingService.push(const TechScreen());
                    },
                    child: Text(
                      "See all",
                      style: GoogleFonts.poppins(color: Color.fromARGB(139, 250, 250, 250), fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                ],
              ),
              10.vSpace,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CountryCard(
                      onTap: () {},
                      countryName: "Internet",
                      rating: "4.6",
                      cardName: "Electricity Bill",
                      flagAsset: "assets/images/np.png",
                      esimIcon: "assets/svg/esim.svg",
                      baseName: "National Power",
                      c: "assets/svg/ebill.svg",
                    ),
                    20.hSpace,
                    CountryCard(
                      onTap: () {},
                      countryName: "Internet",
                      rating: "4.6",
                      cardName: "Electricity Bill",
                      flagAsset: "assets/images/np.png",
                      esimIcon: "assets/svg/esim.svg",
                      baseName: "National Power",
                      c: "assets/svg/ebill.svg",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String icon, String label, Function onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 80.w,
        height: 80.h,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 19, 19, 19),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xff5A5A5A)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final VoidCallback onTap;
  final String countryName;
  final String baseName;
  final String cardName;
  final String rating;
  final String flagAsset;
  final String esimIcon;
  final String c;

  const CountryCard({
    Key? key,
    required this.onTap,
    required this.countryName,
    required this.cardName,
    required this.baseName,
    required this.rating,
    required this.flagAsset,
    required this.esimIcon,
    required this.c,
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
                      SvgPicture.asset(c)
                      // Container(
                      //     height: 30.h,
                      //     width: 100.w,
                      //     padding: EdgeInsets.symmetric(horizontal: 5.w),
                      //     decoration: BoxDecoration(
                      //       gradient: const LinearGradient(
                      //           colors: [
                      //             Color(0x60FCA509),
                      //             Color(0x60880306),
                      //           ],
                      //           begin: Alignment.centerLeft,
                      //           end: Alignment.centerRight,
                      //           stops: [0.0, 2.3]),
                      //       border: const Border(
                      //         left: BorderSide(color: Color.fromARGB(182, 252, 126, 9)),
                      //         top: BorderSide(color: Color.fromARGB(182, 252, 126, 9)),
                      //         bottom: BorderSide(color: Color.fromARGB(182, 252, 126, 9)),
                      //         right: BorderSide.none,
                      //       ),
                      //       borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(24.r),
                      //         bottomLeft: Radius.circular(24.r),
                      //       ),
                      //     ),
                      //     child: Row(
                      //       children: [
                      //         SvgPicture.asset(
                      //           esimIcon,
                      //           width: 20.w,
                      //           height: 20.h,
                      //         ),
                      //         SizedBox(width: 10.w),
                      //         Expanded(
                      //           // Ensures the text does not overflow the row
                      //           child: Text(
                      //             cardName,
                      //             maxLines: 1, // Ensures single-line truncation
                      //             overflow: TextOverflow.clip, // Adds "..." if text is too long
                      //             style: GoogleFonts.inter(
                      //               color: Colors.white,
                      //               fontSize: 10,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ))
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
                      baseName,
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

class PayBill extends StatefulWidget {
  const PayBill({super.key});

  @override
  State<PayBill> createState() => _PayBillState();
}

class _PayBillState extends State<PayBill> {
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
                          radius: 22,
                          backgroundImage: AssetImage("assets/images/person.png"),
                        ),
                      ),
                      10.hSpace,
                    ],
                  ),
                ],
              ),
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Pay Bills",
                    style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 28),
                  ),
                ],
              ),
              20.vSpace,
              Row(
                children: [
                  Expanded(
                    // Wraps TextField to provide bounded width
                    child: Container(
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
                          hintText: "Where do you need internet?",
                          hintStyle: GoogleFonts.inter(color: AppColors.grey, fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              20.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Electricity",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      RoutingService.push(const PayBill());
                    },
                    child: Text(
                      "See all",
                      style: GoogleFonts.poppins(color: Color.fromARGB(139, 250, 250, 250), fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                ],
              ),
              20.vSpace,
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
                  return CountryCard(
                    onTap: () {
                      RoutingService.push(const NationalPowerScreen());
                    },
                    countryName: "National Power",
                    rating: "4.6",
                    flagAsset: "assets/images/np.png",
                    esimIcon: "assets/svg/esim.svg",
                    cardName: 'Food Card',
                    baseName: 'National Power',
                    c: "assets/svg/ebill.svg",
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

class NationalPowerScreen extends StatefulWidget {
  const NationalPowerScreen({super.key});

  @override
  State<NationalPowerScreen> createState() => _NationalPowerScreenState();
}

class _NationalPowerScreenState extends State<NationalPowerScreen> {
  String? selectedPaymentMethod;
  int _selectedIndex = 4;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/background1.png",
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
              Text(
                "National Power",
                style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 28),
              ),
              20.vSpace,
              Text("Payment Method", style: GoogleFonts.poppins(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w400)),
              10.vSpace,
              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF212121),
                    border: Border.all(color: Color(0xffCCCCCC)),
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
                        style: GoogleFonts.poppins(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
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
                "Service Selection",
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
              ),
              10.vSpace,
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
              10.vSpace,
              Text(
                "Billing Type",
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
              10.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: 'desmond',
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
              10.vSpace,
              Text(
                "Account Number",
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
              10.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: '0193912312312312341',
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
              10.vSpace,
              10.vSpace,
              Text(
                "Amount",
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
              10.vSpace,
              TextField(
                style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: '\$200.00',
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
              15.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Select an amount between \$20.00 - \$1000.00",
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              40.vSpace,
              GestureDetector(
                onTap: () {
                  RoutingService.push(const NationalPowerSuccessScreen());
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
                      "Pay",
                      style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 16),
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
}

class NationalPowerSuccessScreen extends StatefulWidget {
  const NationalPowerSuccessScreen({super.key});

  @override
  State<NationalPowerSuccessScreen> createState() => _NationalPowerSuccessScreenState();
}

class _NationalPowerSuccessScreenState extends State<NationalPowerSuccessScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/background1.png",
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
                    height: 55.h,
                    width: 55.w,
                    decoration: BoxDecoration(color: Color.fromARGB(32, 87, 140, 26), borderRadius: BorderRadius.circular(55)),
                    child: SizedBox(
                      height: 45.h,
                      width: 45.w,
                      child: SvgPicture.asset(
                        "assets/svg/success1.svg",
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                ],
              ),
              30.vSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.w),
                child: Text(
                  "Thank you for your purchase!",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: GoogleFonts.poppins(
                    color: Color(0xffFAFAFA),
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              70.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xff151515), borderRadius: BorderRadius.circular(12), border: Border.all(color: Color(0xffCCCCCC).withOpacity(0.2))),
                  padding: const EdgeInsets.all(26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                              color: Color(0xff212121),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Utility Payment Details",
                              style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      15.vSpace,
                      _transactionRow("Payment Method", "Wallet"),
                      15.vSpace,
                      _transactionRow("Amount", "\$200.00"),
                      15.vSpace,
                      _transactionRow("Gift Card Code", "ABCD-1234-EFGH-5678"),
                      15.vSpace,
                      _transactionRow("Expiration Date", "12/31/2024"),
                      15.vSpace,
                      _transactionRow("Region", "United States"),
                      15.vSpace,
                      const Divider(color: AppColors.grey),
                      25.vSpace,
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40.h,
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
                                  "Download EGift Card",
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
                          RoutingService.pushAndRemoveUntil(const HomeScreen());
                        },
                        child: Container(
                          height: 40.h,
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
              ),
              50.vSpace,
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
                color: Color(0xffDADADA),
                fontSize: 14,
                fontWeight: FontWeight.w400,
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
