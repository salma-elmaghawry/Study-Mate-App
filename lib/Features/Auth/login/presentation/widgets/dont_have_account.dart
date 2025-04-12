import 'package:flutter/material.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Core/widgets/text_with_action.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextWithAction(
        text: "Don't have an account? ",
        actionText: "Sign Up",
        onTap: () {
          Navigator.pushNamed(context, Routes.signUp);
        },
      ),
    );
  }
}