import 'package:flutter/material.dart';
import 'package:study_mate/Features/Auth/forget_password/presentation/forget_password_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(child: ForgetPasswordBody()),
          ),
        ),

      
      
    );
  }
}
