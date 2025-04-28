import 'package:flutter/material.dart';
import 'package:study_mate/Core/di/dependency_injection.dart';
import 'package:study_mate/config/cache/cache_const.dart';
import 'package:study_mate/config/cache/cache_helper.dart';

import 'package:study_mate/study_mate_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  //await ScreenUtil.ensureScreenSize();

  await CacheHelper.init();

  runApp(const StudyMateApp());
}

checkLoginStatus() async {
  String? token = await CacheHelper.getSecureData(key: CacheConstants.userToken);
  if (token != null && token.isNotEmpty) {
    isLoggedIn = true;
  } else {
    isLoggedIn = false;
  }
}
