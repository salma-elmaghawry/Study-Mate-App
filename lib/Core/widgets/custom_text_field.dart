import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, this.radio, this.hintText, this.prefixIcon});
  double? radio;
  String? hintText;
  Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            blurRadius: 10, // Blur effect
            spreadRadius: 1, // How much it spreads
            offset: Offset(0, 2), // Shadow position (downward)
          ),
        ],
      ),
      child: TextField(
        style: AppTextStyles.poppins14Regular(),
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radio ?? 15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.white,
        ),
      ),
    );
  }
}
