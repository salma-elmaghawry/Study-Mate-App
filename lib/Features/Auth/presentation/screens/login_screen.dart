import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/helpers/spacing.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  bool isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(80),
                Text(
                  "Sign In",
                  style: AppTextStyles.quicksand24Bold(fontSize: 30),
                ),
                verticalSpace(16),

                Text(
                  "Welcome back!",
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
                        textAlign: TextAlign.start,

                        style: AppTextStyles.poppins14Regular(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                        ),
                      ),
                      verticalSpace(8),
                      CustomTextFormField(hintText: "example@gmail.com"),
                      verticalSpace(30),
                      Text(
                        textAlign: TextAlign.start,

                        "Password",

                        style: AppTextStyles.poppins14Regular(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                        ),
                      ),
                      verticalSpace(8),
                      CustomTextFormField(
                        hintText: "Password",
                        isObsecureText: isObsecureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObsecureText = !isObsecureText;
                            });
                          },
                          child: Icon(
                            isObsecureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      verticalSpace(30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
