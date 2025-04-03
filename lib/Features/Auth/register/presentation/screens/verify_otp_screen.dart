import 'package:flutter/material.dart';
import 'package:study_mate/Features/Auth/register/presentation/widgets/verify_otp_body.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   body:    SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(child: VerifyOtpBody()),
        ),
      ),
    );
  }
}