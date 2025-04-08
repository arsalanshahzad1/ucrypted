import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/account_screen.dart';
import 'package:ucrypted_app/screens/compaign_screen.dart';
import 'package:ucrypted_app/screens/discover_buy_screen.dart';
import 'package:ucrypted_app/screens/discover_edit_screen.dart';
import 'package:ucrypted_app/screens/discover_express_screen.dart';
import 'package:ucrypted_app/screens/discover_sell_screen.dart';
import 'package:ucrypted_app/screens/discover_send_screen.dart';
import 'package:ucrypted_app/screens/discover_withdraw_screen.dart';
import 'package:ucrypted_app/screens/esim_screen.dart';
import 'package:ucrypted_app/screens/gift_listing_screen.dart';
import 'package:ucrypted_app/screens/gift_redeem_screen.dart';
import 'package:ucrypted_app/screens/mobile_top_up_screen.dart';
import 'package:ucrypted_app/screens/nauta_cuba_topup_screen.dart';
import 'package:ucrypted_app/screens/notifications_screen.dart';
import 'package:ucrypted_app/screens/order_history_screen.dart';
import 'package:ucrypted_app/screens/p_profile_screens.dart';
import 'package:ucrypted_app/screens/tier_screen.dart';
import 'package:ucrypted_app/screens/top_up_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/app_print.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        // forceMaterialTransparency: false,   // Works
        // surfaceTintColor: Colors.transparent,  // Works
        // scrolledUnderElevation: 0.0,   // Works
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              "assets/svg/menu-dots.svg",
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        actions: [
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              15.vSpace,
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      RoutingService.push(const PProfileScreen());
                    },
                    child: Text(
                      "Discover",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: AppColors.white, fontSize: 26),
                    ),
                  ),
                  15.hSpace,
                  Expanded(
                    child: Container(
                      width: 150.w,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF13171A), Color(0xFF2C2C30)],
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                        ),
                        border: Border.all(color: Color(0xff2C2C30)),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/normals.svg",
                            width: 18,
                            height: 18,
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: TextEditingController(),
                              cursorColor: Colors.orange,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                                border: InputBorder.none,
                                hintText: "Search more",
                                hintStyle: GoogleFonts.inter(
                                  color: Color(0xff9C9C9C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              20.vSpace,
              _buildSection("Shortcut", ["Send", "Request", "Withdraw", "Add wallet", "Deposit", "Edit Wallet", "Buy Crypto", "Sell Crypto"]),
              const SizedBox(height: 16),
              _buildSection("Recommended", ["Trade", "P2P", "Gift card", "Esim", "Utility Payment", "Gift Redeem", "Mobile Top-Up", "Nauta Cuba"]),
              const SizedBox(height: 16),
              _buildSection("Others", ["Order History", "Campaign", "Tier Payments"]),
              40.vSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> labels) {
    final Map<String, String> iconMap = {
      "Send": "assets/svg/dsend.svg",
      "Request": "assets/svg/drequest.svg",
      "Withdraw": "assets/svg/dwithdraw.svg",
      "Add wallet": "assets/svg/daddwallet.svg",
      "Deposit": "assets/svg/dsend.svg",
      "Edit Wallet": "assets/svg/dedit.svg",
      "Buy Crypto": "assets/svg/dbuycrypto.svg",
      "Sell Crypto": "assets/svg/dsellcrypto.svg",
      "Trade": "assets/svg/dsend.svg",
      "P2P": "assets/svg/drequest.svg",
      "Gift card": "assets/svg/dwithdraw.svg",
      "Esim": "assets/svg/daddwallet.svg",
      "Utility Payment": "assets/svg/dsend.svg",
      "Gift Redeem": "assets/svg/dsend.svg",
      "Mobile Top-Up": "assets/svg/dedit.svg",
      "Nauta Cuba": "assets/svg/dedit.svg",
      "Order History": "assets/svg/dsend.svg",
      "Campaign": "assets/svg/drequest.svg",
      "Tier Payments": "assets/svg/dsellcrypto.svg",
    };

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF13171A),
            Color.fromARGB(255, 29, 29, 31),
          ],
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Icon(
                  Icons.close,
                  color: Color(0xffACB5BB),
                  size: 20.sp,
                )
              ],
            ),
          ),
          10.vSpace,
          const Divider(
            height: 1.0,
            color: Color(0xFF44444A),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: labels.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _handleItemTap(labels[index]);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      iconMap[labels[index]] ?? "assets/images/chats.png",
                      width: 20,
                      height: 20,
                    ),
                    4.vSpace,
                    Text(
                      labels[index],
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _handleItemTap(String label) {
    switch (label) {
      case "Send":
        RoutingService.push(const DiscoverSendScreen());
        appPrint("Send tapped");
        break;
      case "Request":
        //  RoutingService.push(const SomeScreen);
        appPrint("Request tapped");
        break;
      case "Withdraw":
        RoutingService.push(const DiscoverWithdrawScreen());
        appPrint("Withdraw tapped");
        break;
      case "Add wallet":
        //  RoutingService.push(const SomeScreen);
        appPrint("Add wallet tapped");
        break;
      case "Deposit":
        //  RoutingService.push(const SomeScreen);
        appPrint("Deposit tapped");
        break;
      case "Edit Wallet":
        RoutingService.push(const DiscoverEditScreen());
        appPrint("Edit Wallet tapped");
        break;
      case "Buy Crypto":
        RoutingService.push(const DiscoverBuyScreen());
        appPrint("Buy Crypto tapped");
        break;
      case "Sell Crypto":
        RoutingService.push(const DiscoverSellScreen());
        appPrint("Sell Crypto tapped");
        break;
      case "Trade":
        //  RoutingService.push(const SomeScreen);
        appPrint("Trade tapped");
        break;
      case "P2P":
        RoutingService.push(const DiscoverExpressScreen());
        appPrint("P2P tapped");
        break;
      case "Gift card":
        RoutingService.push(const GiftListingScreen());
        appPrint("Gift card tapped");
        break;
      case "Esim":
        RoutingService.push(const ESimScreen());
        appPrint("Esim tapped");
        break;
      case "Utility Payment":
        RoutingService.push(const MobileTopUpScreen());
        appPrint("Utility Payment tapped");
        break;
      case "Gift Redeem":
        RoutingService.push(const GiftRedeemScreen());
        appPrint("Gift Redeem tapped");
        break;
      case "Mobile Top-Up":
        RoutingService.push(const TopUpScreen());
        appPrint("Mobile Top-Up tapped");
        break;
      case "Nauta Cuba":
        RoutingService.push(const NautaCubaTopUpScreen());
        appPrint("Nauta Cuba tapped");
        break;
      case "Order History":
        RoutingService.push(const OrderHistoryScreen());
        appPrint("Order History tapped");
        break;
      case "Campaign":
        RoutingService.push(const CompaignScreen());
        appPrint("Campaign tapped");
        break;
      case "Tier Payments":
        RoutingService.push(const TierScreen());
        appPrint("Tier Payments tapped");
        break;
      default:
        appPrint("Unknown item tapped");
    }
  }
}
