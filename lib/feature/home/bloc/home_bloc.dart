import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_preview/api/model/user.dart';
import 'package:insta_preview/feature/webview/screen/webview_screen.dart';
import 'package:insta_preview/repository/repository_manager.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final RepositoryManager _repositoryManager = RepositoryManager();

  final _userListSubject = BehaviorSubject<List<User>>();

  Stream<List<User>> get userListStream => _userListSubject.stream;

  final _selectedUserSubject = BehaviorSubject<User>();

  Stream<User> get selectedUserStream => _selectedUserSubject.stream;

  final _photoListSubject = BehaviorSubject<List<String>>();

  Stream<List<String>> get photoListStream => _photoListSubject.stream;

  HomeBloc() {
    _repositoryManager.getUsers().then(_userListSubject.add);
    _repositoryManager.getLastSelectedUser().then(_selectedUserSubject.add);
  }

  void setSelectedUser(User user, BuildContext context) {
    if (user.id != null) {
      _selectedUserSubject.add(user);
    } else {
      _addAccount(context);
    }
  }

  void _addAccount(BuildContext context) => Navigator.push(
          context, MaterialPageRoute(builder: (context) => WebViewScreen()))
      .then(_onCodeReceived);

  void _onCodeReceived(String code) {
    if (code?.isNotEmpty ?? false) {}
  }

  void dispose() {
    _userListSubject.close();
    _photoListSubject.close();
    _selectedUserSubject.close();
  }
}
