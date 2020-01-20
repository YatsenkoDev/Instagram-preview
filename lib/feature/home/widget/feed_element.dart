import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_preview/feature/home/model/photo_element.dart';

class FeedElement extends StatelessWidget {
  final int index;
  final PhotoElement photoElement;
  final Function(int) onLeave;
  final Function(int) onAccept;
  final VoidCallback onDragCompleted;
  final bool dragEnabled;

  const FeedElement({
    this.photoElement,
    this.index,
    this.onLeave,
    this.onAccept,
    this.onDragCompleted,
    this.dragEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 3;
    final element = AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: CachedNetworkImage(
          placeholder: (context, _) => Container(color: Colors.white),
          imageUrl: photoElement.photoUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
    return LongPressDraggable(
      feedback: Container(
        padding: const EdgeInsets.all(30),
        width: width,
        child: element,
      ),
      onDragStarted: () {
        onLeave(index);
      },
      onDragCompleted: onDragCompleted,
      child: DragTarget(
        builder: (context, _, __) => Stack(
          children: <Widget>[
            Container(
              color: Colors.black,
              margin: const EdgeInsets.all(1.0),
            ),
            Opacity(
              opacity: !photoElement.dragging ? 1 : 0.4,
              child: element,
            ),
          ],
        ),
        onLeave: (_) {
          onLeave(index);
        },
        onWillAccept: (_) {
          onAccept(index);
          return true;
        },
      ),
    );
  }
}
