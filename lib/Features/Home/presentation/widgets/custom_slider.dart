import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';

class CustomSlider extends StatelessWidget {
  final double value; // Accept value from 1 to 1000

  const CustomSlider({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSlider(
      values: [value], // Set slider to display the provided value
      max: 1000,
      min: 1,
      selectByTap: false, // Disable tap selection
      jump: false, // Prevent jumping to new values
      disabled: true, // Completely disable user interaction
      trackBar: FlutterSliderTrackBar(
        activeTrackBarHeight: 10,
        inactiveTrackBarHeight: 10,
        activeTrackBar: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
          ),
        ),
        inactiveTrackBar: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      handler: FlutterSliderHandler(
        decoration: const BoxDecoration(),
        child: Container(
          width: 20,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: AppColors.primary, width: 3),
          ),
        ),
      ),
    );
  }
}
