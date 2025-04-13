import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/widgets/custom_text_button.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      buttonText: "Sign In",
      textStyle: AppTextStyles.poppins14Regular(
        color: AppColors.white,
        fontSize: 16,
      ),
      borderRadius: 8,
      horizontalPadding: 16,
      verticalPadding: 10,
      onPressed: onPressed,
      backgroundColor: AppColors.primary,
    );
  }
}