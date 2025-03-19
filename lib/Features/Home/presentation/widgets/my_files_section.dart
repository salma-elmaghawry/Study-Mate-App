import 'package:flutter/widgets.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/widgets/custom_docsTile.dart';

class MyFilesSection extends StatelessWidget {
  const MyFilesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DocsTile(
          imagePath: AppImages.bluefolder,
          title: "SUmmarixe of lec 1 ",
          date: "19 Mrach 2025",
        ),
        DocsTile(
          imagePath: AppImages.yellowfolder,
          title: "SUmmarixe of lec 1 ",
          date: "19 Mrach 2025",
        ),
        DocsTile(
          imagePath: AppImages.notes,
          title: "SUmmarixe of lec 1 ",
          date: "19 Mrach 2025",
        ),
      ],
    );
  }
}
