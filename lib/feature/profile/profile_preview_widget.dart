import 'package:flutter/material.dart';

class ProfilePreviewWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool bold;
  final _avatarRadius = 21.0;

  const ProfilePreviewWidget({
    this.imageUrl,
    this.name,
    this.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        imageUrl != null
            ? CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: _avatarRadius,
              )
            : Icon(
                Icons.account_circle,
                color: Colors.white,
                size: _avatarRadius * 2,
              ),
        const SizedBox(width: 8.0),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 170.0),
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: bold ? FontWeight.w700 : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
