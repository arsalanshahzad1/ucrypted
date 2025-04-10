import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/input_rec_success_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/extensions.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class InputRecoveryscreen extends StatefulWidget {
  const InputRecoveryscreen({super.key});

  @override
  State<InputRecoveryscreen> createState() => _InputRecoveryscreenState();
}

class _InputRecoveryscreenState extends State<InputRecoveryscreen> {
  final List<TextEditingController> controllers = List.generate(14, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      backgroundImage: "assets/images/bg1.png",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            50.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xffDCE4E8),
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: SvgPicture.asset(
                    "assets/svg/splash-logo.svg",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            30.vSpace,
            Text(
              "Input Recovery Word",
              style: GoogleFonts.inter(
                color: AppColors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            5.vSpace,
            Text(
              "Enter the secret recovery word that was given previously in the correct order and sequence.",
              style: GoogleFonts.inter(
                color: AppColors.grey,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            50.vSpace,
            Expanded(
              child: GridView.builder(
                itemCount: 14,
                shrinkWrap: true,
                padding: const EdgeInsets.all(0.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3.2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Color.fromARGB(255, 34, 34, 37),
                        border: Border.all(
                          color: index == 0 ? Colors.white : Color(0xff44444A),
                        )),
                    child: TextField(
                      controller: controllers[index],
                      textAlign: TextAlign.center,
                      cursorColor: Colors.orange,
                      style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: index == 0 ? "1. Nebula" : "",
                          hintStyle: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14)),
                    ),
                  );
                },
              ),
            ),
            20.vSpace,
            GestureDetector(
              onTap: () {
                // RoutingService.push(const InputRecoveryscreen());
                Get.bottomSheet(bottomSheetContent(330.h, "Confirm Your Secret Recovery Word ?",
                    "This secret recovery word is crucial for accessing your account and cannot be recovered if lost. Are you sure you’ve entered it correctly ?", () {
                  RoutingService.push(const InputRecoverySuccessScreen());
                }));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 34, 34, 37),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: GoogleFonts.inter(color: Color(0xffACB5BB), fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
              ),
            ),
            10.vSpace,
          ],
        ),
      ),
    );
  }
}

Widget bottomSheetContent(
  double height,
  String title,
  String subtitle,
  VoidCallback onTap,
) {
  return Container(
    width: double.infinity,
    height: height,
    decoration: const BoxDecoration(
      color: Color(0xff1E1E20),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 4,
                width: 80,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xff44444A)),
              )
            ],
          ),
          10.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Image.asset(
                  "assets/images/siren.png",
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          10.vSpace,
          Text(
            title,
            style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 24),
          ),
          10.vSpace,
          Text(
            subtitle,
            style: GoogleFonts.inter(color: Color(0xff6C7278), fontWeight: FontWeight.w500, fontSize: 14),
          ),
          40.vSpace,
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: Color.fromARGB(255, 34, 34, 37),
                        border: Border.all(
                          color: Color(0xff44444A),
                        )),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
              20.hSpace,
              Expanded(
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: GoogleFonts.inter(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
