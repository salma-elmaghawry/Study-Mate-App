import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/di/dependency_injection.dart';
import 'package:study_mate/Features/Summarization/data/Summarization_repo.dart';
import 'package:study_mate/Features/Summarization/domain/cubit/summarization_cubit.dart';
import 'package:study_mate/Features/Summarization/presentation/summarizing_process_screen.dart';

class FileUploadDialog extends StatelessWidget {
  final String fileName;
  final File file;

  const FileUploadDialog({
    super.key,
    required this.fileName,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Center(
        child: Text(
          'File uploaded successfully!',
          style: AppTextStyles.quicksand18BoldB(),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Image.asset(AppImages.pdf),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    fileName,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.poppins14Regular(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: AppTextStyles.poppins12Regular(
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // close dialog first
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder:
                          (_) => BlocProvider.value(
                            value: context.read<SummarizeCubit>(),
                            child: const _SummarizeDialog(),
                          ),
                    );

                    final cubit = context.read<SummarizeCubit>();
                    if (cubit.state is! SummarizeLoading) {
                      cubit.summarizePdf(file);
                    }
                  },
                  child: Text(
                    "Summarize",
                    style: AppTextStyles.poppins14Bold(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummarizeDialog extends StatelessWidget {
  const _SummarizeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SummarizeCubit, SummarizeState>(
      listener: (context, state) async {
        if (state is SummarizeSuccess) {
          Navigator.pop(context); // Close loading
          await Future.delayed(const Duration(milliseconds: 100));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Summarization completed!")),
          );
          // OpenFile.open(state.file.path);
        } else if (state is SummarizeError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Error: ${state.message}")));
        }
      },
      builder: (context, state) {
        if (state is SummarizeLoading) {
          return SummarizingProcessScreen();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
