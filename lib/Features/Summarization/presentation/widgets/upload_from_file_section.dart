import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Features/Summarization/presentation/widgets/file_uploaded_dialog.dart';

class UploadNewFileSection extends StatelessWidget {
  const UploadNewFileSection({super.key});

  Future<void> _pickFile(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        String? fileName = result.files.first.name;
        String? filePath = result.files.first.path;

        if (filePath != null) {
          showDialog(
            context: context,
            builder: (_) => FileUploadDialog(fileName: fileName),
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Invalid file path")));
        }
      }
    } on MissingPluginException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("File picker not supported: ${e.message}")),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Upload", style: AppTextStyles.quicksand18BoldB()),
        SizedBox(height: 5.h),
        Card(
          color: AppColors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Image.asset(AppImages.uploadFile, width: 50),
            title: Text(
              "Upload file to summarize with AI!",
              style: AppTextStyles.poppins16Regular(fontSize: 15.sp),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            subtitle: Text(
              "Your max: 20 MB", // Changed from MP to MB (megabytes)
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: AppTextStyles.poppins14Regular(color: AppColors.grey),
            ),
            contentPadding: EdgeInsets.only(left: 10, right: 2),
            onTap: () => _pickFile(context),
          ),
        ),
      ],
    );
  }
}
