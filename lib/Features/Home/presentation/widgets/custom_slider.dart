import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';

class CustomSlider extends StatefulWidget {
  final double value; // Accept value from 1 to 1000

  const CustomSlider({Key? key, required this.value}) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value; // Initialize with the provided value
  }

  @override
  void didUpdateWidget(covariant CustomSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      setState(() {
        _value = widget.value; // Update slider position dynamically
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSlider(
      values: [_value],
      max: 1000,
      min: 1,
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
