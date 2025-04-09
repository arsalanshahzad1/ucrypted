import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class BuySellDetailScreen extends StatefulWidget {
  const BuySellDetailScreen({super.key});

  @override
  State<BuySellDetailScreen> createState() => _BuySellDetailScreenState();
}

class _BuySellDetailScreenState extends State<BuySellDetailScreen> {
  int _selectedIndex = 1;

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
      backgroundImage: "assets/images/tradebg.png",
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
              10.vSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 42, 42, 42),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Color(0xff505050)),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(
                    children: [
                      Container(
                        height: 35.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Color(0xff505050)),
                        ),
                        child: Center(
                          child: SvgPicture.asset("assets/svg/io.svg"),
                        ),
                      ),
                      10.hSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "KLV/USDT",
                            style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            "+50.47%",
                            style: GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 12, color: Color(0xff38B781)),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30.h,
                        width: 35.w,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Color(0xff4598D3), border: Border.all(color: Color(0xff505050))),
                        child: Center(
                          child: SvgPicture.asset("assets/svg/e1.svg"),
                        ),
                      ),
                      5.hSpace,
                      Container(
                        height: 30.h,
                        width: 35.w,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: Color(0xff505050))),
                        child: Center(
                          child: SvgPicture.asset("assets/svg/e2.svg"),
                        ),
                      ),
                      5.hSpace,
                      Container(
                        height: 30.h,
                        width: 35.w,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: Color(0xff505050))),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/svg/e3.svg",
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              // 10.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: SizedBox(
                  height: 470.h,
                  width: 355.w,
                  child: FittedBox(
                    fit: BoxFit.fitWidth, // or .scaleDown, .fitWidth etc.
                    child: SvgPicture.asset("assets/svg/buysellgraph.svg"),
                  ),
                ),
              ),
              // 10.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Open orders",
                    style: GoogleFonts.nunito(fontSize: 16, color: Color(0xffF7F7F7), fontWeight: FontWeight.w700),
                  ),
                  SvgPicture.asset("assets/svg/calendar1.svg")
                ],
              ),
              10.vSpace,
              Divider(
                height: 1.0,
                color: Color.fromARGB(153, 86, 86, 81),
              ),
              30.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: [
                        50.vSpace,
                        SizedBox(
                          height: 40.h,
                          width: 40.w,
                          child: SvgPicture.asset("assets/svg/calendar2.svg"),
                        ),
                        15.vSpace,
                        Text(
                          "No order yet",
                          style: GoogleFonts.nunito(fontSize: 14, color: Color(0xff99A6AFCC), fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              100.vSpace,
            ],
          ),
        ),
      ),
    );
  }
}
