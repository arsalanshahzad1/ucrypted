import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
      child: Column(
        children: [
          50.vSpace,
          Padding(
            padding: EdgeInsets.only(left: 10.h, right: 16.h),
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
                        RoutingService.push(const AccountScreen());
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColors.disableBtnColor,
                        radius: 22,
                        backgroundImage: AssetImage("assets/images/person.png"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          10.vSpace,
          Padding(
            padding: EdgeInsets.only(left: 10.h, right: 16.h),
            child: Row(
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
                const Text(
                  "Notifications",
                  style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 26),
                )
              ],
            ),
          ),
          10.vSpace,
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return NotificationTile(notification: notification);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(notification.avatar),
                    radius: 18,
                  ),
                  if (notification.isNew)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                        children: [
                          TextSpan(
                            text: "${notification.username} ",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: notification.action,
                          ),
                          TextSpan(
                            text: " ${notification.title}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    if (notification.comment != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "\“${notification.comment}\”",
                          style: TextStyle(color: Colors.grey[400], fontSize: 12),
                        ),
                      ),
                    const SizedBox(height: 5),
                    Text(
                      notification.time,
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NotificationModel {
  final String avatar;
  final String username;
  final String action;
  final String title;
  final String? comment;
  final String time;
  final bool isNew;

  NotificationModel({
    required this.avatar,
    required this.username,
    required this.action,
    required this.title,
    this.comment,
    required this.time,
    this.isNew = false,
  });
}

List<NotificationModel> notifications = [
  NotificationModel(
    avatar: "assets/images/avatar1.png",
    username: "Dennis Nedry",
    action: "commented on",
    title: "IBTC USDT compliance report",
    comment: "Oh, I finished de-bugging the phones, but the system's compiling for eighteen minutes, or twenty...",
    time: "Last Wednesday at 9:42 AM",
    isNew: true,
  ),
  NotificationModel(
    avatar: "assets/images/avatar2.png",
    username: "Dennis Nedry",
    action: "attached a file to",
    title: "Isla Nublar SOC2 compliance report",
    comment: "landing_paage_ver2.fig  2mb",
    time: "Last Wednesday at 9:42 AM",
    isNew: true,
  ),
  NotificationModel(
    avatar: "assets/images/avatar3.png",
    username: "Dennis Nedry",
    action: "commented on",
    title: "Isla Nublar SOC2 compliance report",
    comment: "Oh, I finished de-bugging the phones, but the system's compiling for eighteen minutes, or twenty...",
    time: "Last Wednesday at 9:42 AM",
  ),
  NotificationModel(
    avatar: "assets/images/default.png",
    username: "New Account",
    action: "created",
    title: "",
    time: "Last Wednesday at 9:42 AM",
  ),
];
