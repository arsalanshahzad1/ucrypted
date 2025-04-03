import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ucrypted_app/screens/login_screen.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';
import 'package:ucrypted_app/utilities/routing_service.dart';
import 'package:ucrypted_app/utilities/scaffold_background.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'image': 'assets/images/onboarding1.png',
      'text': 'Empower Finances with Crypto',
      'textPosition': 'below',
    },
    {
      'image': 'assets/images/onboarding2.png',
      'text': 'Your Gateway to the Crypto World',
      'textPosition': 'before',
    },
    {
      'image': 'assets/images/onboarding3.png',
      'text': 'Start Your Crypto Journey Here',
      'textPosition': 'below',
    },
  ];

  void _nextPage() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      RoutingService.pushAndRemoveUntil(const LoginScreen());
    }
  }

  void _skip() {
    RoutingService.pushAndRemoveUntil(const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (page['textPosition'] == 'before')
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              page['text'],
                              style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 32),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        Image.asset(
                          page['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        if (page['textPosition'] == 'below')
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              page['text'],
                              style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 32),
                              textAlign: TextAlign.start,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 75,
            left: 35,
            child: Row(
              children: List.generate(
                _pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: _currentIndex == index ? 25 : 10,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? const Color(0xFFDDDCFE) : AppColors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 30,
            child: GestureDetector(
              onTap: _skip,
              child: Container(
                height: 45.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: AppColors.disableBtnColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                    "Skip",
                    style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: GestureDetector(
              onTap: _nextPage,
              child: Container(
                height: 45.h,
                width: 150.w,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                    _currentIndex == _pages.length - 1 ? "Finish" : "Next",
                    style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
