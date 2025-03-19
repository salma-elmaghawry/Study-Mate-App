import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';

PopupMenuItem<String> buildPopupMenuItem(
  String text,
  String icon,
  String value,
) {
  return PopupMenuItem<String>(
    value: value,
    child: Row(
      children: [
        SvgPicture.asset(icon),
        SizedBox(width: 10),
        Text(
          text,
          style: AppTextStyles.poppins14Regular(color: AppColors.grey),
        ),
      ],
    ),
  );
}

// Actions for menu items
void renameAction(BuildContext context) {
  var title;
  TextEditingController _controller = TextEditingController(text: title);
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text("Rename Document"),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: "Enter new name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                print("Renamed to: ${_controller.text}");
                Navigator.pop(context);
              },
              child: Text("Rename"),
            ),
          ],
        ),
  );
}

void deleteAction(BuildContext context) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          icon: SvgPicture.asset(AppIcons.delete),
          title: Text(
            "Delete Document",
            style: AppTextStyles.poppins14Regular(color: AppColors.grey),
          ),
          content: Text(
            "Are you sure you want to delete this document?",
            style: AppTextStyles.poppins14Regular(color: AppColors.grey),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: AppTextStyles.poppins14Regular(color: AppColors.grey),
              ),
            ),
            TextButton(
              onPressed: () {
                var title;
                print("Deleted $title");
                Navigator.pop(context);
              },
              child: Text(
                "Delete",
                style: AppTextStyles.poppins14Regular(color: AppColors.red),
              ),
            ),
          ],
        ),
  );
}

void shareAction(BuildContext context) {
  //print("Sharing $title");
  var title;
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text("Shared $title")));
}
