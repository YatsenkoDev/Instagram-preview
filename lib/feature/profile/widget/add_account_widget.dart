import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_preview/global/constants.dart';

class AddAccountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            'Добавить аккаунт', //todo replace
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
        Icon(
          kCupertinoAddIconData,
          color: kPinkColor,
        )
      ],
    );
  }
}
