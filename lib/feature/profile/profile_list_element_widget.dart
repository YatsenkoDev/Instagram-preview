import 'package:flutter/material.dart';
import 'package:insta_preview/feature/profile/profile_preview_widget.dart';

class ProfileListElementWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool selected;
  final _checkerSize = 22.0;

  const ProfileListElementWidget({
    this.imageUrl,
    this.name,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ProfilePreviewWidget(
              name: name,
              imageUrl: imageUrl,
              bold: false,
            ),
            Icon(
              selected ? Icons.check_box : Icons.check_box_outline_blank,
              color: selected ? Colors.pink[600] : Colors.white,
              size: _checkerSize,
            ),
          ],
        ),
        const Divider(height: 8.0),
      ],
    );
  }
}
