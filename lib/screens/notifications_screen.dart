import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            50.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                    const Text(
                      "Notifications",
                      style: TextStyle(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 22),
                    )
                  ],
                ),
              ],
            ),
            10.vSpace,
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemBuilder: (context, index) {
                  return notificationTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget notificationTile() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: AppColors.white),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.disableBtnColor,
            radius: 15,
            backgroundImage: AssetImage("assets/images/person.png"),
          ),
          10.hSpace,
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "A new notification has been received",
                style: TextStyle(color: AppColors.white, fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                "Last Wednesday at 9:42 am",
                style: TextStyle(color: AppColors.grey, fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ],
          )
        ],
      ),
    );
  }
}
