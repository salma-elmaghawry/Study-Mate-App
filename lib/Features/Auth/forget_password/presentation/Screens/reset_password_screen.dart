import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Core/di/dependency_injection.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Features/Auth/forget_password/data/forgot_password_repo.dart';
import 'package:study_mate/Features/Auth/forget_password/domain/cubit/forget_password_cubit.dart';
import 'package:study_mate/Features/Auth/forget_password/presentation/widgets/reset_password_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;
  final int code;

  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(getIt<ForgotPasswordRepo>()),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.signIn,
                    (route) => false,
                  );
                } else if (state is ResetPasswordFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: ResetPasswordBody(email: email, code: code),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}