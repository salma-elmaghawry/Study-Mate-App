import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/Theme/app_strings.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Core/widgets/custom_appBar.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';
import 'package:study_mate/Features/Home/presentation/widgets/badge_card.dart';
import 'package:study_mate/Features/Home/presentation/widgets/goal_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          leading: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 8,
                bottom: 8,
                right: 5,
              ),
              child: SvgPicture.asset(AppIcons.user),
            ),
            onTap: () => Navigator.pushNamed(context, Routes.profile),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                hintText: AppStrings.search,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(AppIcons.search),
                ),
              ),
              SizedBox(height: 20),
              BadgeCard(),
              SizedBox(height: 20),
              Text("Daily Goals", style: AppTextStyles.quicksand18BoldB()),
              Expanded(
                child: ListView(
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
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.purple,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
