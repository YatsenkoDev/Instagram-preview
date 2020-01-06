import 'package:insta_preview/api/model/user.dart';
import 'package:insta_preview/global/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositoryManager {
  final _tokenKey = 'Token';
  final _tokenSalt = 'T';
  final _saltPosition = 10;

  Future<User> getLastSelectedUser() async {
    return User.fromJson({
      kId: '123',
      kUserName: 'Selctd user',
      kProfilePicture:
          'https://cdn2.iconfinder.com/data/icons/circle-avatars-1/128/050_girl_avatar_profile_woman_suit_student_officer-512.png'
    });
  }

  Future<List<User>> getUsers() async {
    return [
      User.fromJson({
        kId: '123',
        kUserName: 'Selctd user',
        kProfilePicture:
            'https://cdn2.iconfinder.com/data/icons/circle-avatars-1/128/050_girl_avatar_profile_woman_suit_student_officer-512.png'
      }),
      User.fromJson({
        kId: '124',
        kUserName: '§ ushh hhh  h h hh hhh h h h hh h h er',
        kProfilePicture:
            'https://cdn2.iconfinder.com/data/icons/circle-avatars-1/128/050_girl_avatar_profile_woman_suit_student_officer-512.png'
      }),
      User.fromJson({
        kId: '125',
        kUserName: '2 user',
        kProfilePicture:
            'https://cdn2.iconfinder.com/data/icons/circle-avatars-1/128/050_girl_avatar_profile_woman_suit_student_officer-512.png'
      }),
    ];
  }

  Future<void> saveToken(String token) async =>
      (await SharedPreferences.getInstance()).setString(_tokenKey,
          token.replaceRange(_saltPosition, _saltPosition, _tokenSalt));

  Future<String> getToken() async => (await SharedPreferences.getInstance())
      .getString(_tokenKey)
      .replaceRange(_saltPosition, _saltPosition + 1, '');
}
