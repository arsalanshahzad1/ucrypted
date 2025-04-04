import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/esim_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class GiftListingScreen extends StatefulWidget {
  const GiftListingScreen({super.key});

  @override
  State<GiftListingScreen> createState() => _GiftListingScreenState();
}

class _GiftListingScreenState extends State<GiftListingScreen> {
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
              Text(
                "Gift Cards",
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryCard("assets/svg/f1.svg", "Food", () {
                      RoutingService.push(const FoodScreen());
                    }),
                    _buildCategoryCard("assets/svg/f2.svg", "Travel", () {
                      RoutingService.push(const TravelScreen());
                    }),
                    _buildCategoryCard("assets/svg/f3.svg", "Tech", () {
                      RoutingService.push(const TechScreen());
                    }),
                    _buildCategoryCard("assets/svg/f4.svg", "Sports", () {
                      RoutingService.push(const SportsScreen());
                    }),
                    _buildCategoryCard("assets/svg/f5.svg", "Social", () {
                      RoutingService.push(const SocialScreen());
                    }),
                    _buildCategoryCard("assets/svg/f1.svg", "Streaming", () {
                      RoutingService.push(const StreamScreen());
                    }),
                    //These two are in screens
                    _buildCategoryCard("assets/svg/f1.svg", "Gaming", () {
                      RoutingService.push(const GamingScreen());
                    }),
                    _buildCategoryCard("assets/svg/f1.svg", "Shoppping", () {
                      RoutingService.push(const ShoppingScreen());
                    }),
                  ],
                ),
              ),
              20.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Food",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      RoutingService.push(const FoodScreen());
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
                      countryName: "Food Panda",
                      rating: "4.6",
                      cardName: "Electricity Bill",
                      flagAsset: "assets/images/foodpanda.png",
                      esimIcon: "assets/svg/esim.svg",
                      baseName: "Food Panda",
                    ),
                    20.hSpace,
                    CountryCard(
                      onTap: () {},
                      countryName: "Food Panda",
                      rating: "4.6",
                      cardName: "Electricity Bill",
                      flagAsset: "assets/images/foodpanda.png",
                      esimIcon: "assets/svg/esim.svg",
                      baseName: "Food Panda",
                    ),
                  ],
                ),
              ),
              20.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sports",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      RoutingService.push(const SportsScreen());
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
                      flagAsset: "assets/images/ad.png",
                      esimIcon: "assets/svg/esim.svg",
                      baseName: "Adidas",
                    ),
                    20.hSpace,
                    CountryCard(
                      onTap: () {},
                      countryName: "Adidas",
                      rating: "4.6",
                      cardName: "Sports card",
                      flagAsset: "assets/images/ad.png",
                      esimIcon: "assets/svg/esim.svg",
                      baseName: "Adidas",
                    ),
                  ],
                ),
              ),
              20.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tech",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      RoutingService.push(const TechScreen());
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
                      countryName: "Nord Vpn",
                      rating: "4.6",
                      cardName: "Electricity Bill",
                      flagAsset: "assets/images/nord.png",
                      esimIcon: "assets/svg/esim.svg",
                      baseName: "Nord Vpn",
                    ),
                    20.hSpace,
                    CountryCard(
                      onTap: () {},
                      countryName: "Nord Vpn",
                      rating: "4.6",
                      cardName: "Electricity Bill",
                      flagAsset: "assets/images/nord.png",
                      esimIcon: "assets/svg/esim.svg",
                      baseName: "App Store and iTunes",
                    ),
                  ],
                ),
              ),
              30.vSpace,
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

  const CountryCard({
    Key? key,
    required this.onTap,
    required this.countryName,
    required this.cardName,
    required this.baseName,
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
                      Container(
                          height: 30.h,
                          width: 100.w,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0x60FCA509),
                                  Color(0x60880306),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [0.0, 2.3]),
                            border: const Border(
                              left: BorderSide(color: Color.fromARGB(182, 252, 126, 9)),
                              top: BorderSide(color: Color.fromARGB(182, 252, 126, 9)),
                              bottom: BorderSide(color: Color.fromARGB(182, 252, 126, 9)),
                              right: BorderSide.none,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.r),
                              bottomLeft: Radius.circular(24.r),
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                esimIcon,
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                // Ensures the text does not overflow the row
                                child: Text(
                                  cardName,
                                  maxLines: 1, // Ensures single-line truncation
                                  overflow: TextOverflow.clip, // Adds "..." if text is too long
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ))
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

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Food Card",
                    style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 28),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 16),
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
                  Container(
                    width: 55.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent, // Transparent background
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5), // Light grayish-white border
                        width: 1.5, // Matches thin border in UI
                      ),
                      borderRadius: BorderRadius.circular(12.r), // Rounded corners
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg/filter.svg", // Ensure correct path
                        width: 20.w, // Adjust icon size based on UI
                        height: 20.h,
                        colorFilter: const ColorFilter.mode(
                          Colors.white, // Ensure icon is white
                          BlendMode.srcIn,
                        ),
                      ),
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
                      // Get.bottomSheet(isScrollControlled: true, bottomSheetContent(600, "\$21.00", "\$23.0120", () {}, context));
                    },
                    countryName: "Food Panda",
                    rating: "4.6",
                    flagAsset: "assets/images/foodpanda.png",
                    esimIcon: "assets/svg/esim.svg",
                    cardName: 'Food Card',
                    baseName: 'Food Panda',
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

