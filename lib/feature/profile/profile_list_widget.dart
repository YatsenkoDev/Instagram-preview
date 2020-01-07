import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_preview/api/model/user.dart';
import 'package:insta_preview/widget/add_account_widget.dart';
import 'package:insta_preview/feature/profile/profile_list_element_widget.dart';
import 'package:insta_preview/feature/profile/profile_preview_widget.dart';

class ProfileExpandableListWidget extends StatelessWidget {
  final List<User> profileList;
  final Function(User) onUserSelected;
  final Stream<User> selectedUserStream;

  const ProfileExpandableListWidget({
    this.profileList,
    this.onUserSelected,
    this.selectedUserStream,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<User>(
      itemBuilder: (context) => profileList
          .map<PopupMenuItem<User>>(
            (user) => PopupMenuItem<User>(
              value: user,
              child: StreamBuilder<User>(
                  stream: selectedUserStream,
                  builder: (context, snapshot) {
                    return ProfileListElementWidget(
                      name: user.username,
                      selected: user.id == snapshot.data?.id,
                    );
                  }),
            ),
          )
          .toList()
            ..add(
              PopupMenuItem(
                value: User.empty(),
                child: AddAccountWidget(),
              ),
            ),
      child: StreamBuilder<User>(
          stream: selectedUserStream,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ProfilePreviewWidget(
                          name: snapshot.data.username,
                          bold: true,
                        ),
                        Icon(
                          Icons.expand_more,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink();
          }),
      onSelected: onUserSelected,
    );
  }
}
