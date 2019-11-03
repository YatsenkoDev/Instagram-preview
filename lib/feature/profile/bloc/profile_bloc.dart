import 'package:insta_preview/api/model/user.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {

  final _selectedUserSubject = BehaviorSubject<User>();

  Stream<User> get selectedUserStream => _selectedUserSubject.stream;

  void dispose() {
    _selectedUserSubject.close();
  }

}