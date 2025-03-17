import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/widgets/speeddialwidget.dart';
import 'package:study_mate/Features/FlashCards/flash_cards.dart';
import 'package:study_mate/Features/Home/home_screen.dart';
import 'package:study_mate/Features/Pomodoro/pomodoro_screen.dart';
import 'package:study_mate/Features/Summarization/summarization_screen.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SummarizationScreen(),
    FlashCardsScreen(),
    PomodoroScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display selected page

      floatingActionButton: Speeddialwidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              blurRadius: 10, // Blur effect
              spreadRadius: 1, // How much it spreads
              offset: Offset(0, -2), // Shadow position (upward)
            ),
          ],
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: AppColors.white,

          height: 65.h,

          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavItem(AppIcons.home, 0),
              buildNavItem(AppIcons.summarization, 1),
              SizedBox(width: 48), // Space for FloatingActionButton
              buildNavItem(AppIcons.flashcards, 2),
              buildNavItem(AppIcons.pomodoro, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(String iconPath, int index) {
    bool isSelected = _selectedIndex == index;

    return IconButton(
      icon: SvgPicture.asset(
        iconPath,
        color: isSelected ? AppColors.primary : Colors.grey,
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}
