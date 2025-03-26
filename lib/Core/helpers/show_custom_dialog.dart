import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';

void showCustomDialog(
  BuildContext context, {
  required String title,
  required String message,
  required bool isSuccess,
}) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          backgroundColor: AppColors.white,
          icon:
              isSuccess
                  ? Icon(Icons.check_circle, color: AppColors.green, size: 24)
                  : Icon(Icons.error, color: AppColors.red, size: 24),
          title: Text(
            title,
            style: AppTextStyles.poppins14Regular(
              color: isSuccess ? AppColors.green : AppColors.red,
            ),
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
              style: TextButton.styleFrom(foregroundColor: AppColors.primary),
            ),
          ],
        ),
  );
}
