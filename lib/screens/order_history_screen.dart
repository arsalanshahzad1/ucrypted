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

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
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

  final List<TransactionGroup> transactions = [
    TransactionGroup(date: "August 13, 2023", transactions: [
      Transaction(name: "Arlene McCoy", image: "assets/images/i1.png"),
      Transaction(name: "Kathryn Murphy", image: "assets/images/i2.png"),
      Transaction(name: "Albert Flores", image: "assets/images/i3.png"),
    ]),
    TransactionGroup(date: "August 12, 2023", transactions: [
      Transaction(name: "Leslie Alexander", image: "assets/images/i4.png"),
    ]),
    TransactionGroup(date: "August 11, 2023", transactions: [
      Transaction(name: "Cody Fisher", image: "assets/images/i5.png"),
      Transaction(name: "Jerome Bell", image: "assets/images/i6.png"),
      Transaction(name: "Marvin McKinney", image: "assets/images/i7.png"),
      Transaction(name: "Robert Fox", image: "assets/images/i8.png"),
      Transaction(name: "Floyd Miles", image: "assets/images/i9.png"),
    ]),
  ];
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
                children: [
                  const Icon(Icons.arrow_back_ios, color: Colors.white, size: 23),
                  5.hSpace,
                  Expanded(
                    child: Text(
                      "Order History",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ],
              ),
              20.vSpace,

              /// Transaction List
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: transactions.map((group) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.date,
                        style: GoogleFonts.poppins(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      10.vSpace,
                      Column(
                        children: group.transactions.map((transaction) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(transaction.image),
                                  radius: 24,
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(transaction.name, style: GoogleFonts.inter(color: Color(0xff747474), fontSize: 14, fontWeight: FontWeight.w600)),
                                      SizedBox(height: 2),
                                      Text("Today, 12:30AM", style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                                Text("+\$520.00", style: GoogleFonts.poppins(color: Color(0xff388DEB), fontSize: 12, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      20.vSpace,
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(transaction.image),
            radius: 24,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.name, style: TextStyle(color: Colors.white, fontSize: 16)),
                SizedBox(height: 2),
                Text("Today, 12:30AM", style: TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
          ),
          Text("+\$520.00", style: TextStyle(color: Colors.blueAccent, fontSize: 14)),
        ],
      ),
    );
  }
}

class TransactionGroup {
  final String date;
  final List<Transaction> transactions;

  TransactionGroup({required this.date, required this.transactions});
}

class Transaction {
  final String name;
  final String image;

  Transaction({required this.name, required this.image});
}
