import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/helpers/spacing.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(50),
        Text(
          "Create Account",
          style: AppTextStyles.quicksand24Bold(fontSize: 30),
        ),
        verticalSpace(16),
        Text(
          "Fill your information to create an account",
          textAlign: TextAlign.center,
          style: AppTextStyles.poppins14Regular(
            color: AppColors.grey,
            fontSize: 18,
          ),
        ),
        verticalSpace(30),
      ],
    );
  }
}