import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

GlobalTranslations translations = GlobalTranslations();

class GlobalTranslations {
  Map<String, dynamic> _localizedStrings;

  static final GlobalTranslations _translations =
      GlobalTranslations._internal();

  GlobalTranslations._internal();

  factory GlobalTranslations() => _translations;

  String string(String key) {
    return _localizedStrings != null
        ? _localizedStrings.containsKey(key)
            ? _localizedStrings[key]
            : 'String $key not found'
        : '';
  }

  Future<void> loadLocalizationStrings(BuildContext context) async {
    String jsonContent = await rootBundle.loadString(
        'assets/locale/locale_${Localizations.localeOf(context).languageCode}.json');
    _localizedStrings = json.decode(jsonContent);
  }
}
