import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/widgets/speeddialwidget.dart';
import 'package:study_mate/Features/FlashCards/flash_cards.dart';
import 'package:study_mate/Features/Home/presentation/screens/home_screen.dart';
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
        height: 65.h, // Keep the height at 70.h
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
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildNavItem(AppIcons.home, 0, 'Home'),
              buildNavItem(AppIcons.summarization, 1, 'Summarize'),
              SizedBox(width: 56.w), // Adjusted width for FloatingActionButton
              buildNavItem(AppIcons.flashcards, 2, 'Flashcards'),
              buildNavItem(AppIcons.pomodoro, 3, 'Pomodoro'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(String iconPath, int index, String title) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the content vertically
        children: [
          SvgPicture.asset(
            iconPath,
            color: isSelected ? AppColors.primary : Colors.grey,
            height: 20.h, // Reduced icon size
            width: 20.h,
          ),
          SizedBox(height: 4.h), // Space between icon and title
          Text(
            title,
            style: GoogleFonts.poppins(
              color: isSelected ? AppColors.primary : Colors.grey,
              fontSize: 10.sp, // Reduced font size
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
