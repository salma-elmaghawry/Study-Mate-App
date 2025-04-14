import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/helpers/app_regex.dart';
import 'package:study_mate/Core/helpers/spacing.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';
import 'package:study_mate/Core/widgets/password_validation.dart';

class PasswordFields extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isObscureText;
  final VoidCallback onToggleVisibility;

  const PasswordFields({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isObscureText,
    required this.onToggleVisibility,
  });

  @override
  State<PasswordFields> createState() => _PasswordFieldsState();
}

class _PasswordFieldsState extends State<PasswordFields> {
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    widget.passwordController.addListener(_updatePasswordValidations);
  }

  void _updatePasswordValidations() {
    setState(() {
      hasLowercase = AppRegex.hasLowerCase(widget.passwordController.text);
      hasUppercase = AppRegex.hasUpperCase(widget.passwordController.text);
      hasSpecialCharacters = AppRegex.hasSpecialCharacter(
        widget.passwordController.text,
      );
      hasNumber = AppRegex.hasNumber(widget.passwordController.text);
      hasMinLength = AppRegex.hasMinLength(widget.passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: widget.passwordController,
          hintText: "Password",
          labelText: "Password",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
          isObsecureText: widget.isObscureText,
          suffixIcon: GestureDetector(
            onTap: widget.onToggleVisibility,
            child: Icon(
              color: AppColors.primary,
              widget.isObscureText ? Icons.visibility_off : Icons.visibility,
            ),
          ),
        ),
        verticalSpace(20),
        CustomTextFormField(
          controller: widget.confirmPasswordController,
          labelText: "Confirm Password",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          isObsecureText: widget.isObscureText,
          suffixIcon: GestureDetector(
            onTap: widget.onToggleVisibility,
            child: Icon(
              color: AppColors.primary,
              widget.isObscureText ? Icons.visibility_off : Icons.visibility,
            ),
          ),
        ),
        verticalSpace(18),
        PasswordValidations(
          hasLowerCase: hasLowercase,
          hasUpperCase: hasUppercase,
          hasSpecialCharacters: hasSpecialCharacters,
          hasNumber: hasNumber,
          hasMinLength: hasMinLength,
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.passwordController.removeListener(_updatePasswordValidations);
    super.dispose();
  }
}