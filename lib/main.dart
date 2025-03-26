
import 'package:flutter/material.dart';

import 'package:study_mate/study_mate_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 

  // await CacheHelper.init();
  // await CacheHelper.saveSecureData(key: CacheConstants.name, value: "salma");

  runApp(const StudyMateApp());
}
