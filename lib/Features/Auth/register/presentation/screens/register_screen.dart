import 'package:flutter/material.dart';
import 'package:study_mate/Features/Auth/login/presentation/widgets/register_screen_body.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(child: RegisterScreenBody()),
        ),
      ),
    );
  }
}
