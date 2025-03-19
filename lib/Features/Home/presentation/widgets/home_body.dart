import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Features/Home/presentation/widgets/badge_card.dart';
import 'package:study_mate/Features/Home/presentation/widgets/goal_widget.dart';
import 'package:study_mate/Features/Home/presentation/widgets/my_files_section.dart';
import 'package:study_mate/Features/Home/presentation/widgets/quick_access_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(11.0),
      child: ListView(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(7.0),
          //   child: CustomTextField(
          //     hintText: AppStrings.search,
          //     prefixIcon: Padding(
          //       padding: const EdgeInsets.all(10),
          //       child: SvgPicture.asset(AppIcons.search),
          //     ),
          //   ),
          // ),
          SizedBox(height: 5.h),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 6),
            child: BadgeCard(),
          ),
          SizedBox(height: 15.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Daily Goals", style: AppTextStyles.quicksand18BoldB()),
              SizedBox(height: 10.h),
              Column(
                children: [
                  GoalTile(
                    title: "Make 2 Flashcard sets",
                    progress: "1 / 2",
                    xp: 20,
                  ),
                  GoalTile(
                    title: "Summarize 5 Files",
                    progress: "0 / 5",
                    xp: 20,
                  ),
                  GoalTile(
                    title: "Practice 2 Quizzes",
                    progress: "2 / 2",
                    xp: 20,
                    isCompleted: true,
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Text("Quick Access", style: AppTextStyles.quicksand18BoldB()),
              SizedBox(height: 10.h),

              QuickAccessGrid(),
              SizedBox(height: 15.h),
              Text("My Files", style: AppTextStyles.quicksand18BoldB()),
              // DocumentsSection(),
            ],
          ),
        ],
      ),
    );
  }
}
