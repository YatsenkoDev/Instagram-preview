import 'package:insta_preview/global/constants.dart';

class User {
  final String id;
  final String username;
  final String profilePicture;

  User.fromJson(final Map<String, dynamic> json)
      : id = json[kId],
        username = json[kUserName],
        profilePicture = json[kProfilePicture];

  User.empty()
      : id = null,
        username = null,
        profilePicture = null;
}
