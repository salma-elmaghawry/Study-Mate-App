import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/helpers/spacing.dart';
import 'package:study_mate/Core/widgets/custom_docsTile.dart';

class SummarizedFileSection extends StatelessWidget {
  const SummarizedFileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textAlign: TextAlign.start,
              "Summarized Files",
              style: AppTextStyles.quicksand18BoldB(),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "See All",
                style: AppTextStyles.poppins12RegularUnderline(
                  color: AppColors.grey,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(10),
        DocsTile(
          imagePath: AppImages.bluefolder,
          title: "Summarize of lec 1 ",
          date: "19 Mrach 2025",
        ),
        verticalSpace(10),
        DocsTile(
          imagePath: AppImages.bluefolder,
          title: "Summarize of lec 1 ",
          date: "19 Mrach 2025",
        ),
        verticalSpace(10),
        DocsTile(
          imagePath: AppImages.bluefolder,
          title: "Summarize of lec 1 ",
          date: "19 Mrach 2025",
        ),
        verticalSpace(30),
      ],
    );
  }
}
