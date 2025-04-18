import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/gradient_text.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/p2pbg.png",
      fit: BoxFit.cover,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
              20.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 45.h,
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
              20.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Chats",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
              10.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    RoutingService.push(const OneToOneChat());
                  },
                  child: Column(
                    children: [
                      chatTile("Jhon Doe", "Order Message ( Seller received payment.", "Just now"),
                      10.vSpace,
                      chatTile("Chris", "Order Message ( Seller received payment.", "25 min Ago"),
                      10.vSpace,
                      chatTile("Williams", "Order Message ( Seller received payment.", "5h ago"),
                      10.vSpace,
                      chatTile("Alex", "Order Message ( Seller received payment.", "Yesterday"),
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

  Widget chatTile(String titile, String msg, String timeAgo) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                radius: 17.r,
                backgroundImage: AssetImage("assets/images/person.png"),
              ),
              16.hSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titile,
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    msg,
                    style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GradientText(
              timeAgo,
              gradient: LinearGradient(colors: [
                Color(0xffCCCCCC),
                Color(0xff666666),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: 10, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}

class OneToOneChat extends StatefulWidget {
  const OneToOneChat({super.key});

  @override
  State<OneToOneChat> createState() => _OneToOneChatState();
}

class _OneToOneChatState extends State<OneToOneChat> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.vSpace,
              Row(
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
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: AppColors.disableBtnColor,
                        radius: 18,
                        backgroundImage: AssetImage("assets/images/person.png"),
                      ),
                      10.hSpace,
                      Text(
                        "Jhon Doe",
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1, // 1 part
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset("assets/svg/inof.svg"),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  height: 1.0,
                  color: Color(0xff212121),
                ),
              ),
              20.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _buildBorderedBox(
                  title: 'You have a buy order awaiting your payment',
                  subtitle: 'You have a buy order awaiting your payment',
                  buttonText: 'Pay now',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage("assets/images/person.png"),
                  ),
                  7.hSpace,
                  Text("Trader-Name",
                      style: GoogleFonts.poppins(
                        color: Color(0xff8E8E8E),
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      )),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 30),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF212121),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("No third-party payments are accepted. ",
                          style: GoogleFonts.poppins(
                            color: Color(0xff8E8E8E),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          )),
                      10.vSpace,
                      Divider(
                        height: 1.0,
                        color: Color(0xff282828),
                      ),
                      10.vSpace,
                      Text("This is an automated message",
                          style: GoogleFonts.poppins(
                            color: Color(0xff8E8E8E),
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          )),
                    ],
                  ),
                ),
              ),
              10.vSpace,
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 25),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFF212121),
                      ),
                      child: Row(
                        children: [
                          Text("No third-party payments are accepted. ",
                              style: GoogleFonts.poppins(
                                color: Color(0xff8E8E8E),
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              )),
                          SizedBox(height: 15.h, width: 15.w, child: SvgPicture.asset("assets/svg/double.svg"))
                        ],
                      ),
                    ),
                    10.hSpace,
                    Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: const Color(0xFF212121),
                      ),
                      child: Center(
                        child: Text("S",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              10.vSpace,
              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage("assets/images/person.png"),
                  ),
                  7.hSpace,
                  Text("Trader-Name",
                      style: GoogleFonts.poppins(
                        color: Color(0xff8E8E8E),
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      )),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 30),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF212121),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("uiux.shah”gmail.com",
                          style: GoogleFonts.poppins(
                            color: Color(0xff8E8E8E),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          )),
                      10.vSpace,
                      Text("Paypal Acount send payment here.",
                          style: GoogleFonts.poppins(
                            color: Color(0xff8E8E8E),
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          )),
                    ],
                  ),
                ),
              ),
              10.vSpace,
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFF212121),
                      ),
                      child: Row(
                        children: [
                          Text("ok ",
                              style: GoogleFonts.poppins(
                                color: Color(0xff8E8E8E),
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              )),
                          SizedBox(height: 15.h, width: 15.w, child: SvgPicture.asset("assets/svg/double.svg"))
                        ],
                      ),
                    ),
                    10.hSpace,
                    Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: const Color(0xFF212121),
                      ),
                      child: Center(
                        child: Text("S",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              10.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _buildBorderedBox(
                  title: 'Order paid. Pending confirmation from the seller.',
                  subtitle: 'You should receive the crypto within 01:27.',
                  buttonText: 'view details',
                ),
              ),
              10.vSpace,
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFF212121),
                      ),
                      child: Row(
                        children: [
                          Text("ok ",
                              style: GoogleFonts.poppins(
                                color: Color(0xff8E8E8E),
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              )),
                          SizedBox(height: 15.h, width: 15.w, child: SvgPicture.asset("assets/svg/double.svg"))
                        ],
                      ),
                    ),
                    10.hSpace,
                    Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: const Color(0xFF212121),
                      ),
                      child: Center(
                        child: Text("S",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _buildBorderedBox(
                  title: 'Seller received payment. Order is complete.',
                  subtitle: 'the assets are now in your funding account.',
                  buttonText: 'view Assets',
                ),
              ),
              20.vSpace
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBorderedBox({required String title, required String subtitle, required String buttonText}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: GradientBoxBorder(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFCA509), Color(0xFF880306)],
          ),
          width: 0.9,
        ),
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF212121),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.poppins(
                color: Color(0xffFAFAFA),
                fontWeight: FontWeight.w400,
                fontSize: 12,
              )),
          const SizedBox(height: 4),
          Text(subtitle,
              style: GoogleFonts.poppins(
                color: Color(0xff8E8E8E),
                fontWeight: FontWeight.w400,
                fontSize: 10,
              )),
          10.vSpace,
          Divider(
            height: 1.0,
            color: Color(0xff282828),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(buttonText,
                  style: GoogleFonts.poppins(
                    color: Color(0xffFAFAFA),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  )),
              const SizedBox(width: 4),
              const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.white)
            ],
          )
        ],
      ),
    );
  }

  Widget _chatMessage(String text, {required bool isSender, bool isAuto = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isSender)
            const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/person.png'), // Placeholder
            ),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  if (isAuto)
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        "This is an automated message",
                        style: TextStyle(fontSize: 11, color: Colors.grey, height: 1.3),
                      ),
                    )
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (isSender)
            Column(
              children: const [
                Icon(Icons.done_all, color: Colors.blueAccent, size: 16),
                SizedBox(height: 4),
                Text(
                  "S",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            )
        ],
      ),
    );
  }

  Widget _normalMessageWithDoubleTick() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1F1F1F),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: const Text(
              'No third-party payments are accepted.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 6),
        const Icon(Icons.done_all, color: Colors.blue, size: 20),
        const SizedBox(width: 6),
        _userBubble("S"),
      ],
    );
  }

  Widget _emailMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _traderNameRow(),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1F1F1F),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'uiux.shah”gmail.com',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 4),
              Text(
                'Paypal Acount send payment here.',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1F1F1F),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: const Text("ok", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 6),
            _userBubble("S"),
          ],
        )
      ],
    );
  }

  Widget _traderNameRow() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/avatar.png'), // replace with real asset
          radius: 16,
        ),
        const SizedBox(width: 8),
        const Text(
          "Trader-name",
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }

  Widget _userBubble(String letter) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        letter,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _chatMessageWithAutomatedLabel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _traderNameRow(),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1F1F1F),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'No third-party payments are accepted.',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 6),
              Container(
                width: double.infinity,
                height: 2,
                color: Colors.blue,
              ),
              const SizedBox(height: 6),
              Text(
                'This is an automated message',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
