import 'package:flutter/material.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Core/widgets/text_with_action.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextWithAction(
        text: "Already have an account? ",
        actionText: "Sign In",
        onTap: () {
          Navigator.pushNamed(context, Routes.signIn);
        },
      ),
    );
  }
}