import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_preview/api/model/user.dart';
import 'package:insta_preview/feature/profile/bloc/profile_bloc.dart';
import 'package:insta_preview/feature/profile/widget/add_account_widget.dart';
import 'package:insta_preview/feature/profile/widget/profile_list_element_widget.dart';
import 'package:insta_preview/feature/profile/widget/profile_preview_widget.dart';
import 'package:provider/provider.dart';

class ProfileExpandableListWidget extends StatelessWidget {
  final List<User> profileList;
  final User selectedUser;
  final Function(User) onUserSelected;

  const ProfileExpandableListWidget({
    this.profileList,
    this.selectedUser,
    this.onUserSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (context) => ProfileBloc(),
      dispose: (context, value) => value.dispose(),
      child: Consumer<ProfileBloc>(builder: (_, profileBloc, __) {
        return PopupMenuButton<User>(
            itemBuilder: (context) => profileList
                .map<PopupMenuItem<User>>((user) => PopupMenuItem<User>(
                      value: user,
                      child: StreamBuilder<User>(
                          initialData: selectedUser,
                          stream: profileBloc.selectedUserStream,
                          builder: (context, snapshot) {
                            return ProfileListElementWidget(
                              imageUrl: user.profilePicture,
                              name: user.username,
                              selected: user.id == snapshot.data?.id,
                            );
                          }),
                    ))
                .toList()
                  ..add(
                    PopupMenuItem(
                      value: null,
                      child: AddAccountWidget(),
                    ),
                  ),
            child: StreamBuilder<User>(
                stream: profileBloc.selectedUserStream,
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ProfilePreviewWidget(
                          name: snapshot.data.username,
                          imageUrl: snapshot.data.profilePicture,
                          bold: true,
                        ),
                        Icon(
                          Icons.expand_more,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  );
                }),
            onSelected: onUserSelected);
      }),
    );
  }

//  void _addAccount() {
//    print('_addAccount');
//    Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (context) => WebViewScreen(url: _getAuthUrl())));
//  }
//
//  String _getAuthUrl() {
//    return "https://api.instagram.com/oauth/authorize?client_id=${InstaKeys.clientId}&redirect_uri=${InstaKeys.redirectUrl}&response_type=token";
//  }
}
