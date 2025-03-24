import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_images.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Core/widgets/custom_iconButton.dart';
import 'package:study_mate/Features/onboarding/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updatePageIndex);
  }

  @override
  void dispose() {
    _controller.removeListener(_updatePageIndex);
    _controller.dispose();
    super.dispose();
  }

  void _updatePageIndex() {
    setState(() {
      _currentPageIndex = _controller.page?.round() ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                children: [
                  OnboardingPage(
                    image: AppImages.onboarding1,
                    title: 'Stay Motivated with ',
                    highlight: 'Goals & Badges!',
                    description:
                        'Earn badges as you complete tasks and track your progress with personalized goals.',
                  ),
                  OnboardingPage(
                    image: AppImages.onboarding2,
                    title: 'Chat with Your ',
                    highlight: 'Smart Assistant',
                    description:
                        'Need help understanding a concept? Our AI chatbot is here to answer.',
                  ),
                  OnboardingPage(
                    image: AppImages.onboarding3,
                    title: 'Master Concepts with ',
                    highlight: 'Flashcards',
                    title2: ' & More!',
                    description:
                        'Generate flashcards from your summaries, take notes, and more...',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40.0,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Show the backward button only on pages 2 and 3
                  if (_currentPageIndex > 0)
                    CustomIconButton(
                      assetname: AppIcons.backword,
                      isFilled: false,
                      onPressed: () {
                        _controller.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    )
                  else
                    SizedBox(width: 48), // Placeholder to maintain spacing
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotHeight: 13,
                      dotWidth: 13,
                      dotColor: AppColors.grey.withAlpha(100),
                      activeDotColor: AppColors.primary,
                    ),
                  ),
                  CustomIconButton(
                    assetname: AppIcons.forward,
                    isFilled: true,
                    onPressed: () {
                      if (_currentPageIndex < 2) {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushNamed(context, Routes.nav_bar);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
