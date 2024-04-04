import 'package:e_commerce_clean_architecture/config/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
  onGenerateRoute: (settings) => AppRoute.onGenerate(settings),
      );}
    );
  }
}
