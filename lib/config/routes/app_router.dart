import 'package:e_commerce_clean_architecture/features/home/presentation/pages/home_screen.dart';
import 'package:e_commerce_clean_architecture/features/login/presentation/pages/login_screen.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/presentation/pages/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/components/reusable_components.dart';

class AppRoutesName{
  static const String login="/";
  static const String home="home";
  static const String signUp="signUp";
}

class AppRoute{
 static Route onGenerate(RouteSettings settings){
   switch(settings.name){
     case AppRoutesName.login:
       return MaterialPageRoute(builder: (context) => LoginScreen());
     case AppRoutesName.home:
       return MaterialPageRoute(builder: (context) => HomeScreen());
     case AppRoutesName.signUp:
       return MaterialPageRoute(builder: (context) => SignUpScreen());
     default :
       return MaterialPageRoute(builder: (context) => unDefinedRoute());

   }
 }

}
