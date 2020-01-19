import 'dart:convert';
import 'package:insta_preview/global/constants.dart';

class User {
  final String id;
  final String username;

  User.fromDecodedJson(final Map<String, dynamic> json)
      : id = json[kId],
        username = json[kUserName];

  String toJson() => jsonEncode({'id': id, 'username': username});

  User.empty()
      : id = null,
        username = null;

  bool isEmpty() => id == null && username == null;
}
