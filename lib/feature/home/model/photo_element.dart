class PhotoElement {
  final String photoUrl;
  final bool dragging;

  PhotoElement({this.photoUrl, this.dragging = false});

  PhotoElement copyWith({String photoUrl, bool dragging}) => PhotoElement(
        photoUrl: photoUrl ?? this.photoUrl,
        dragging: dragging ?? this.dragging,
      );
}
