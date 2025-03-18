import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';

class GoalTile extends StatefulWidget {
  final String title;
  final String progress;
  final int xp;
  final bool isCompleted;

  GoalTile({
    required this.title,
    required this.progress,
    required this.xp,
    this.isCompleted = false,
  });

  @override
  _GoalTileState createState() => _GoalTileState();
}

class _GoalTileState extends State<GoalTile> {
  late bool _isCompleted;

  @override
  void initState() {
    super.initState();
    _isCompleted = widget.isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shadowColor: Colors.black,
      child: ListTile(
        leading: Checkbox(
          value: _isCompleted,
          activeColor: AppColors.primary,
          onChanged: (value) {
            setState(() {
              _isCompleted = value!;
              print('Checkbox state changed: $_isCompleted'); // Debug print
            });
          },
        ),
        title: Text(widget.title, style: AppTextStyles.poppins14Regular()),
        subtitle: Row(
          children: [
            Text("Gain ", style: AppTextStyles.poppins12Regular()),
            Text(
              "${widget.xp} XP",
              style: AppTextStyles.poppins12Regular(
                color: AppColors.primary,
                fontSize: 14,
              ),
            ),
          ],
        ),
        trailing: Text(
          widget.progress,
          style: AppTextStyles.poppins14Regular(fontSize: 14),
        ),
      ),
    );
  }
}
