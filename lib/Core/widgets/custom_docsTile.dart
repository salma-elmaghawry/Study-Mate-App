import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';

class DocsTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final Color color;

  const DocsTile({
    required this.imagePath,
    required this.title,
    required this.date,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Image.asset(imagePath),
        title: Text(title, style: AppTextStyles.poppins16Regular()),
        subtitle: Text(
          "Last modified: $date",
          style: AppTextStyles.poppins16Regular(color: Colors.grey),
        ),
        trailing: IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            // Implement menu actions
          },
        ),
      ),
    );
  }
}
