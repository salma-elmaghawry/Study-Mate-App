import 'package:flutter/material.dart';
import 'package:study_mate/Core/helpers/spacing.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';

class NameFields extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  const NameFields({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            controller: firstNameController,
            labelText: "First Name",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              } else if (value.length < 2) {
                return 'First name must be at least 2 characters';
              }
              return null;
            },
          ),
        ),
        horizontalSpace(15),
        Expanded(
          child: CustomTextFormField(
            controller: lastNameController,
            labelText: "Last Name",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              } else if (value.length < 2) {
                return 'Last name must be at least 2 characters';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}