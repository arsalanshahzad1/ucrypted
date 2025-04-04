import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/deposit_crypto_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/gradient_text.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class DiscoverP2PScreen extends StatefulWidget {
  const DiscoverP2PScreen({super.key});

  @override
  State<DiscoverP2PScreen> createState() => _DiscoverP2PScreenState();
}

class _DiscoverP2PScreenState extends State<DiscoverP2PScreen> with SingleTickerProviderStateMixin {
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

  late TabController _tabController;
  int selectedIndex = 0;

  final List<String> labels = ["Express", "P2P", "Block Trade", "Cash"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(labels.length, (index) {
                        String text = labels[index];

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 0),
                                child: selectedIndex == index
                                    ? GradientText(
                                        text,
                                        gradient: const LinearGradient(
                                          colors: [Color(0xffFCA509), Color(0xff880306)],
                                        ),
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    : GradientText(
                                        text,
                                        gradient: const LinearGradient(
                                          colors: [Color(0xffCCCCCC), Color(0xff666666)],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final textPainter = TextPainter(
                                    text: TextSpan(
                                      text: text,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    maxLines: 1,
                                    textDirection: TextDirection.ltr,
                                  )..layout();

                                  return Container(
                                    width: textPainter.width, // Dynamic width
                                    height: 2,
                                    // margin: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                      gradient: selectedIndex == index
                                          ? const LinearGradient(
                                              colors: [Color(0xffFCA509), Color(0xff880306)],
                                            )
                                          : null,
                                      color: selectedIndex == index ? null : const Color(0xff666666),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    5.hSpace,
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset("assets/svg/inof.svg"),
                      ],
                    )),
                  ],
                ),
                40.vSpace,
                Visibility(
                    visible: selectedIndex == 0,
                    child: Column(
                      children: [
                        Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: Color(0xff222223),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            isScrollable: false,
                            dividerColor: Colors.transparent,
                            controller: _tabController,
                            indicator: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.white,
                            labelStyle: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14),
                            tabs: const [
                              Tab(text: "Buy"),
                              Tab(text: "Sell"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              convertAndLinkWidget(),
                              convertAndLinkWidget(),
                            ],
                          ),
                        ),
                      ],
                    )),
                // Visibility(child: Column(
                //   children: [
                //     Text(),
                //   ],
                // ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget convertAndLinkWidget() {
    return Column(
      children: [
        50.vSpace,
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 110.h,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: RadialGradient(
                      center: Alignment.bottomRight,
                      radius: 1.0,
                      colors: [
                        Colors.green.withOpacity(0.2),
                        Colors.transparent,
                      ],
                      stops: const [0.2, 1.0],
                    ),
                  ),
                  child: Column(
                    children: [
                      10.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your Pay",
                            style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ],
                      ),
                      10.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue,
                                backgroundImage: AssetImage("assets/images/dol.png"),
                              ),
                              10.hSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "DOLLAR",
                                        style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 22, color: Colors.white),
                                      ),
                                      // 10.hSpace,
                                      GestureDetector(
                                        onTap: () {
                                          RoutingService.push(const DepositCryptoscreen());
                                        },
                                        child: const Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "0\$",
                                style: GoogleFonts.poppins(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                15.vSpace,
                Container(
                  height: 110.h,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: RadialGradient(
                      center: Alignment.topLeft,
                      radius: 1.0,
                      colors: [
                        Colors.blue.withOpacity(0.2),
                        Colors.transparent,
                      ],
                      stops: const [0.2, 1.0],
                    ),
                  ),
                  child: Column(
                    children: [
                      20.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You Receive",
                            style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ],
                      ),
                      10.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue.withOpacity(.6),
                                backgroundImage: AssetImage("assets/images/dol1.png"),
                              ),
                              10.hSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "USDC",
                                        style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 22, color: Colors.white),
                                      ),
                                      // 10.hSpace,
                                      GestureDetector(
                                        onTap: () {
                                          RoutingService.push(const DepositCryptoscreen());
                                        },
                                        child: Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "0\$",
                                style: GoogleFonts.poppins(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 95.h,
              child: Center(
                  child: SvgPicture.asset(
                "assets/svg/convert.svg",
                height: 48.h,
                width: 48.w,
              )),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(15), border: Border.all(color: Color(0xff393737))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Buy USDC",
                    style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Text(
                        "USDC",
                        style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                      10.hSpace,
                      SvgPicture.asset("assets/svg/con.svg")
                    ],
                  ),
                ],
              ),
              5.vSpace,
              Divider(
                height: 1.0,
                color: Color(0xff393737),
              ),
              15.vSpace,
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Unit price 291.50",
                            style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: 11),
                          ),
                          10.vSpace,
                          Text(
                            "Quantity 5.14 USDT",
                            style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: 11),
                          ),
                        ],
                      ),
                      Text(
                        "03/01/2025, 19:53",
                        style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
              10.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saqib Trander",
                    style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: 11),
                  ),
                  Row(
                    children: [
                      GradientText(
                        "Completed",
                        style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14),
                        gradient: LinearGradient(colors: [
                          Color(0xffFCA509),
                          Color(0xff880306),
                        ]),
                      ),
                      5.hSpace,
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                        color: Color(0xff7E8088),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        40.vSpace,
        GestureDetector(
          onTap: () {
            RoutingService.push(const P2PConfirmScreen());
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color.fromARGB(255, 28, 28, 29), Color.fromARGB(255, 53, 50, 50)]),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Center(
              child: Text(
                "Select payment method",
                style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRow(String title, String value, IconData? trailingIcon, bool i) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.inter(color: Color(0xff7E8088), fontSize: 14, fontWeight: FontWeight.w400),
            ),
            4.hSpace,
            !i ? const Icon(Icons.help_outline, color: Colors.grey, size: 14) : SizedBox.shrink(),
          ],
        ),
        Row(
          children: [
            Text(
              value,
              style: GoogleFonts.inter(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
            ),
            if (trailingIcon != null) ...[
              6.hSpace,
              Icon(trailingIcon, color: Colors.grey, size: 12),
            ],
          ],
        ),
      ],
    );
  }
}

