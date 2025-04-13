import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Core/di/dependency_injection.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Features/Auth/forget_password/data/forgot_password_repo.dart';
import 'package:study_mate/Features/Auth/forget_password/domain/cubit/forget_password_cubit.dart';
import 'package:study_mate/Features/Auth/forget_password/presentation/widgets/verify_password_otp_body.dart';

class VerifyPasswordOtpScreen extends StatelessWidget {
  final String email;

  const VerifyPasswordOtpScreen({super.key, required this.email});

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
                if (state is VerifyResetCodeSuccess) {
                  Navigator.pushNamed(
                    context,
                    Routes.resetPassword,
                    arguments: {
                      'email': email,
                      'code': int.parse((state as VerifyResetCodeSuccess).code),
                    },
                  );
                } else if (state is VerifyResetCodeFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: VerifyPasswordOtpBody(email: email),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
