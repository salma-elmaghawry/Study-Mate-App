import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';

class SummarizingProcessScreen extends StatelessWidget {
  const SummarizingProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Image.asset(AppImages.quiz, width: 250, height: 250),
              const SizedBox(height: 30),
              Text(
                textAlign: TextAlign.center,

                'Your summarized file is being prepared...',
                style: AppTextStyles.quicksand20BoldB(),
              ),
              const SizedBox(height: 60),
              // Custom circular progress indicator with percentage
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),
              Text(
                textAlign: TextAlign.center,
                'Tip: The more XP you earn, the higher your file size limit becomes!',
                style: AppTextStyles.poppins14Regular(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
