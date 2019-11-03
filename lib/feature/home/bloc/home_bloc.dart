import 'package:insta_preview/api/model/user.dart';
import 'package:insta_preview/repository/repository_manager.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final RepositoryManager _repositoryManager = RepositoryManager();

  final _userListSubject = BehaviorSubject<List<User>>();

  Stream<List<User>> get userListStream => _userListSubject.stream;

  final _selectedUserSubject = BehaviorSubject<User>();

  Stream<User> get selectedUserStream => _selectedUserSubject.stream;

  Sink<User> get selectedUserSink => _selectedUserSubject.sink;

  final _photoListSubject = BehaviorSubject<List<String>>();

  Stream<List<String>> get photoListStream => _photoListSubject.stream;

  HomeBloc() {
    _repositoryManager.getUsers().then(_userListSubject.add);
    _repositoryManager
        .getLastSelectedUser()
        .then((l) {
          print('got dta ${l?.username}');
      _selectedUserSubject.add(l);
    });
    }

  void dispose() {
    _userListSubject.close();
    _photoListSubject.close();
    _selectedUserSubject.close();
  }
}
