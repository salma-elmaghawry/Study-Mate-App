import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Features/Home/presentation/widgets/custom_slider.dart';

class BadgeCard extends StatefulWidget {
  BadgeCard({super.key, this.earnedValue = 700});
  int earnedValue;

  @override
  State<BadgeCard> createState() => _BadgeCardState();
}

class _BadgeCardState extends State<BadgeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      width: 360.w,
      height: 210.h,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            blurRadius: 10, // Blur effect
            offset: Offset(0, 4), // Shadow position
          ),
        ],
        gradient: LinearGradient(
          colors: [AppColors.secondary, AppColors.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(AppImages.prize, width: 24.w, height: 24.h),
                  Text("Lvl 3", style: AppTextStyles.quicksand18BoldW()),
                ],
              ),
              SizedBox(height: 4),
              Text("Well Done Champ!", style: AppTextStyles.quicksand20BoldW()),
              Row(
                children: [
                  Text(
                    "${widget.earnedValue} XP ",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.badgevalue,
                    ),
                  ),
                  Text("Earned...", style: AppTextStyles.quicksand20BoldW()),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 150),
                child: CustomSlider(value: widget.earnedValue.toDouble()),
              ),
              Flexible(
                flex: 5,
                child: Text(
                  "${widget.earnedValue} out of 1000 XP",
                  style: AppTextStyles.poppins12Regular(color: AppColors.white),
                ),
              ),
            ],
          ),
          Positioned(
            right: -23,
            top: -5,
            bottom: -10,
            child: Image.asset(AppImages.fly, width: 170.w, height: 190.h),
          ),
        ],
      ),
    );
  }
}