class TravelScreen extends StatefulWidget {
  const TravelScreen({super.key});

  @override
  State<TravelScreen> createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Travel Card",
                    style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 28),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 16),
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
                  Container(
                    width: 55.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent, // Transparent background
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5), // Light grayish-white border
                        width: 1.5, // Matches thin border in UI
                      ),
                      borderRadius: BorderRadius.circular(12.r), // Rounded corners
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg/filter.svg", // Ensure correct path
                        width: 20.w, // Adjust icon size based on UI
                        height: 20.h,
                        colorFilter: const ColorFilter.mode(
                          Colors.white, // Ensure icon is white
                          BlendMode.srcIn,
                        ),
                      ),
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
                      // Get.bottomSheet(isScrollControlled: true, bottomSheetContent(600, "\$21.00", "\$23.0120", () {}, context));
                    },
                    countryName: "National Power",
                    rating: "4.6",
                    flagAsset: "assets/images/power.png",
                    esimIcon: "assets/svg/esim.svg",
                    cardName: 'Travel Card',
                    baseName: 'national Power',
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

class TechScreen extends StatefulWidget {
  const TechScreen({super.key});

  @override
  State<TechScreen> createState() => _TechScreenState();
}

class _TechScreenState extends State<TechScreen> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tech Card",
                    style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 28),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 16),
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
                  Container(
                    width: 55.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent, // Transparent background
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5), // Light grayish-white border
                        width: 1.5, // Matches thin border in UI
                      ),
                      borderRadius: BorderRadius.circular(12.r), // Rounded corners
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg/filter.svg", // Ensure correct path
                        width: 20.w, // Adjust icon size based on UI
                        height: 20.h,
                        colorFilter: const ColorFilter.mode(
                          Colors.white, // Ensure icon is white
                          BlendMode.srcIn,
                        ),
                      ),
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
                      // Get.bottomSheet(isScrollControlled: true, bottomSheetContent(600, "\$21.00", "\$23.0120", () {}, context));
                    },
                    countryName: "National Power",
                    rating: "4.6",
                    flagAsset: "assets/images/power.png",
                    esimIcon: "assets/svg/esim.svg",
                    cardName: 'Tech Card',
                    baseName: 'national Power',
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

