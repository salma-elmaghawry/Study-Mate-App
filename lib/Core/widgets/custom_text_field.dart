import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.radio,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isObsecureText,
    this.controller,
    this.validator
  });
  double? radio;
  String? hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool? isObsecureText;
  TextEditingController? controller;
 String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isObsecureText ?? false,
      style: AppTextStyles.poppins14Regular(),
      cursorColor: AppColors.primary,

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.poppins14Regular(color: AppColors.grey),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        //fillColor: AppColors.white,
      ),
    );
  }
}
