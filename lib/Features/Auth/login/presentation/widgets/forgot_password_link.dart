import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Core/helpers/extentions.dart';

class ForgotPasswordLink extends StatelessWidget {
  const ForgotPasswordLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          context.pushReplacementNamed(Routes.forgotPassword);
        },
        child: Text(
          "Forget Password?",
          style: AppTextStyles.poppins12RegularUnderline(
            color: AppColors.primary,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}