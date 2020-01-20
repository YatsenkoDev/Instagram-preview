import 'package:flutter/material.dart';
import 'package:insta_preview/feature/home/bloc/feed_bloc.dart';
import 'package:insta_preview/feature/home/model/photo_element.dart';
import 'package:insta_preview/feature/home/widget/feed_element.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatelessWidget {
  final Stream<List<String>> photoListStream;

  const FeedPage({this.photoListStream});

  @override
  Widget build(BuildContext context) {
    return Provider<FeedBloc>(
      create: (context) => FeedBloc(photoListStream),
      dispose: (context, bloc) => bloc.dispose(),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Consumer<FeedBloc>(
          builder: (context, bloc, _) => StreamBuilder<List<PhotoElement>>(
            stream: bloc.photosStream,
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const Center(
                      child:
                          SizedBox(), //CircularProgressIndicator(), //todo return circular indicator
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => FeedElement(
                        photoElement: snapshot.data[index],
                        index: index,
                        onAccept: bloc.onAccept,
                        onLeave: bloc.onLeave,
                        onDragCompleted: bloc.onDragCompleted,
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
