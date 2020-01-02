import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_preview/api/model/user.dart';
import 'package:insta_preview/feature/home/bloc/home_bloc.dart';
import 'package:insta_preview/feature/home/page/feed_page.dart';
import 'package:insta_preview/feature/profile/profile_list_widget.dart';
import 'package:insta_preview/global/constants.dart';
import 'package:insta_preview/global/global_translations.dart';
import 'package:insta_preview/global/strings.dart' as string;
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<HomeBloc>(
      create: (context) => HomeBloc(),
      dispose: (context, value) => value.dispose(),
      child: DefaultTabController(
        length: 2,
        child: Consumer<HomeBloc>(builder: (context, homeBloc, _) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              titleSpacing: 0,
              backgroundColor: Theme.of(context).primaryColor,
              title: StreamBuilder<List<User>>(
                  initialData: const [],
                  stream: homeBloc.userListStream,
                  builder: (context, snapshot) {
                    return ProfileExpandableListWidget(
                      profileList: snapshot.data,
                      selectedUserStream: homeBloc.selectedUserStream,
                      onUserSelected: homeBloc.setSelectedUser,
                    );
                  }),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    kCupertinoAddIconData,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.sync,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(child: Text(translations.string(string.feed))),
                  Tab(child: Text('HashTags')),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                FeedPage(photoListStream: homeBloc.photoListStream),
                Container(
                  color: Colors.grey[100],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
