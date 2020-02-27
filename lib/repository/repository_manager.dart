import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:insta_preview/api/model/user.dart';
import 'package:path_provider/path_provider.dart';

const _singleBoxKey = 'stringBox2';
const _listBoxKey = 'listBox2';
const _tokenKey = 'token2';
const _usersKey = 'users2';
const _photosKey = 'photos2';
const _lastSelectedUser = 'last2';

class RepositoryManager {
  Future<void> initHive() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  }

  Future<User> getLastSelectedUser() async {
    final user = await (await Hive.openLazyBox<String>(_singleBoxKey))
        .get(_lastSelectedUser);
    return user != null ? User.fromDecodedJson(jsonDecode(user)) : User.empty();
  }

  void saveLastSelectedUser(User user) async =>
      (await Hive.openLazyBox<String>(_singleBoxKey))
          .put(_lastSelectedUser, user.toJson());

  Future<List<User>> getUsers() async =>
      (await (await Hive.openLazyBox<List<String>>(_listBoxKey))
              .get(_usersKey, defaultValue: []))
          .map((user) => User.fromDecodedJson(jsonDecode(user)))
          .toList();

  void saveUsers(List<String> users) async {
    (await Hive.openLazyBox<List<String>>(_listBoxKey)).put(_usersKey, users);
  }

  void savePhotos(List<String> photos, String userId) async {
    (await Hive.openLazyBox<List<String>>(_listBoxKey))
        .put(_photosKey + userId, photos);
  }

  Future<List<String>> getPhotos(String userId) async =>
      (await Hive.openLazyBox<List<String>>(_listBoxKey))
          .get(_photosKey + userId);

  void saveToken(String token) async =>
      (await Hive.openLazyBox<String>(_singleBoxKey)).put(_tokenKey, token);

  Future<String> getToken() async =>
      (await Hive.openLazyBox<String>(_singleBoxKey)).get(_tokenKey);

  void dispose() {
    Hive.close();
  }
}