class P2PConfirmScreen extends StatefulWidget {
  const P2PConfirmScreen({super.key});

  @override
  State<P2PConfirmScreen> createState() => _P2PConfirmScreenState();
}

class _P2PConfirmScreenState extends State<P2PConfirmScreen> {
  int selectedIndex = 0;
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
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                      ),
                    ),
                    Row(
                      children: [
                        GradientText("Express",
                            gradient: const LinearGradient(colors: [
                              Color(0xffFCA509),
                              Color(0xff880306),
                            ]),
                            style: GoogleFonts.inter(
                                color: Colors.white, decoration: TextDecoration.underline, decorationColor: const Color.fromARGB(186, 255, 153, 0), fontSize: 14)),
                        8.hSpace,
                        GradientText("P2P",
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xffCCCCCC),
                                Color(0xff666666),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            style: GoogleFonts.inter(
                                color: Colors.white, decoration: TextDecoration.underline, decorationColor: const Color.fromARGB(186, 255, 153, 0), fontSize: 14)),
                        8.hSpace,
                        GradientText("Block Trade",
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xffCCCCCC),
                                Color(0xff666666),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            style: GoogleFonts.inter(
                                color: Colors.white, decoration: TextDecoration.underline, decorationColor: const Color.fromARGB(186, 255, 153, 0), fontSize: 14)),
                        8.hSpace,
                        GradientText("Cash",
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xffCCCCCC),
                                Color(0xff666666),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            style: GoogleFonts.inter(
                                color: Colors.white, decoration: TextDecoration.underline, decorationColor: const Color.fromARGB(186, 255, 153, 0), fontSize: 14)),
                      ],
                    ),
                    5.hSpace,
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset("assets/svg/inof.svg"),
                      ],
                    )),
                  ],
                ),
                5.vSpace,
                _buildToggleContainer(),
                // _buildCustomUnderline(),
                const SizedBox(height: 20),
                if (selectedIndex == 0) ...[
                  Column(
                    children: [customWidget("Completed"), 10.vSpace, customWidget("Completed"), 10.vSpace, customWidget("Completed")],
                  ),
                ],
                if (selectedIndex == 1) ...[
                  Column(
                    children: [
                      customWidget("Pending"),
                      10.vSpace,
                      customWidget("Pending"),
                    ],
                  ),
                ],
                if (selectedIndex == 2) ...[
                  Column(
                    children: [customWidget("Canceled")],
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(3, (index) {
        String text = index == 0
            ? "Completed"
            : index == 1
                ? "Pending"
                : "Canceled";

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: selectedIndex == index
                    ? GradientText(
                        text,
                        gradient: const LinearGradient(
                          colors: [Color(0xffFCA509), Color(0xff880306)],
                        ),
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : GradientText(
                        text,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xffCCCCCC),
                            Color(0xff666666),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff666666),
                        ),
                      ),
              ),
              // Dynamic underline width
              LayoutBuilder(
                builder: (context, constraints) {
                  final textPainter = TextPainter(
                    text: TextSpan(
                      text: text,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    maxLines: 1,
                    textDirection: TextDirection.ltr,
                  )..layout();

                  return Container(
                    width: textPainter.width, // Dynamic width based on text
                    height: 2,
                    margin: const EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      gradient: selectedIndex == index
                          ? const LinearGradient(
                              colors: [Color(0xffFCA509), Color(0xff880306)],
                            )
                          : null,
                      color: selectedIndex == index ? null : const Color(0xff666666),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildCustomUnderline() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Stack(
        children: [
          // Grey inactive underlines
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: 50,
                height: 2,
                color: const Color(0xff666666),
              );
            }),
          ),
          // Animated active underline
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: selectedIndex * 80.0, // Moves underline based on selection
            child: Container(
              width: 50,
              height: 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xffFCA509), Color(0xff880306)]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customWidget(String status) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(15), border: Border.all(color: Color(0xff393737))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Buy USDC",
                style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
              ),
              Row(
                children: [
                  Text(
                    "USDC",
                    style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  10.hSpace,
                  SvgPicture.asset("assets/svg/con.svg")
                ],
              ),
            ],
          ),
          5.vSpace,
          Divider(
            height: 1.0,
            color: Color(0xff393737),
          ),
          15.vSpace,
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Unit price 291.50",
                        style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: 11),
                      ),
                      10.vSpace,
                      Text(
                        "Quantity 5.14 USDT",
                        style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: 11),
                      ),
                    ],
                  ),
                  Text(
                    "03/01/2025, 19:53",
                    style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
          10.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Saqib Trander",
                style: GoogleFonts.inter(color: Color(0xff7E8088), fontWeight: FontWeight.w400, fontSize: 11),
              ),
              Row(
                children: [
                  GradientText(
                    status,
                    style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14),
                    gradient: LinearGradient(colors: [
                      Color(0xffFCA509),
                      Color(0xff880306),
                    ]),
                  ),
                  5.hSpace,
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: Color(0xff7E8088),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
