import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_images.dart';

import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/routes/routes.dart';


class QuickAccessGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> features = [
      {
        "title": "Quizzes",
        "icon": AppIcons.quiz,
        "onTap": () {
          color:
          AppColors.primary;
          Navigator.pushNamed(context, Routes.quiz);
        },
      },

      {
        "title": "Notes",
        "icon": AppIcons.note,
        "onTap": () {
          color:
          AppColors.primary;
          Navigator.pushNamed(context, Routes.notes);
        },
      },
      {
        "title": "Music",
        "icon": AppIcons.music,
        "onTap": () {
          color:
          AppColors.primary;
          Navigator.pushNamed(context, Routes.music);
        },
      },
    ];
    return Center(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Controls the number of columns
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2, // Adjusts box proportions
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          return FeatureCard(
            title: features[index]["title"],
            icon: features[index]["icon"],
            onTap: features[index]["onTap"],
            color: features[index]["color"],
          );
        },
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String icon;
  void Function()? onTap;
  final Color? color;

  FeatureCard({
    required this.title,
    required this.icon,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color ?? AppColors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),

              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.poppins12Regular(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
