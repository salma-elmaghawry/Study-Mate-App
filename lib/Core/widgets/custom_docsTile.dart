import 'package:flutter/material.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/helpers/create_menu_items.dart';

class DocsTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;

  const DocsTile({
    required this.imagePath,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50),
        title: Text(
          title,
          style: AppTextStyles.poppins16Regular(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Text(
          "Last modified: $date",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: AppTextStyles.poppins14Regular(color: AppColors.grey),
        ),
        contentPadding: EdgeInsets.only(left: 10, right: 2),
        trailing: PopupMenuButton<String>(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          onSelected: (value) {
            if (value == 'rename') {
              renameAction(context);
            } else if (value == 'delete') {
              deleteAction(context);
            } else if (value == 'share') {
              shareAction(context);
            }
          },
          itemBuilder:
              (context) => [
                buildPopupMenuItem("Rename", AppIcons.rename, "rename"),
                buildPopupMenuItem("Delete", AppIcons.delete, "delete"),
                buildPopupMenuItem("Share", AppIcons.share, "share"),
              ],
        ),
      ),
    );
  }

  // Helper function to create menu items
}
