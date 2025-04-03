import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:ucrypted_app/utilities/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final String hintText;
  final Color color;

  const CustomTextField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    required this.hintText,
    this.color = AppColors.disableBtnColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      style: GoogleFonts.inter(color: AppColors.grey),
      obscureText: widget.isPassword ? _isObscured : false,
      focusNode: _focusNode,
      cursorColor: Colors.orange,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.color,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const GradientOutlineInputBorder(
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFCA509), Color(0xFF880306)]), width: 1),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: SvgPicture.asset(
                  "assets/svg/pass.svg",
                  height: 20.h,
                  width: 20.w,
                  colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : null,
        hintText: widget.hintText,
        hintStyle: GoogleFonts.inter(color: Colors.grey),
      ),
    );
  }
}
