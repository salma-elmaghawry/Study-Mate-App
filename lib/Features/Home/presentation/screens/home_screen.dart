import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/Theme/app_strings.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Core/widgets/custom_appBar.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';
import 'package:study_mate/Features/Home/presentation/widgets/badge_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
                      xp: "20 XP",
                    ),
                    GoalTile(
                      title: "Summarize 5 Files",
                      progress: "0 / 5",
                      xp: "50 XP",
                    ),
                    GoalTile(
                      title: "Practice 2 Quizzes",
                      progress: "2 / 2",
                      xp: "20 XP",
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

class GoalTile extends StatelessWidget {
  final String title;
  final String progress;
  final String xp;
  final bool isCompleted;

  GoalTile({
    required this.title,
    required this.progress,
    required this.xp,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(value: isCompleted, onChanged: (value) {}),
        title: Text(title),
        subtitle: Text("Gain $xp"),
        trailing: Text(progress),
      ),
    );
  }
}
