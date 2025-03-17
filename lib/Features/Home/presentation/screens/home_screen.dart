import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/widgets/custom_appBar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(),
              SizedBox(height: 20),
              XPProgressCard(),
              SizedBox(height: 20),
              Text("Daily Goals", style: AppTextStyles.Quicksand_18_bold),
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

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}

class XPProgressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lvl 3",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "Well Done Champ!\n750 XP Earned...",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: 750 / 1000,
            color: Colors.orange,
            backgroundColor: Colors.white,
          ),
        ],
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
