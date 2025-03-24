import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String highlight;
  final String? title2;
  final String description;

  OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
    required this.highlight,
    this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        ClipPath(
          clipper: SymmetricalCurveClipper(),
          child: Image.asset(
            image,
            width: double.infinity,
            height: 500,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),

        // Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTextStyles.quicksand24Bold(),
              children: [
                TextSpan(
                  text: title,
                  style: AppTextStyles.quicksand24Bold(
                    color: AppColors.textPrimary,
                  ),
                ),
                TextSpan(
                  text: highlight,
                  style: AppTextStyles.quicksand24Bold(
                    color: AppColors.primary,
                  ),
                ),
                if (title2 != null)
                  TextSpan(
                    text: title2,
                    style: AppTextStyles.quicksand24Bold(
                      color: AppColors.textPrimary,
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),

        // Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            description,
            style: AppTextStyles.poppins14Regular(color: AppColors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class SymmetricalCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8); // Start at 80% height on the left

    path.quadraticBezierTo(
      size.width / 2,
      size.height * 1.0, // Control point at the center
      size.width,
      size.height * 0.8,
    ); // End at 80% height on the right

    path.lineTo(size.width, 0); // Close the path at the top-right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
