import 'package:e_commerce_clean_architecture/core/cache/shared_pref.dart';
import 'package:e_commerce_clean_architecture/my_app.dart';
import 'package:flutter/material.dart';

import 'injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  configureDependencies();
  runApp(const MyApp());
}


