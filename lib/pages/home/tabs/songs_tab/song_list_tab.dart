import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:unusable_player/unusable_player.dart' as up;

import '../home_inner_list.dart';
import 'audio_files_loader.dart';
import 'sliver_song_list.dart';

class SongListTab extends GetView<AudioFilesLoader> {
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
