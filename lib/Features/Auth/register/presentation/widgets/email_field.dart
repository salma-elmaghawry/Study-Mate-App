import 'package:flutter/material.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: "example@gmail.com",
      labelText: "Email",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Enter a valid email';
        }
        return null;
      },
    );
  }
}