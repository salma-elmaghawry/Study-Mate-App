import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/helpers/spacing.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Core/widgets/custom_text_button.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';
import 'package:study_mate/Core/widgets/text_with_action.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(80),
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
        verticalSpace(50),
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
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
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
                    isObsecureText ? Icons.visibility_off : Icons.visibility,
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
                    isObsecureText ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),

              verticalSpace(18),
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
              verticalSpace(20),
              CustomTextButton(
                buttonText: "Create a new account",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, Routes.nav_bar);
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
  }
}
