import 'package:flutter/material.dart';
import 'package:insta_preview/feature/profile/widget/profile_preview_widget.dart';

const _checkerSize = 10.0;

class ProfileListElementWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool selected;

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
          mainAxisSize: MainAxisSize.min,
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
        const Divider(height: 4.0),
      ],
    );
  }
}
