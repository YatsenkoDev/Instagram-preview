import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_preview/global/constants.dart';
import 'package:insta_preview/global/global_translations.dart';
import 'package:insta_preview/global/strings.dart' as string;

class AddAccountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          translations.string(string.addAccount),
          style: TextStyle(
              fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        Icon(
          kCupertinoAddIconData,
          color: kPinkColor,
        )
      ],
    );
  }
}
