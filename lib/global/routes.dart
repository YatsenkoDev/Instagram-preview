import 'package:insta_preview/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:insta_preview/feature/home/screen/home_screen.dart';
import 'package:insta_preview/feature/webview/screen/webview_screen.dart';

const kSplashScreen = "/splash";
const kHomeScreen = "/home";
const kWebViewScreen = "/auth";

Map<String, WidgetBuilder>  kRoutesMap = {
  kSplashScreen: (context) => SplashScreen(),
  kHomeScreen: (context) => HomeScreen(),
  kWebViewScreen: (context) => WebViewScreen(),
};
