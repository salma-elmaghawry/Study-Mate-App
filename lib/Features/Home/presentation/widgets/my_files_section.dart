import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/widgets/custom_docsTile.dart';
import 'package:study_mate/Core/widgets/custom_tabbar.dart';

class MyFilesSection extends StatefulWidget {
  const MyFilesSection({super.key});

  @override
  State<MyFilesSection> createState() => _MyFilesSectionState();
}

class _MyFilesSectionState extends State<MyFilesSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        TabBarWidget(
          tabs: [
            TabItem(label: "All", icon: AppIcons.fav),
            TabItem(label: "Uploaded", icon: AppIcons.upload),
            TabItem(label: "Notes", icon: AppIcons.note),
          ],
          onTabChanged: (index) {
            print("Selected Tab: $index");
          },
        ),

        SizedBox(height: 10.h),
        DocsTile(
          imagePath: AppImages.bluefolder,
          title: "Summarize of lec 1 ",
          date: "19 Mrach 2025",
        ),
        DocsTile(
          imagePath: AppImages.yellowfolder,
          title: "Uploaded lec 1 ",
          date: "19 Mrach 2025",
        ),
        DocsTile(
          imagePath: AppImages.notes,
          title: "Notes on lec 1 ",
          date: "19 Mrach 2025",
        ),
      ],
    );
  }
}
