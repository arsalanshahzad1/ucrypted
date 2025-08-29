import 'package:pinput/pinput.dart';
import 'package:ucrypted_app/controllers/auth_controller.dart';
import 'package:ucrypted_app/screens/app_imports.dart';
import 'package:ucrypted_app/screens/create_new_pass_screen.dart';
import 'package:ucrypted_app/utilities/screen_service.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ScaffoldWithBackground(
        backgroundImage: "assets/images/bg1.png",
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenService.isTablet ? 30 : 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              color: AppColors.white,
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
                        "Verify One Time Password",
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontSize: ScreenService.isTablet ? 36 : 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      5.vSpace,
                      Text(
                        "Input OTP sent to your account",
                        style: GoogleFonts.inter(
                          color: Color(0xff6C7278),
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenService.isTablet ? 18 : 14,
                        ),
                      ),
                      50.vSpace,
                      Text(
                        "Email",
                        style: GoogleFonts.inter(color: Color(0xffACB5BB), fontSize: ScreenService.isTablet ? 16 : 12, fontWeight: FontWeight.w500),
                      ),
                      10.vSpace,
                      Center(
                        child: Pinput(
                          length: 6,
                          controller: controller.otpTextController,
                          defaultPinTheme: PinTheme(
                            width: 50,
                            height: 55,
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2C2C30),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xff44444A), width: 1),
                            ),
                          ),
                          focusedPinTheme: PinTheme(
                            width: 50,
                            height: 55,
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2C2C30),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xffFCA509), width: 2),
                            ),
                          ),
                          submittedPinTheme: PinTheme(
                            width: 50,
                            height: 55,
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2C2C30),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xffFCA509), width: 1),
                            ),
                          ),
                          onCompleted: (value) {
                            controller.otpCode.value = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Button at the bottom
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    controller.validateOTP();
                  },
                  child: Container(
                    height: ScreenService.isTablet ? 55 : 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFFCA509), Color(0xFF880306)],
                      ),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: controller.isOtpVerifying.value
                        ? Center(
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              "Continue",
                              style: GoogleFonts.inter(
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: ScreenService.isTablet ? 20 : 18,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
