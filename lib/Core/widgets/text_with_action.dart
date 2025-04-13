import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';

class TextWithAction extends StatelessWidget {
  const TextWithAction({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
  });
  final String text;
  final String actionText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: AppTextStyles.poppins14Regular(color: AppColors.textPrimary),
          ),
          TextSpan(
            text: actionText,
            style: AppTextStyles.poppins14Bold(color: AppColors.primary),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
