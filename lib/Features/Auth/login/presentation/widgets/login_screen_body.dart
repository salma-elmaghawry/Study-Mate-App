import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/helpers/app_regex.dart';
import 'package:study_mate/Core/helpers/extentions.dart';
import 'package:study_mate/Core/helpers/show_custom_dialog.dart';
import 'package:study_mate/Core/helpers/spacing.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Core/widgets/custom_text_button.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';
import 'package:study_mate/Core/widgets/password_validation.dart';
import 'package:study_mate/Core/widgets/text_with_action.dart';
import 'package:study_mate/Features/Auth/login/domain/login-cubit/login_cubit.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  late TextEditingController passwordController;
  bool isObsecureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            builder:
                (context) => const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
          );
        } else if (state is LoginInitial) {
          Navigator.pop(context);
        } else if (state is LoginSuccess) {
          showCustomDialog(
            context,
            title: "Success",
            message: "Welcome back to StudyMate \n  Your ideal Study Partner",
            isSuccess: true,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.nav_bar,
                (route) => false,
              );
            },
          );
        } else if (state is LoginFailure) {
          showCustomDialog(
            context,
            title: "Error",
            message: state.error,
            isSuccess: false,
            onPressed: () {
              Navigator.pop(context);
            },
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            verticalSpace(80),
            Text("Sign In", style: AppTextStyles.quicksand24Bold(fontSize: 30)),
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
                  verticalSpace(30),
                  Text(
                    "Password",
                    style: AppTextStyles.poppins14Regular(fontSize: 16),
                  ),
                  verticalSpace(8),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: "Password",
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

                  verticalSpace(18),
                  PasswordValidations(
                    hasLowerCase: hasLowercase,
                    hasUpperCase: hasUppercase,
                    hasSpecialCharacters: hasSpecialCharacters,
                    hasNumber: hasNumber,
                    hasMinLength: hasMinLength,
                  ),
                  verticalSpace(18),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        context.pushReplacementNamed(Routes.forgotPassword);
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
                    borderRadius: 8,
                    horizontalPadding: 16,
                    verticalPadding: 10,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(
                          context,
                        ).login(emailController.text, passwordController.text);
                      }
                    },
                    backgroundColor: AppColors.primary,
                  ),
                  verticalSpace(20),
                  Align(
                    alignment: Alignment.center,
                    child: TextWithAction(
                      text: "Don't have an account? ",
                      actionText: "Sign Up",
                      onTap: () {
                        Navigator.pushNamed(context, Routes.signUp);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
