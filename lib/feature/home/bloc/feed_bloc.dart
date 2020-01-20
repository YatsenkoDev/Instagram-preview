import 'package:insta_preview/feature/home/model/photo_element.dart';
import 'package:rxdart/rxdart.dart';

class FeedBloc {
  final _photosSubject = BehaviorSubject<List<PhotoElement>>();

  Stream<List<PhotoElement>> get photosStream => _photosSubject.stream;

  List<PhotoElement> _photos = [];

  FeedBloc(Stream<List<String>> photosStream) {
    photosStream.listen((photos) {
      _photos =
          photos.map((photoUrl) => PhotoElement(photoUrl: photoUrl)).toList();
      _photosSubject.add(_photos);
    });
  }

  int _leaveIndex;
  int _acceptIndex;

  void onAccept(int acceptIndex) {
    if (_leaveIndex != null && acceptIndex != _leaveIndex) {
      _acceptIndex = acceptIndex;
      PhotoElement leavePhoto = _photos[_leaveIndex].copyWith(dragging: true);
      _photos.removeAt(_leaveIndex);
      _photos.insert(acceptIndex, leavePhoto);
      _photosSubject.add(_photos);
    }
  }

  void onLeave(int leaveIndex) {
    _leaveIndex = leaveIndex;
  }

  void onDragCompleted() {
    _photos[_acceptIndex] = _photos[_acceptIndex].copyWith(dragging: false);
    _photosSubject.add(_photos);
    _leaveIndex = null;
  }

  void dispose() {
    _photosSubject.close();
  }
}
