import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Text('Home Screen', style: AppTextStyles.Quicksand_24_Bold),
      ),
    );
  }
}
