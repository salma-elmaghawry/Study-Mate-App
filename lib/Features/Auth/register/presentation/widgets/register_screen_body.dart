import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/helpers/app_regex.dart';
import 'package:study_mate/Core/helpers/show_custom_dialog.dart';
import 'package:study_mate/Core/helpers/spacing.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Core/widgets/custom_text_button.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';
import 'package:study_mate/Core/widgets/password_validation.dart';
import 'package:study_mate/Core/widgets/text_with_action.dart';
import 'package:study_mate/Features/Auth/login/domain/login-cubit/login_cubit.dart';
import 'package:study_mate/Features/Auth/register/domain/register-cubit/register_cubit.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isObsecureText = true;
  bool _agreeToTerms = false;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();

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
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            builder:
                (context) => const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
          );
        } else if (state is RegisterSuccess) {
          showCustomDialog(
            context,
            title: "Success",
            message: "Account created successfully,Let's verify your email",
            isSuccess: true,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.verifyOtp,
                (route) => false,
              );
            },
          );
        } else if (state is RegisterFailure) {
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
            verticalSpace(50),
            Text(
              "Create Account",
              style: AppTextStyles.quicksand24Bold(fontSize: 30),
            ),
            verticalSpace(16),
            Text(
              "Fill your information to create an account",
              textAlign: TextAlign.center,

              style: AppTextStyles.poppins14Regular(
                color: AppColors.grey,
                fontSize: 18,
              ),
            ),
            verticalSpace(30),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                  ),
                  verticalSpace(20),

                  CustomTextFormField(
                    controller: emailController,
                    hintText: "example@gmail.com",
                    labelText: "Email",
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

                  verticalSpace(20),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: "Password",
                    labelText: "Password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
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
                  CustomTextFormField(
                    controller: confirmPasswordController,
                    labelText: "Confirm Password",
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

                  verticalSpace(10),
                  Row(
                    children: [
                      Checkbox(
                        value: _agreeToTerms,
                        activeColor: AppColors.primary,
                        onChanged: (bool? value) {
                          setState(() {
                            _agreeToTerms = value ?? false;
                          });
                        },
                      ),
                      const Text("I agree to the "),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Terms Of Conditions",
                          style: AppTextStyles.poppins12RegularUnderline(
                            color: AppColors.primary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  CustomTextButton(
                    buttonText: "Create a new account",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<RegisterCubit>(context).register(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                        );
                      }
                    },
                    textStyle: AppTextStyles.poppins14Regular(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                    borderRadius: 8,
                    horizontalPadding: 16,
                    verticalPadding: 10,

                    backgroundColor: AppColors.primary,
                  ),
                  verticalSpace(20),
                  Align(
                    alignment: Alignment.center,
                    child: TextWithAction(
                      text: "Already have an account? ",
                      actionText: "Sign In",
                      onTap: () {
                        Navigator.pushNamed(context, Routes.signIn);
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
