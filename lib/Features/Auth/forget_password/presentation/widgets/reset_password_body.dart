import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/helpers/spacing.dart';
import 'package:study_mate/Core/widgets/custom_text_button.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';
import 'package:study_mate/Features/Auth/forget_password/data/forgot_password_model.dart';
import 'package:study_mate/Features/Auth/forget_password/domain/cubit/forget_password_cubit.dart';

class ResetPasswordBody extends StatefulWidget {
  final String email;
  final int code;

  const ResetPasswordBody({super.key, required this.email, required this.code});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isObsecureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        return Column(
          children: [
            verticalSpace(80),
            Text(
              "New Password",
              style: AppTextStyles.quicksand24Bold(fontSize: 30),
            ),
            verticalSpace(16),
            Text(
              "Create a new password",
              style: AppTextStyles.poppins14Regular(
                color: AppColors.grey,
                fontSize: 18,
              ),
            ),
            verticalSpace(60),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: AppTextStyles.poppins14Regular(fontSize: 16),
                  ),
                  verticalSpace(8),
                  CustomTextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    isObsecureText: isObsecureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObsecureText = !isObsecureText;
                        });
                      },
                      child: Icon(
                        color: AppColors.primary,
                        isObsecureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  verticalSpace(20),
                  Text(
                    "Confirm Password",
                    style: AppTextStyles.poppins14Regular(fontSize: 16),
                  ),
                  verticalSpace(8),
                  CustomTextFormField(
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      } else if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    isObsecureText: isObsecureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObsecureText = !isObsecureText;
                        });
                      },
                      child: Icon(
                        color: AppColors.primary,
                        isObsecureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  verticalSpace(50),
                  if (state is ResetPasswordLoading)
                    const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    )
                  else
                    CustomTextButton(
                      buttonText: "Create a new password",
                      textStyle: AppTextStyles.poppins14Regular(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                      borderRadius: 8,
                      horizontalPadding: 16,
                      verticalPadding: 10,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<ForgotPasswordCubit>().resetPassword(
                            ResetPasswordRequest(
                              email: widget.email,
                              newPassword: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                              code: widget.code,
                            ),
                          );
                        }
                      },
                      backgroundColor: AppColors.primary,
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
