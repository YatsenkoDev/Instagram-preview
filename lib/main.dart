import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:insta_preview/global/assets.dart';
import 'package:insta_preview/global/constants.dart';
import 'package:insta_preview/global/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: kRoutesMap,
      initialRoute: kSplashScreen,
      theme: _buildAppTheme(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale(kEnglishLocale),
        const Locale(kRussianLocale),
      ],
    );
  }

  ThemeData _buildAppTheme() {
    const textStyle = const TextStyle(
      color: Colors.white,
    );
    return ThemeData(
      primaryColor: kCyanColor,
      accentColor: kPinkColor,
      scaffoldBackgroundColor: Colors.white,
      cardColor: kCyanColor,
      fontFamily: kGilroyFont,
      textTheme: Theme.of(context).textTheme.copyWith(
            body1: textStyle,
            subtitle: textStyle,
          ),
    );
  }
}
