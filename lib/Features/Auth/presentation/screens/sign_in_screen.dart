import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/helpers/extentions.dart';
import 'package:study_mate/Core/helpers/spacing.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Core/widgets/custom_text_button.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';
import 'package:study_mate/Core/widgets/text_with_action.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                            color: AppColors.primary,
                            isObsecureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      verticalSpace(18),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            context.pushReplacementNamed(Routes.signUp);
                          },
                          child: Text(
                            "Forget Password?",

                            style: AppTextStyles.poppins12RegularUnderline(
                              color: AppColors.primary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(30),
                      CustomTextButton(
                        buttonText: "Sign In",
                        textStyle: AppTextStyles.poppins14Regular(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                        onPressed: () {},
                        backgroundColor: AppColors.primary,
                        borderRadius: 8,
                        horizontalPadding: 16,
                        verticalPadding: 10,
                      ),
                      verticalSpace(20),
                      Align(
                        alignment: Alignment.center,
                        child: TextWithAction(
                          text: "Don't have an account? ",
                          actionText: "Sign Up",
                          onTap: () {
                            context.pushReplacementNamed(Routes.signUp);
                          },
                        ),
                      ),
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
