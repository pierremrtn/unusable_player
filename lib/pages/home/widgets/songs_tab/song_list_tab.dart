import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import 'package:unusable_player/pages/home/controllers/songs_controllers.dart';
import '../home_inner_list.dart';
import 'sliver_song_list.dart';

class SongListTab extends GetView<SongsController> {
  const SongListTab();

  @override
  Widget build(BuildContext context) {
    return HomeInnerList(
      storageKey: "home_songs",
      sliver: controller.obx(
        (List<up.Song>? songs) => SliverSongList(
          songs: songs ?? [],
        ),
        onEmpty: up.EmptyListIndicator.sliver(),
        onLoading: up.LoadingListIndicator.sliver(),
      ),
    );
  }
}
