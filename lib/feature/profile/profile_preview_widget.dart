import 'package:flutter/material.dart';

class ProfilePreviewWidget extends StatelessWidget {
  final String name;
  final bool bold;

  const ProfilePreviewWidget({
    this.name,
    this.bold,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
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
    );
  }
}
