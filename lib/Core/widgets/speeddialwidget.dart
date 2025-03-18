import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/routes/routes.dart';

class Speeddialwidget extends StatelessWidget {
  const Speeddialwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Colors.transparent,
      overlayColor: Colors.black54,
      overlayOpacity: 0.3,
      spacing: 10, // Space between children
      direction: SpeedDialDirection.up, // Expands children horizontally
      spaceBetweenChildren: 12,
      children: [
        SpeedDialChild(
          label: "Add Note",
          labelStyle: AppTextStyles.poppins12Regular(),
          shape: CircleBorder(),
          child: SvgPicture.asset(AppIcons.note, color: AppColors.primary),
          backgroundColor: AppColors.white,
          onTap: () {
            Navigator.pushNamed(context, Routes.notes);
          },
        ),
        SpeedDialChild(
          shape: CircleBorder(),
          label: "Music",
          labelStyle: AppTextStyles.poppins14Regular(),
          child: SvgPicture.asset(AppIcons.music, color: AppColors.primary),
          backgroundColor: Colors.white,
          onTap: () {
            Navigator.pushNamed(context, Routes.music);
          },
        ),
      ],
      activeIcon: Icons.close,
      activeBackgroundColor: AppColors.white,

      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [AppColors.secondary, AppColors.primary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(AppIcons.plus, color: AppColors.white),
        ),
      ),
    );
  }
}
