import 'package:insta_preview/api/model/user.dart';
import 'package:insta_preview/global/constants.dart';

class RepositoryManager {

  Future<User> getLastSelectedUser() async {
    return User.fromJson({kId: '123', kUserName: 'Selctd user', kProfilePicture: 'https://cdn2.iconfinder.com/data/icons/circle-avatars-1/128/050_girl_avatar_profile_woman_suit_student_officer-512.png'});
  }

  Future<List<User>> getUsers() async {
    return [User.fromJson({kId: '123', kUserName: 'Selctd user', kProfilePicture: 'https://cdn2.iconfinder.com/data/icons/circle-avatars-1/128/050_girl_avatar_profile_woman_suit_student_officer-512.png'}),
      User.fromJson({kId: '124', kUserName: '§ user', kProfilePicture: 'https://cdn2.iconfinder.com/data/icons/circle-avatars-1/128/050_girl_avatar_profile_woman_suit_student_officer-512.png'}),
      User.fromJson({kId: '125', kUserName: '2 user', kProfilePicture: 'https://cdn2.iconfinder.com/data/icons/circle-avatars-1/128/050_girl_avatar_profile_woman_suit_student_officer-512.png'}),];
  }
}