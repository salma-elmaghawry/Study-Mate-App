import 'package:flutter/material.dart';

class FlashCards extends StatelessWidget {
  const FlashCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flash Cards'),
      ),
      body: const Center(
        child: Text(
          'This is the flash cards screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}