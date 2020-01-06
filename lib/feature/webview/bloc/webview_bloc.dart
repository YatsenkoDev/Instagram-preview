import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:insta_preview/api/insta_keys.dart';
import 'package:insta_preview/global/logger.dart';

class WebViewBloc {
  static const logoutUrl = 'https://www.instagram.com/accounts/logout/';
  final _flutterWebViewPlugin = FlutterWebviewPlugin();
  final _logoutFinishedUrl = 'https://www.instagram.com/';
  final _authFinishedUrl = '${InstaKeys.redirectUrl}?code=';
  final _authUrl =
      'https://api.instagram.com/oauth/authorize?client_id=${InstaKeys.appId}&redirect_uri=${InstaKeys.redirectUrl}&scope=user_profile,user_media&response_type=code';
  final _codeEnding = '#_';

  WebViewBloc(BuildContext context) {
    _flutterWebViewPlugin.onUrlChanged.listen((url) async {
      Logger.print(url);
      if (url == _logoutFinishedUrl) {
        _flutterWebViewPlugin.reloadUrl(_authUrl);
      }
      if (url.contains(_authFinishedUrl)) {
        Navigator.pop(context,
            url.split(_authFinishedUrl)?.last?.split(_codeEnding)?.first);
      }
    });
  }

  void dispose() {
    _flutterWebViewPlugin.dispose();
  }
}
