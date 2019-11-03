import 'package:flutter/material.dart';
import 'package:insta_preview/global/constants.dart';
import 'package:insta_preview/global/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1))
        .then((_) => Navigator.pushReplacementNamed(context, kHomeScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kCyanColor);
  }
}
