import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';
import 'package:study_mate/Core/helpers/spacing.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: AppTextStyles.poppins14Regular(fontSize: 16),
        ),
        verticalSpace(8),
        CustomTextFormField(
          controller: controller,
          hintText: "example@gmail.com",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Enter a valid email';
            }
            return null;
          },
        ),
      ],
    );
  }
}