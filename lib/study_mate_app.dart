import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/routes/app_router.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/config/cache/cache_const.dart';

class StudyMateApp extends StatelessWidget {
  const StudyMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
        onGenerateRoute: AppRouter().generateRoute,
        initialRoute: isLoggedIn ? Routes.home : Routes.nav_bar,
      ),
    );
  }
}
