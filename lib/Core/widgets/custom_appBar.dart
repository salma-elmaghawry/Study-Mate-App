import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_mate/Core/Theme/app_Strings.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/routes/routes.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({super.key, this.name = "salma", this.leading});
  final String name;
  Widget? leading;
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: leading,

      title: Text(
        '${AppStrings.hello}$name',
        style: AppTextStyles.quicksand24Bold(),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(AppIcons.notification),
          onPressed: () => Navigator.pushNamed(context, Routes.notifications),
        ),
        IconButton(
          icon: SvgPicture.asset(AppIcons.settings),
          onPressed: () => Navigator.pushNamed(context, Routes.settings),
        ),
      ],
    );
  }
}
