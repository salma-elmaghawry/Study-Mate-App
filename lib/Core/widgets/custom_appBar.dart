import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, this.name = "salma"});
  final String name;
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: SvgPicture.asset(AppIcons.user),
      title: Text('Hello, $name', style: AppTextStyles.Quicksand_24_Bold),
      actions: [
        IconButton(icon: SvgPicture.asset(AppIcons.user), onPressed: () {}),
        IconButton(icon: SvgPicture.asset(AppIcons.user), onPressed: () {}),
      ],
    );
  }
}
