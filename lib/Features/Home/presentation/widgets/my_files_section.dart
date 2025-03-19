import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/widgets/custom_docsTile.dart';
import 'package:study_mate/Core/widgets/custom_tabbar.dart';

class DocumentsSection extends StatefulWidget {
  @override
  _DocumentsSectionState createState() => _DocumentsSectionState();
}

class _DocumentsSectionState extends State<DocumentsSection> {
  int selectedTab = 0;

  final List<Map<String, dynamic>> tabs = [
    {"label": "All", "icon": Icons.star},
    {"label": "Uploaded", "icon": Icons.insert_drive_file},
    {"label": "Notes", "icon": Icons.edit_note},
  ];

  final List<Map<String, dynamic>> documents = [
    {
      "title": "Summarized SW Lecture",
      "date": "5 March 2025",
      "imagePath": AppImages.notes,
      "color": Colors.purpleAccent,
    },
    {
      "title": "Uploaded SW Lecture",
      "date": "5 March 2025",
      "imagePath": AppImages.notes,
      "color": Colors.amberAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom Tab Bar
          CustomTabBar(
            tabs: tabs,
            selectedIndex: selectedTab,
            onTabSelected: (index) {
              setState(() {
                selectedTab = index;
              });
            },
          ),
          SizedBox(height: 20),
          // Documents List
          Expanded(
            child: ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                return DocsTile(
                  imagePath: documents[index]["icon"],
                  title: documents[index]["title"],
                  date: documents[index]["date"],
                  color: documents[index]["color"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
