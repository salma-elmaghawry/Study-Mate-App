import 'package:flutter/material.dart';
import 'package:study_mate/Features/Auth/reset_password/presentation/reset_password_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(child: ResetPasswordBody()),
        ),
      ),
    );
  }
}