class SportsScreen extends StatefulWidget {
  const SportsScreen({super.key});

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sports Card",
                    style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 28),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 16),
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
                  Container(
                    width: 55.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent, // Transparent background
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5), // Light grayish-white border
                        width: 1.5, // Matches thin border in UI
                      ),
                      borderRadius: BorderRadius.circular(12.r), // Rounded corners
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg/filter.svg", // Ensure correct path
                        width: 20.w, // Adjust icon size based on UI
                        height: 20.h,
                        colorFilter: const ColorFilter.mode(
                          Colors.white, // Ensure icon is white
                          BlendMode.srcIn,
                        ),
                      ),
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
                      // Get.bottomSheet(isScrollControlled: true, bottomSheetContent(600, "\$21.00", "\$23.0120", () {}, context));
                    },
                    countryName: "National Power",
                    rating: "4.6",
                    flagAsset: "assets/images/power.png",
                    esimIcon: "assets/svg/esim.svg",
                    cardName: 'Sports Card',
                    baseName: 'national Power',
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

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Social Card",
                    style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 28),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 16),
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
                  Container(
                    width: 55.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent, // Transparent background
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5), // Light grayish-white border
                        width: 1.5, // Matches thin border in UI
                      ),
                      borderRadius: BorderRadius.circular(12.r), // Rounded corners
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg/filter.svg", // Ensure correct path
                        width: 20.w, // Adjust icon size based on UI
                        height: 20.h,
                        colorFilter: const ColorFilter.mode(
                          Colors.white, // Ensure icon is white
                          BlendMode.srcIn,
                        ),
                      ),
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
                      // Get.bottomSheet(isScrollControlled: true, bottomSheetContent(600, "\$21.00", "\$23.0120", () {}, context));
                    },
                    countryName: "National Power",
                    rating: "4.6",
                    flagAsset: "assets/images/power.png",
                    esimIcon: "assets/svg/esim.svg",
                    cardName: 'Social Card',
                    baseName: 'national Power',
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

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Streaming Card",
                    style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 28),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 16),
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
                  Container(
                    width: 55.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent, // Transparent background
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5), // Light grayish-white border
                        width: 1.5, // Matches thin border in UI
                      ),
                      borderRadius: BorderRadius.circular(12.r), // Rounded corners
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg/filter.svg", // Ensure correct path
                        width: 20.w, // Adjust icon size based on UI
                        height: 20.h,
                        colorFilter: const ColorFilter.mode(
                          Colors.white, // Ensure icon is white
                          BlendMode.srcIn,
                        ),
                      ),
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
                      // Get.bottomSheet(isScrollControlled: true, bottomSheetContent(600, "\$21.00", "\$23.0120", () {}, context));
                    },
                    countryName: "National Power",
                    rating: "4.6",
                    flagAsset: "assets/images/power.png",
                    esimIcon: "assets/svg/esim.svg",
                    cardName: 'Streaming Card',
                    baseName: 'national Power',
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

class GamingScreen extends StatefulWidget {
  const GamingScreen({super.key});

  @override
  State<GamingScreen> createState() => _GamingScreenState();
}

class _GamingScreenState extends State<GamingScreen> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gaming Card",
                    style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 28),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 16),
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
                  Container(
                    width: 55.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent, // Transparent background
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5), // Light grayish-white border
                        width: 1.5, // Matches thin border in UI
                      ),
                      borderRadius: BorderRadius.circular(12.r), // Rounded corners
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg/filter.svg", // Ensure correct path
                        width: 20.w, // Adjust icon size based on UI
                        height: 20.h,
                        colorFilter: const ColorFilter.mode(
                          Colors.white, // Ensure icon is white
                          BlendMode.srcIn,
                        ),
                      ),
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
                      // Get.bottomSheet(isScrollControlled: true, bottomSheetContent(600, "\$21.00", "\$23.0120", () {}, context));
                    },
                    countryName: "National Power",
                    rating: "4.6",
                    flagAsset: "assets/images/power.png",
                    esimIcon: "assets/svg/esim.svg",
                    cardName: 'Gaming Card',
                    baseName: 'national Power',
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

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shopping Card",
                    style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 28),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.poppins(color: Color(0xffFAFAFA), fontWeight: FontWeight.w400, fontSize: 16),
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
                  Container(
                    width: 55.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent, // Transparent background
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5), // Light grayish-white border
                        width: 1.5, // Matches thin border in UI
                      ),
                      borderRadius: BorderRadius.circular(12.r), // Rounded corners
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg/filter.svg", // Ensure correct path
                        width: 20.w, // Adjust icon size based on UI
                        height: 20.h,
                        colorFilter: const ColorFilter.mode(
                          Colors.white, // Ensure icon is white
                          BlendMode.srcIn,
                        ),
                      ),
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
                      // Get.bottomSheet(isScrollControlled: true, bottomSheetContent(600, "\$21.00", "\$23.0120", () {}, context));
                    },
                    countryName: "National Power",
                    rating: "4.6",
                    flagAsset: "assets/images/power.png",
                    esimIcon: "assets/svg/esim.svg",
                    cardName: 'Shopping Card',
                    baseName: 'national Power',
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
