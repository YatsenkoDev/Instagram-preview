import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_preview/api/api_manager.dart';
import 'package:insta_preview/api/model/user.dart';
import 'package:insta_preview/global/routes.dart';
import 'package:insta_preview/repository/repository_manager.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final _repositoryManager = RepositoryManager();

  final _apiManager = ApiManager();

  final _userListSubject = BehaviorSubject<List<User>>();

  Stream<List<User>> get userListStream => _userListSubject.stream;

  final _selectedUserSubject = BehaviorSubject<User>();

  Stream<User> get selectedUserStream => _selectedUserSubject.stream;

  final _photoListSubject = BehaviorSubject<List<String>>();

  Stream<List<String>> get photoListStream => _photoListSubject.stream;

  HomeBloc() {
    _loadInitialData();
  }

  void _loadInitialData() async {
    await _repositoryManager.initHive();
    _repositoryManager.getLastSelectedUser().then(setSelectedUser);
    _repositoryManager.getUsers().then(_userListSubject.add);
  }

  void setSelectedUser(User user, {BuildContext context}) {
    if (!user.isEmpty()) {
      _selectedUserSubject.add(user);
      _repositoryManager
        ..saveLastSelectedUser(user)
        ..getPhotos(user.id).then(_photoListSubject.add);
    } else if (context != null) {
      _addAccount(context);
    }
  }

  void _addAccount(BuildContext context) =>
      Navigator.pushNamed(context, kWebViewScreen)
          .then((c) => _onCodeReceived(c));

  void _onCodeReceived(String code) async {
    if (code?.isNotEmpty ?? false) {
      String token = await _apiManager.requestToken(code);
      _repositoryManager.saveToken(token);
      _apiManager.getUser(token).then((user) async {
        _selectedUserSubject.add(user);
        final newUserList = (await _userListSubject.first)..add(user);
        _userListSubject.add(newUserList);
        _apiManager.getPhotos(token).then((photos) {
          _photoListSubject.add(photos);
          _repositoryManager.savePhotos(photos, user.id);
        });
        _repositoryManager
            .saveUsers(newUserList.map((user) => user.toJson()).toList());
      });
    }
  }

  void dispose() {
    _userListSubject.close();
    _photoListSubject.close();
    _selectedUserSubject.close();
    _repositoryManager.dispose();
  }
}
