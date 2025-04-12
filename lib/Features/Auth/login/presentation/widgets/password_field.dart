import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';
import 'package:study_mate/Core/helpers/spacing.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool isObscureText;
  final VoidCallback onToggleVisibility;

  const PasswordField({
    super.key,
    required this.controller,
    required this.isObscureText,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: AppTextStyles.poppins14Regular(fontSize: 16),
        ),
        verticalSpace(8),
        CustomTextFormField(
          controller: controller,
          hintText: "Password",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          isObsecureText: isObscureText,
          suffixIcon: GestureDetector(
            onTap: onToggleVisibility,
            child: Icon(
              color: AppColors.primary,
              isObscureText ? Icons.visibility_off : Icons.visibility,
            ),
          ),
        ),
      ],
    );
  }
}