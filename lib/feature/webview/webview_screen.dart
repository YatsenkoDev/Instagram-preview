import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({this.url});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  final String logoutUrl = 'https://www.instagram.com/accounts/logout/';
  final String logoutFinishedUrl = 'https://www.instagram.com/';

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onUrlChanged.listen((url) async {
      if (url == logoutFinishedUrl) {
        flutterWebViewPlugin.reloadUrl(widget.url);
      }
      print(url);
      if (url.contains('access_token')) {
        String token = url.split('access_token=')?.last;
        if (token != null && token.isNotEmpty) {
         // BlockProviderContainer.of(context).apiBlock.setupToken(token);
        }
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: logoutUrl,
      appBar: AppBar(
        title: const Text('Авторизация в Инстаграм',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            )),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      withLocalStorage: false,
      hidden: true,
      clearCache: true,
      clearCookies: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    flutterWebViewPlugin.dispose();
  }
}
