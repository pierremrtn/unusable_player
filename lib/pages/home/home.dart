import 'package:flutter/material.dart';
import 'package:unusable_player/widgets/widgets.dart' as up;

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: up.SliverPage(
        padding: EdgeInsets.zero,
        slivers: [
          SliverAppBar(
            flexibleSpace: Placeholder(),
            backgroundColor: Colors.white,
            expandedHeight: 160,
            toolbarHeight: up.kTabBarHeight,
            bottom: up.TabBar(
              tabs: ["a", "b", "c"],
            ),
            primary: true,
            floating: true,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, __) => up.SongCard(),
            ),
          ),
        ],
      ),
    );
  }
}
