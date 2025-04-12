import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Core/helpers/spacing.dart';
import 'package:study_mate/Features/Auth/login/domain/login-cubit/login_cubit.dart';
import 'package:study_mate/Features/Auth/login/presentation/widgets/dont_have_account.dart';
import 'package:study_mate/Features/Auth/login/presentation/widgets/email_field.dart';
import 'package:study_mate/Features/Auth/login/presentation/widgets/forgot_password_link.dart';
import 'package:study_mate/Features/Auth/login/presentation/widgets/login_button.dart';
import 'package:study_mate/Features/Auth/login/presentation/widgets/password_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EmailField(controller: emailController),
          verticalSpace(30),
          PasswordField(
            controller: passwordController,
            isObscureText: isObscureText,
            onToggleVisibility: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
          ),
          verticalSpace(18),
          const ForgotPasswordLink(),
          verticalSpace(30),
          LoginButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<LoginCubit>(
                  context,
                ).login(emailController.text, passwordController.text);
              }
            },
          ),
          verticalSpace(20),
          const DontHaveAccount(),
        ],
      ),
    );
  }
}
