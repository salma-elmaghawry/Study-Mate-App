import 'package:flutter/material.dart';
import 'package:study_mate/Features/Summarization/presentation/widgets/upload_from_file_section.dart';

class SummarizationScreen extends StatelessWidget {
  const SummarizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summarization')),
      body: SingleChildScrollView(
        child: Column(
          children: [const SizedBox(height: 20), const UploadNewFileSection()],
        ),
      ),
    );
  }
}
