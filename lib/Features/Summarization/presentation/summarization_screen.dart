import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_mate/Core/widgets/custom_appBar.dart';
import 'package:study_mate/Features/Summarization/presentation/widgets/Summarized_file_section.dart';
import 'package:study_mate/Features/Summarization/presentation/widgets/search_section.dart';
import 'package:study_mate/Features/Summarization/presentation/widgets/upload_from_file_section.dart';

class SummarizationScreen extends StatelessWidget {
  const SummarizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppbar(name: "Summarize"),
          ),

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                SearchSection(),
                SizedBox(height: 5.h),
                SummarizedFileSection(),
                SizedBox(height: 5.h),
                UploadNewFileSection(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
