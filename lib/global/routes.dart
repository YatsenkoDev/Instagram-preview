import 'package:insta_preview/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:insta_preview/feature/home/home_screen.dart';

const kSplashScreen = "/splash";
const kHomeScreen = "/home";

Map<String, WidgetBuilder>  kRoutesMap = {
  kSplashScreen: (context) => SplashScreen(),
  kHomeScreen: (context) => HomeScreen(),
};
