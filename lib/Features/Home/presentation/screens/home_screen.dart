import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/Theme/app_strings.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Core/widgets/custom_appBar.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';
import 'package:study_mate/Features/Home/presentation/widgets/badge_card.dart';
import 'package:study_mate/Features/Home/presentation/widgets/goal_widget.dart';
import 'package:study_mate/Features/Home/presentation/widgets/home_body.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppbar(),
          ),
          body: HomeBody(),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          //   backgroundColor: Colors.purple,
          //   child: Icon(Icons.add, color: Colors.white),
          // ),
        ),
      ),
    );
  }
}
