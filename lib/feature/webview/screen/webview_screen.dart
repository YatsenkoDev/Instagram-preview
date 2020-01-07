import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:insta_preview/feature/webview/bloc/webview_bloc.dart';
import 'package:insta_preview/global/global_translations.dart';
import 'package:provider/provider.dart';
import 'package:insta_preview/global/strings.dart' as string;

class WebViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<WebViewBloc>(
      create: (context) => WebViewBloc(context),
      lazy: false,
      dispose: (context, bloc) => bloc.dispose(),
      child: WebviewScaffold(
        resizeToAvoidBottomInset: true,
        url: WebViewBloc.logoutUrl,
        appBar: AppBar(
          title: Text(
            translations.string(string.instaAuth),
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        withLocalStorage: false,
        hidden: true,
        clearCache: true,
        clearCookies: true,
      ),
    );
  }
}
