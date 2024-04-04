import 'package:e_commerce_clean_architecture/features/home/presentation/pages/home_screen.dart';
import 'package:e_commerce_clean_architecture/features/login/presentation/pages/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/components/reusable_components.dart';

class AppRoutesName{
  static const String login="/";
  static const String home="home";
}

class AppRoute{
 static Route onGenerate(RouteSettings settings){
   switch(settings.name){
     case AppRoutesName.login:
       return MaterialPageRoute(builder: (context) => LoginScreen());
     case AppRoutesName.home:
       return MaterialPageRoute(builder: (context) => HomeScreen());
     default :
       return MaterialPageRoute(builder: (context) => unDefinedRoute());

   }
 }

}
