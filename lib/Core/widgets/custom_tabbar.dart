import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';

class TabBarWidget extends StatefulWidget {
  final List<TabItem> tabs;
  final Function(int) onTabChanged;
  final int initialIndex;

  const TabBarWidget({
    required this.tabs,
    required this.onTabChanged,
    this.initialIndex = 0,
  });

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(widget.tabs.length, (index) {
        final tab = widget.tabs[index];
        final isSelected = index == selectedIndex;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onTabChanged(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.grey,
                ),
                borderRadius: BorderRadius.circular(33),
                
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    width: 20,
                    tab.icon,
                    color: isSelected ? AppColors.primary : AppColors.grey,
                  ),

                  SizedBox(width: 5),
                  Text(
                    tab.label,
                    style: AppTextStyles.poppins14Regular(
                      color: isSelected ? AppColors.primary : AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

// Model for a Tab Item
class TabItem {
  final String label;
  final String icon;

  TabItem({required this.label, required this.icon});
}
