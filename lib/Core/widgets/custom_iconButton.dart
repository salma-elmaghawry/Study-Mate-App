import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final String assetname;
  final bool isFilled;
  final VoidCallback onPressed;

  CustomIconButton({
    required this.assetname,
    required this.isFilled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isFilled ? AppColors.primary : Colors.transparent,
          border:
              isFilled ? null : Border.all(color: AppColors.primary, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            assetname,
            color: isFilled ? Colors.white : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
