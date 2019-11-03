import 'package:flutter/material.dart';
import 'package:insta_preview/feature/home/widget/feed_element.dart';

class FeedPage extends StatelessWidget {
  final Stream<List<String>> photoListStream;

  const FeedPage({this.photoListStream});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: StreamBuilder<List<String>>(
        stream: photoListStream,
        builder: (context, snapshot) => !snapshot.hasData
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.count(
                crossAxisCount: 3,
                children: snapshot.data
                    .map((photo) => FeedElement(
                          photoUrl: photo,
                        ))
                    .toList()),
      ),
    );
  }
}
