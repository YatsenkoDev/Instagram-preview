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

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: kRoutesMap,
      initialRoute: kSplashScreen,
      theme: _buildAppTheme(context),
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

  ThemeData _buildAppTheme(BuildContext context) {
    const textStyle = TextStyle(
      fontFamily: kGilroyFont,
      fontSize: 16,
      color: Colors.white,
    );
    return ThemeData(
      primaryColor: kBlueColor,
      accentColor: kPinkColor,
      scaffoldBackgroundColor: Colors.white,
      cardColor: kBlueColor,
      fontFamily: kGilroyFont,
      textTheme: Theme.of(context).textTheme.copyWith(
            body1: textStyle,
            subtitle: textStyle,
          ),
    );
  }
}
