import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/widgets/custom_text_button.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RegisterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      buttonText: "Create a new account",
      onPressed: onPressed,
      textStyle: AppTextStyles.poppins14Regular(
        color: AppColors.white,
        fontSize: 16,
      ),
      borderRadius: 8,
      horizontalPadding: 16,
      verticalPadding: 10,
      backgroundColor: AppColors.primary,
    );
  }
}