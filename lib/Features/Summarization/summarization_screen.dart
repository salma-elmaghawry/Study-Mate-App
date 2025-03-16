import 'package:flutter/material.dart';

class SummarizationScreen extends StatelessWidget {
  const SummarizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summarization'),
      ),
      body: const Center(
        child: Text(
          'This is the summarization screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}