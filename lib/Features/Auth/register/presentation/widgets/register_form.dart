import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Core/helpers/spacing.dart';
import 'package:study_mate/Core/widgets/custom_text_button.dart';
import 'package:study_mate/Features/Auth/register/domain/register-cubit/register_cubit.dart';
import 'package:study_mate/Features/Auth/register/presentation/widgets/already_have_account.dart';
import 'package:study_mate/Features/Auth/register/presentation/widgets/email_field.dart';
import 'package:study_mate/Features/Auth/register/presentation/widgets/name_fields.dart';
import 'package:study_mate/Features/Auth/register/presentation/widgets/password_fields.dart';
import 'package:study_mate/Features/Auth/register/presentation/widgets/register_button.dart';
import 'package:study_mate/Features/Auth/register/presentation/widgets/terms_checkbox.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isObscureText = true;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameFields(
            firstNameController: firstNameController,
            lastNameController: lastNameController,
          ),
          verticalSpace(20),
          EmailField(controller: emailController),
          verticalSpace(20),
          PasswordFields(
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            isObscureText: isObscureText,
            onToggleVisibility: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
          ),
          verticalSpace(10),
          const TermsCheckbox(),
          verticalSpace(10),
          RegisterButton(
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
          ),
          verticalSpace(20),
          const AlreadyHaveAccount(),
        ],
      ),
    );
  }
}