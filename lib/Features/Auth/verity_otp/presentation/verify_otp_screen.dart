import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Core/di/dependency_injection.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Features/Auth/verity_otp/data/verify_otp_repo.dart';
import 'package:study_mate/Features/Auth/verity_otp/domain/cubit/verify_otp_cubit.dart';
import 'package:study_mate/Features/Auth/verity_otp/presentation/verify_otp_body.dart';

class VerifyOtpScreen extends StatelessWidget {
  final String email;

  const VerifyOtpScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyOtpCubit(getIt<VerifyEmailRepo>()),

      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
              listener: (context, state) {
                if (state is VerifyOtpSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.signIn, // Navigate to login screen on success
                    (route) => false,
                  );
                } else if (state is VerifyOtpFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                } else if (state is ResendOtpFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: VerifyOtpBody(email: email),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
