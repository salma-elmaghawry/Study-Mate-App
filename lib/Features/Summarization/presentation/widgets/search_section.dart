import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/widgets/custom_text_field.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "Search",
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(AppIcons.search, color: Colors.black),
      ),
    );
  }
}
