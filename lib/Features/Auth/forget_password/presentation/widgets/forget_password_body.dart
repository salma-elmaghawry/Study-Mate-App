import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/helpers/spacing.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Core/widgets/custom_text_button.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';
import 'package:study_mate/Features/Auth/forget_password/domain/cubit/forget_password_cubit.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          Navigator.pushNamed(
            context,
            Routes.verifyPasswordOtp,
            arguments: emailController.text,
          );
        }
      },
      child: Column(
        children: [
          verticalSpace(80),
          Text(
            "Forgot Password",
            style: AppTextStyles.quicksand24Bold(fontSize: 30),
          ),
          verticalSpace(16),
          Text(
            "Please enter your email to send reset code",
            textAlign: TextAlign.center,
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
                  "Email",
                  style: AppTextStyles.poppins14Regular(fontSize: 16),
                ),
                verticalSpace(8),
                CustomTextFormField(
                  controller: emailController,
                  hintText: "example@gmail.com",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(
                      r'^[^@]+@[^@]+\.[^@]+',
                    ).hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                verticalSpace(50),
                BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                  builder: (context, state) {
                    if (state is ForgotPasswordLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    }
                    return CustomTextButton(
                      buttonText: "Next",
                      textStyle: AppTextStyles.poppins14Regular(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                      borderRadius: 8,
                      horizontalPadding: 16,
                      verticalPadding: 10,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<ForgotPasswordCubit>().sendResetCode(
                            emailController.text,
                          );
                        }
                      },
                      backgroundColor: AppColors.primary,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
