import 'package:insta_preview/global/constants.dart';

class User {
  final String id;
  final String username;

  User.fromJson(final Map<String, dynamic> json)
      : id = json[kId],
        username = json[kUserName];

  User.empty()
      : id = null,
        username = null;
}
