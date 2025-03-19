import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';

class CustomTabBar extends StatelessWidget {
  final List<Map<String, dynamic>> tabs;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CustomTabBar({
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(tabs.length, (index) {
        return GestureDetector(
          onTap: () => onTabSelected(index),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: selectedIndex == index
                  ? AppColors.primary.withOpacity(0.1)
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
              border: selectedIndex == index
                  ? Border.all(color: AppColors.primary, width: 1.5)
                  : null,
            ),
            child: Row(
              children: [
                Icon(
                  tabs[index]["icon"],
                  size: 18,
                  color: selectedIndex == index ? AppColors.primary : Colors.grey,
                ),
                SizedBox(width: 6),
                Text(
                  tabs[index]["label"],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: selectedIndex == index ? Colors.purple : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
