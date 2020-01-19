import 'package:flutter/material.dart';
import 'package:insta_preview/global/constants.dart';
import 'package:insta_preview/global/global_translations.dart';
import 'package:insta_preview/global/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: kSplashDuration))
        .then((_) async {
      await translations.loadLocalizationStrings(context);
      Navigator.pushReplacementNamed(context, kHomeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kBlueColor);
  }
}
