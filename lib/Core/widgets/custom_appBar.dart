import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_mate/Core/Theme/app_Strings.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/routes/routes.dart';

class CustomAppbar extends StatelessWidget {
  CustomAppbar({super.key, this.name = "salma"});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: AppColors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 8,
              bottom: 8,
              right: 8,
            ),
            child: SvgPicture.asset(AppIcons.user, width: 30, height: 30),
          ),
          Text(
            '${AppStrings.hello}$name',
            style: AppTextStyles.quicksand24Bold(),
          ),
          Spacer(),
          IconButton(
            icon: SvgPicture.asset(AppIcons.notification),
            onPressed: () => Navigator.pushNamed(context, Routes.notifications),
          ),
          IconButton(
            icon: SvgPicture.asset(AppIcons.settings),
            onPressed: () => Navigator.pushNamed(context, Routes.settings),
          ),
        ],
      ),
    );
  }
}
