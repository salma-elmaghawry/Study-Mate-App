import 'package:flutter/material.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Music')),
      body: const Center(
        child: Text(
          'This is the music screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}