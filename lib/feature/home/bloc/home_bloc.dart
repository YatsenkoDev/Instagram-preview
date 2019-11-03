import 'package:insta_preview/api/model/user.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {

  final  _selectedProfileSubject =
  BehaviorSubject<List<User>>();

  Stream<List<User>> get profileListStream =>
      _selectedProfileSubject.stream;


  final _photoListSubject = BehaviorSubject<List<String>>();

  Stream<List<String>> get photoListStream => _photoListSubject.stream;

  void dispose() {
    _selectedProfileSubject.close();
    _photoListSubject.close();
  }
}
