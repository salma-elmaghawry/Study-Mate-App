import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_mate/Core/widgets/custom_appBar.dart';

class FlashCardsScreen extends StatelessWidget {
  const FlashCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppbar(
              name: "FlashCards",
            ), // Custom app bar with title
          ),

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [SizedBox(height: 10.h)],
            ),
          ),
        ),
      ),
    );
  }
}
