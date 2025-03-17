

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:study_mate/config/cache/cache_const.dart';
import 'package:study_mate/config/cache/cache_helper.dart';
import 'package:study_mate/study_mate_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await CacheHelper.saveSecureData(key: CacheConstants.name, value: "salma");
  log("The name is: ${await CacheHelper.getSecureData(key: CacheConstants.name)}");

  runApp(const StudyMateApp());
}

