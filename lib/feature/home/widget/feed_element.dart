import 'package:flutter/material.dart';

class FeedElement extends StatelessWidget {
  final String photoUrl;

  const FeedElement({this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Image.network(photoUrl),
    );
  }
}